# DuckyHelper Script

## Overview

DuckyHelper is a Python script created to facilitate modifications in Ducky scripts, especially for adjusting the `DELAY` commands. It operates within a specified directory and its subdirectories, and includes backup and restoration features to safeguard original scripts.

## Features

- **Modify DELAY Command:** Automatically alter the `DELAY` command in Ducky scripts.
- **Backup and Restore:** Enables backups before changes are made and allows restoration from these backups.
- **Easy to Use:** Simple command-line interface for quick and easy script modifications.

## Requirements

- Python 3.x
- Compatible with various operating systems capable of running Python (Windows, Linux, macOS).

## Usage

1. **Basic Command:**
    
    `python3 DuckyHelper.py [options]`
    
2. **Options:**
    - `-d`, `--directory`: Specify the directory for Ducky scripts.
    - `-b`, `--backup`: Create backups before making changes.
    - `-r`, `--restore`: Restore original scripts from backups.
    - Use `-h` or `--help` to see more options.

## Installation

DuckyHelper does not require installation. Download `DuckyHelper.py` and execute it using Python 3.

## Contributing

Feel free to contribute to the development of DuckyHelper. You can fork the project, make your changes, and submit a pull request for review.