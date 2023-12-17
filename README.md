# BunnyHelper & DuckyHelper Scripts

![BashBunny - Hak5](https://shop.hak5.org/cdn/shop/articles/bash_bunny-credentials_093ed837-e318-4996-87c3-d511868e2ea7_600x.png?v=1651273634)

## Overview

`BunnyHelper` and `DuckyHelper` are Python utilities designed to assist in the modification of Bash Bunny and Ducky scripts respectively. 
While both scripts share a similar core function - modifying the `DELAY` command in scripts - they cater to different devices with unique feature sets.
`BunnyHelper` is tailored for BashBunny scripts, which can potentially leverage advanced features like Geofencing, while `DuckyHelper` is focused on just Ducky scripts.

## Features

- **Modify DELAY Command:** Both scripts automatically adjust the `DELAY` command in scripts within a specified directory and its subdirectories.
- **Backup and Restore:** They create backups before any modifications and allow restoration to original scripts.
- **Device-Specific Adaptations:** While `DuckyHelper` is straightforward for Ducky script modifications,
  `BunnyHelper` is designed with the potential to integrate advanced Bash Bunny features.

## Future Developments for BunnyHelper

- **GeoFencing:** Leveraging Bash Bunny's capabilities to enable conditional script execution based on Bluetooth device proximity.
- **Enhanced Device Interaction:** Utilizing Bash Bunny's advanced features for more complex script modifications and interactions.

## Requirements

- Python 3.x
- Operating Systems: Compatible with any OS that can run Python (Windows, Linux, macOS).

## Usage

### BunnyHelper


`python3 BunnyHelper.py [options]`

### DuckyHelper


`python3 DuckyHelper.py [options]`

**Options:**

- `-d`, `--directory`: Specify the directory containing scripts.
- `-b`, `--backup`: Enable backup before modifying scripts.
- `-r`, `--restore`: Restore scripts from backup.
- Additional options might be available. Use `-h` or `--help` for more information.

## Installation

No installation is required for either script. Simply download and run them with Python 3.

## Contributing

Contributions are welcome for both scripts. Feel free to fork the repository, make changes, and submit pull requests.
