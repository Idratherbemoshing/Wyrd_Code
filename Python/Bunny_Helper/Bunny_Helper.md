# BunnyHelper Script

## Overview

BunnyHelper is a Python utility designed to aid in the modification of Bash Bunny scripts. It primarily focuses on altering the `DELAY` command in scripts located within a specified directory and its subdirectories. This tool supports both 'QUACK DELAY' and 'Q DELAY' syntaxes. Additionally, BunnyHelper features backup and restoration functionalities, enabling safe modifications and easy reversions to original script versions if needed.

## Features

- **Modify DELAY Command:** Automatically adjust the `DELAY` command in all Bash Bunny scripts within a designated directory.
- **Backup and Restore:** Creates backups of original scripts before modification and allows easy restoration.
- **Supports Multiple Syntaxes:** Compatible with both 'QUACK DELAY' and 'Q DELAY' syntaxes.

## Requirements

- Python 3.x
- Operating System: Compatible with any OS that can run Python (Windows, Linux, macOS).

## Usage

1. **Basic Command:**
    
    bashCopy code
    
    `python3 BunnyHelper.py [options]`
    
2. **Options:**
    - `-d`, `--directory`: Specify the directory containing Bash Bunny scripts.
    - `-b`, `--backup`: Enable backup before modifying scripts.
    - `-r`, `--restore`: Restore scripts from backup.
    - Additional options might be available. Use `-h` or `--help` for more information.

## Installation

No installation is required. Simply download `BunnyHelper.py` and run it with Python 3.

## Contributing

Contributions to the BunnyHelper script are welcome. Please feel free to fork the repository, make changes, and submit pull requests.