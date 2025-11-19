#!/bin/bash

DIR=$(pwd)
SEARCH_VENV=".venv*"
SEARCH_LOGS="logs*"
LOG_DIR="$DIR/logs"
LOG_FILE="${LOG_DIR}/setup.log"
# FIND_VENV=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_VENV" -print0 | xargs -0)
# FIND_LOGS=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_LOGS" -print0 | xargs -0)
FIND_LOGS=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_LOGS" -print -quit)
IGNORE_FILE="$DIR/.gitignore"
IGNORE_RULES=("__pycache__/" ".idea/" ".vscode/" ".DS_Store" ".env" "build/" "dist/" "wheels/" ".pytest_cache" "*.log" "*.tmp" "venv/" ".venv/" "env/")
PACKAGES=("pandas" "numpy" "polars" "pyarrow" "SQLAlchemy" "requests" "beautifulsoup4")

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'


# Create log directory and file if they don't exist
create_log_dir_file() {
    if [[ ! -d "$LOG_DIR" ]]; then
        mkdir -p "$LOG_DIR"
    fi
    
    if [[ ! -f "$LOG_FILE" ]]; then
        touch "$LOG_FILE"
    fi
}


# Create function for log message
log_message() {
    local log_type="$1"
    local message="$2"
    local color_code=""
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    case "$log_type" in
        SUCCESS)
            color_code="${GREEN}"
            ;;
        WARNING)
            color_code="${YELLOW}"
            ;;
        ERROR)
            color_code="${RED}"
            ;;
        INFO)
            color_code="${CYAN}"
            ;;
        *)
            color_code="${NC}"
            ;;
    esac

    # print to log file and console with color
    echo -e "${color_code}[${log_type}] [${timestamp}] ${message}${NC}" | tee -a "$LOG_FILE"
}


# Creating a function for checking if a virtual environment exist
# If yes, activate the virtual environmet
# If not create one and activate
vir_env() {
    FIND_VENV=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_VENV" -print -quit)
    if [[ -n "$FIND_VENV" ]]; then
        log_message INFO "Virtual environment exists: $FIND_VENV"
        if [[ -f "$FIND_VENV/bin/activate" ]]; then
            source "$FIND_VENV/bin/activate"
            log_message SUCCESS "Virtual environment activated: $FIND_VENV"
        else
            log_message ERROR "Activate script not found in $FIND_VENV/bin/"
            return 1
        fi
    else
        log_message INFO "No virtual environment found in "$DIR""
        echo "Enter a name for your virtual environment:"
        read venv_name
        log_message INFO "Creating virtual environment: $venv_name"
        python3 -m venv "$venv_name"
        if [[ -f "$DIR/$venv_name/bin/activate" ]]; then
            log_message SUCCESS "Created virtual environment: $venv_name"
            source "$DIR/$venv_name/bin/activate"
        else
            log_message ERROR "Activate script not found in $DIR/$venv_name/bin/"
            return 1
        fi
    fi
}


upgrade_pip() {
    # Check if pip is installed
    # Installs the latest pip version
    if  ! command -v pip &> /dev/null ; then
        log_message INFO "pip not installed. Installing latest pip..."
        python3 -m ensurepip --upgrade --default-pip
        if [ $? -eq 0 ]; then
            log_message SUCCESS "latest pip installed successfully."
        else
            log_message ERROR "Failed to install/upgrade pip."
            return 1
        fi
    else
        log_message INFO "pip is already installed. Upgrading to the latest..."
        python3 -m pip install --upgrade pip
        if [ $? -eq 0 ]; then
            log_message SUCCESS "pip upgraded successfully."
        else
            log_message ERROR "Failed to upgrade pip."
            return 1
        fi
    fi
}


# Create gitignore file function
gitignore() {
    if [[ ! -f "$IGNORE_FILE" ]]; then
        log_message INFO "Creating $IGNORE_FILE and adding igore rules..."
        # for element in "${IGNORE_RULES[@]}"; do
        for element in "${IGNORE_RULES[@]}"; do
            echo "$element" >> "$IGNORE_FILE"
        done
        log_message SUCCESS "$IGNORE_FILE successfully created with ignore rules"
    else
        log_message INFO "$IGNORE_FILE already exists."
    fi
}


# Install python packages
install_packages() {
    log_message INFO "Installing Python packages..."
    # for package in "${PACKAGES[@]}"; do
    for package in "${PACKAGES[@]}"; do
        log_message INFO "Installing $package..."
        pip install "$package"
        if [ $? -ne 0 ]; then
            log_message ERROR " Error installing $package. Exiting"
            exit 1
        fi
    done
    
    log_message SUCCESS "All packages installed successfully."
}


# Main function
main() {
    log_message INFO "Starting main execution..."
    create_log_dir_file
    log_message
    vir_env
    upgrade_pip
    gitignore
    install_packages
    log_message SUCCESS "Main execution finished."
    log_message SUCCESS "WORK ENVIRONMENT READY! - SETUP COMPLETE!"
    log_message SUCCESS "HAVE FUN BUILDING!"
}

# call main function
main "$@"
