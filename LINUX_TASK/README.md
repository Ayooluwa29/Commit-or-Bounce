# Commit-or-Bounce
## LINUX TASK
### AUTOMATED DATAENGINEERING PYTHON ENVIRONMENT SETUP

### Functionalities
This repository comprises of a bash script that setups a python based data engineering project environment with little of no individual input.
Stated below are the functionalities embedded in the setup.sh file:
1. The script checks the working directory to see if there is virtual environment and activates it if found. In a case where there's none it automatically creates one with the name input from the user  and then activates the python virtual environment in the user working environment.
2. Logging and error handling are very crucial aspect of data engineering work and this also covered for in all the process of the environment setup. To also make the log easily readable color coding was also applied to the logs.
3. After creating the and activating the virtual environment, the latest version of pip isthen installed in the environment.
4. A gitignore is generating function with primary  and necessary python environment environment ignore rules.
5. Installing important python packages to work with were also covered for the in the setup script.

### Activate Setup
The script also includes a main function that calls every function in the script. So, to execute the setup  run ./setup.sh and the environment setup will be completed in a few.

### Script Run Terminal Messages
aygbedu@Ayooluwas-MacBook-Pro LINUX_TASK % ./setup.sh 
tee: /Users/aygbedu/MwN/Commit-or-Bounce/LINUX_TASK/logs/setup.log: No such file or directory
[2025-11-16 23:51:16] [INFO] Starting main execution...
[2025-11-16 23:51:16] [] 
[2025-11-16 23:51:16] [No virtual environment found in /Users/aygbedu/MwN/Commit-or-Bounce/LINUX_TASK] 
Enter a name for your virtual environment:
.venv
[2025-11-16 23:51:26] [Creating virtual environment: .venv] 
[2025-11-16 23:51:27] [INFO] Created virtual environment: .venv
[2025-11-16 23:51:27] [pip is already installed. Upgrading to the latest...] 
Requirement already satisfied: pip in ./.venv/lib/python3.14/site-packages (25.3)
[2025-11-16 23:51:28] [INFO] pip upgraded successfully.
[2025-11-16 23:51:28] [Creating /Users/aygbedu/MwN/Commit-or-Bounce/LINUX_TASK/.gitignore and adding igore rules...] 
[2025-11-16 23:51:28] [Installing Python packages...] 
[2025-11-16 23:51:28] [Installing pandas...] 
Collecting pandas
  Using cached pandas-2.3.3-cp314-cp314-macosx_11_0_arm64.whl.metadata (91 kB)
Collecting numpy>=1.26.0 (from pandas)
  Downloading numpy-2.3.5-cp314-cp314-macosx_14_0_arm64.whl.metadata (62 kB)
Collecting python-dateutil>=2.8.2 (from pandas)
  Using cached python_dateutil-2.9.0.post0-py2.py3-none-any.whl.metadata (8.4 kB)
Collecting pytz>=2020.1 (from pandas)
  Using cached pytz-2025.2-py2.py3-none-any.whl.metadata (22 kB)
Collecting tzdata>=2022.7 (from pandas)
  Using cached tzdata-2025.2-py2.py3-none-any.whl.metadata (1.4 kB)
Collecting six>=1.5 (from python-dateutil>=2.8.2->pandas)
  Using cached six-1.17.0-py2.py3-none-any.whl.metadata (1.7 kB)
Using cached pandas-2.3.3-cp314-cp314-macosx_11_0_arm64.whl (10.8 MB)
Downloading numpy-2.3.5-cp314-cp314-macosx_14_0_arm64.whl (5.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.1/5.1 MB 7.2 MB/s  0:00:00
Using cached python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
Using cached pytz-2025.2-py2.py3-none-any.whl (509 kB)
Using cached six-1.17.0-py2.py3-none-any.whl (11 kB)
Using cached tzdata-2025.2-py2.py3-none-any.whl (347 kB)
Installing collected packages: pytz, tzdata, six, numpy, python-dateutil, pandas
Successfully installed numpy-2.3.5 pandas-2.3.3 python-dateutil-2.9.0.post0 pytz-2025.2 six-1.17.0 tzdata-2025.2
[2025-11-16 23:51:36] [Installing numpy...] 
Requirement already satisfied: numpy in ./.venv/lib/python3.14/site-packages (2.3.5)
[2025-11-16 23:51:36] [Installing polars...] 
Collecting polars
  Downloading polars-1.35.2-py3-none-any.whl.metadata (10 kB)
Collecting polars-runtime-32==1.35.2 (from polars)
  Downloading polars_runtime_32-1.35.2-cp39-abi3-macosx_11_0_arm64.whl.metadata (1.5 kB)
Downloading polars-1.35.2-py3-none-any.whl (783 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 783.6/783.6 kB 2.6 MB/s  0:00:00
Downloading polars_runtime_32-1.35.2-cp39-abi3-macosx_11_0_arm64.whl (36.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 36.7/36.7 MB 7.6 MB/s  0:00:04
Installing collected packages: polars-runtime-32, polars
Successfully installed polars-1.35.2 polars-runtime-32-1.35.2
[2025-11-16 23:51:44] [Installing pyarrow...] 
Collecting pyarrow
  Downloading pyarrow-22.0.0-cp314-cp314-macosx_12_0_arm64.whl.metadata (3.2 kB)
Downloading pyarrow-22.0.0-cp314-cp314-macosx_12_0_arm64.whl (34.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 34.2/34.2 MB 8.0 MB/s  0:00:04
Installing collected packages: pyarrow
Successfully installed pyarrow-22.0.0
[2025-11-16 23:51:50] [Installing SQLAlchemy...] 
Collecting SQLAlchemy
  WARNING: Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x10364e490>: Failed to establish a new connection: [Errno 8] nodename nor servname provided, or not known')': /packages/9c/5e/6a29fa884d9fb7ddadf6b69490a9d45fded3b38541713010dad16b77d015/sqlalchemy-2.0.44-py3-none-any.whl.metadata
  WARNING: Retrying (Retry(total=3, connect=None, read=None, redirect=None, status=None)) after connection broken by 'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x10364e5d0>: Failed to establish a new connection: [Errno 8] nodename nor servname provided, or not known')': /packages/9c/5e/6a29fa884d9fb7ddadf6b69490a9d45fded3b38541713010dad16b77d015/sqlalchemy-2.0.44-py3-none-any.whl.metadata
  Downloading sqlalchemy-2.0.44-py3-none-any.whl.metadata (9.5 kB)
Collecting typing-extensions>=4.6.0 (from SQLAlchemy)
  Using cached typing_extensions-4.15.0-py3-none-any.whl.metadata (3.3 kB)
Downloading sqlalchemy-2.0.44-py3-none-any.whl (1.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.9/1.9 MB 5.0 MB/s  0:00:00
Using cached typing_extensions-4.15.0-py3-none-any.whl (44 kB)
Installing collected packages: typing-extensions, SQLAlchemy
Successfully installed SQLAlchemy-2.0.44 typing-extensions-4.15.0
[2025-11-16 23:53:01] [Installing requests...] 
Collecting requests
  Using cached requests-2.32.5-py3-none-any.whl.metadata (4.9 kB)
Collecting charset_normalizer<4,>=2 (from requests)
  Using cached charset_normalizer-3.4.4-cp314-cp314-macosx_10_13_universal2.whl.metadata (37 kB)
Collecting idna<4,>=2.5 (from requests)
  Using cached idna-3.11-py3-none-any.whl.metadata (8.4 kB)
Collecting urllib3<3,>=1.21.1 (from requests)
  Using cached urllib3-2.5.0-py3-none-any.whl.metadata (6.5 kB)
Collecting certifi>=2017.4.17 (from requests)
  Downloading certifi-2025.11.12-py3-none-any.whl.metadata (2.5 kB)
Using cached requests-2.32.5-py3-none-any.whl (64 kB)
Using cached charset_normalizer-3.4.4-cp314-cp314-macosx_10_13_universal2.whl (207 kB)
Using cached idna-3.11-py3-none-any.whl (71 kB)
Using cached urllib3-2.5.0-py3-none-any.whl (129 kB)
Downloading certifi-2025.11.12-py3-none-any.whl (159 kB)
Installing collected packages: urllib3, idna, charset_normalizer, certifi, requests
Successfully installed certifi-2025.11.12 charset_normalizer-3.4.4 idna-3.11 requests-2.32.5 urllib3-2.5.0
[2025-11-16 23:53:03] [Installing beautifulsoup4...] 
Collecting beautifulsoup4
  Using cached beautifulsoup4-4.14.2-py3-none-any.whl.metadata (3.8 kB)
Collecting soupsieve>1.2 (from beautifulsoup4)
  Using cached soupsieve-2.8-py3-none-any.whl.metadata (4.6 kB)
Requirement already satisfied: typing-extensions>=4.0.0 in ./.venv/lib/python3.14/site-packages (from beautifulsoup4) (4.15.0)
Using cached beautifulsoup4-4.14.2-py3-none-any.whl (106 kB)
Using cached soupsieve-2.8-py3-none-any.whl (36 kB)
Installing collected packages: soupsieve, beautifulsoup4
Successfully installed beautifulsoup4-4.14.2 soupsieve-2.8
All packages installed successfully.

### Directory/File Structure

├── .venv
│   └── bin
│    └── include
│    └── lib
│    └── .gitignore
│    └── pyvenv.cfg

└── logs
    └── setup.log

└── .gitignore

└── setup.sh

└── README.md

### Challenges Faced
1. Working with arrays to write values into the .ignore file, which is not comming out as expected.


