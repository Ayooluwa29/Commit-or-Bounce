#!/bin/bash

DIR=$(pwd)
SEARCH_VENV=".venv*"
SEARCH_LOGS="logs*"
LOG_DIR="$DIR/logs"
LOG_FILE="${LOG_DIR}/setup.log"
FIND_VENV=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_VENV" -print0 | xargs -0)
FIND_LOGS=$(find "$DIR" -maxdepth 1 -type d -name "$SEARCH_LOGS" -print0 | xargs -0)
IGNORE_FILE="$DIR/.gitignore"
IGNORE_RULES=("__pycache__/" ".idea/" ".vscode/" ".DS_Store" ".env" "build/" "dist/" "wheels/" ".pytest_cache" "*.log" "*.tmp" "venv/" ".venv/" "env/")
PACKAGES=("pandas" "numpy" "polars" "pyarrow" "SQLAlchemy" "requests" "beautifulsoup4")
#mkdir "$LOG_DIR"

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
        INFO)
            color_code="${GREEN}"
            ;;
        WARNING)
            color_code="${YELLOW}"
            ;;
        ERROR)
            color_code="${RED}"
            ;;
        *)
            color_code="${NC}"
            ;;
    esac

    # print to console with color
    echo "${color_code}[${timestamp}] [${log_type}] ${message}${NC}" | tee -a "$LOG_FILE"
}


# Creating a function for logging
#log() {
#    local  
#    if [[ -n "$FIND_LOGS" ]]; then 
#        echo "$(date) - $1 " | tee -a $LOG_FILE
#    else
#       echo "Creating a log directory" | mkdir "$LOG_DIR"
#       echo "Created log directory: $LOG_DIR"
#       echo "Creating log file" | touch "$LOG_FILE"
#       echo "Created log file: $LOG_FILE"
#       echo "$(date) - $1 " | tee -a $LOG_FILE
#    fi
#}


# Creating a function for checking if a virtual environment exist
# If yes, activate the virtual environmet
# If not create one and activate
vir_env() {
    if [[ -n "$FIND_VENV" ]]; then
        log_message INFO "Virtual environment exists: $FIND_VENV"
        if [[ -f "$FIND_VENV/bin/activate" ]]; then
            source "$FIND_VENV/bin/activate"
            log_message INFO "Virtual environment activated: $FIND_VENV"
        else
            log_message ERROR "Activate script not found in $FIND_VENV/bin/"
            return 1
        fi
    else
        log_message "No virtual environment found in "$DIR""
        echo "Enter a name for your virtual environment:"
        read venv_name
        log_message "Creating virtual environment: $venv_name"
        python3 -m venv "$venv_name"
        if [[ -f "$venv_name/bin/activate" ]]; then
            log_message INFO "Created virtual environment: $venv_name"
            source "$venv_name/bin/activate"
        else
            log_message ERROR "Activate script not found in $venv_name/bin/"
            return 1
        fi
    fi
}


upgrade_pip() {
    # Check if pip is installed
    # Installs the latest pip version
    if  ! command -v pip &> /dev/null ; then
        log_message "pip not installed. Installing latest pip..."
        python3 -m ensurepip --upgrade --default-pip
        if [ $? -eq 0 ]; then
            log_message INFO "latest pip installed successfully."
        else
            log_message ERROR "Failed to install/upgrade pip."
            return 1
        fi
    else
        log_message "pip is already installed. Upgrading to the latest..."
        python3 -m pip install --upgrade pip
        if [ $? -eq 0 ]; then
            log_message INFO "pip upgraded successfully."
        else
            log_message ERROR "Failed to upgrade pip."
            return 1
        fi
    fi
}


# Create gitignore file function
gitignore() {
    if [[ ! -f "$IGNORE_FILE" ]]; then
        log_message "Creating $IGNORE_FILE and adding igore rules..."
        for element in "${IGNORE_RULES[@]}"; do
            log_message "$element" >> "$IGNORE_FILE"
        done
    else
        log_message "$IGNORE_FILE already exists."
    fi
}


# Install python packages
install_packages() {
    log_message "Installing Python packages..."
    for package in "${PACKAGES[@]}"; do
        log_message "Installing $package..."
        pip install "$package"
        if [ $? -ne 0 ]; then
            log_message WARNING " Error installing $package. Exiting"
            exit 1
        fi
    done
    
    echo "All packages installed successfully."
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
    log_mesage INFO "Main execution finished."
}

# call main function
main "$@"
