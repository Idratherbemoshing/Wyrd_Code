#!/usr/bin/env python3
# Author: Wyrd
# Title: Ducky Script Helper
# 
# Description: This script modifies the DELAY command in Ducky scripts within a specified directory and its subdirectories.
# It also provides functionality to create backups before modification and to restore the original files from these backups.

import os
import re
import argparse
import shutil

def confirm_overwrite(file_path):
    """ Asks the user for confirmation to overwrite an existing file. """
    if os.path.exists(file_path):
        response = input(f"Backup file {file_path} already exists. Overwrite? (y/n): ")
        return response.strip().lower() == 'y'
    return True

def modify_delay_in_file(file_path, new_delay, verbose, make_backup):
    """ Modifies the DELAY command in the specified file. """
    if make_backup:
        backup_path = f"{file_path}.backup"
        if not confirm_overwrite(backup_path):
            if verbose:
                print(f"Skipping backup for {file_path}")
            return
        if verbose:
            print(f"Creating backup: {backup_path}")
        shutil.copy2(file_path, backup_path)

    try:
        with open(file_path, 'r') as file:
            content = file.read()

        modified_content = re.sub(r'DELAY \d+', f'DELAY {new_delay}', content, flags=re.IGNORECASE)

        with open(file_path, 'w') as file:
            file.write(modified_content)
        if verbose:
            print(f"Modified {file_path}")

    except IOError as e:
        if verbose:
            print(f"Error processing file {file_path}: {e}")

def restore_from_backup(directory, file_extension, verbose):
    """ Restores files from their backups. """
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith(file_extension + '.backup'):
                original_file_path = os.path.join(root, filename.replace('.backup', ''))
                backup_file_path = os.path.join(root, filename)
                if verbose:
                    print(f"Restoring {original_file_path} from {backup_file_path}")
                shutil.move(backup_file_path, original_file_path)

def modify_all_ducky_scripts(directory, new_delay, file_extension='.txt', verbose=False, make_backup=False):
    """ Modifies all Ducky scripts in the given directory. """
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith(file_extension):
                file_path = os.path.join(root, filename)
                modify_delay_in_file(file_path, new_delay, verbose, make_backup)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Modify DELAY commands in Ducky scripts.')
    parser.add_argument('-d', '--directory', required=True, help='Directory containing Ducky scripts - this will modify all sub folders so be careful')
    parser.add_argument('-nd', '--new_delay', type=int, help='New delay value to set')
    parser.add_argument('--ext', default='.txt', help='File extension to filter by (default: .txt)')
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    parser.add_argument('-b', '--backup', action='store_true', help='IMPORTANT: Create a backup of each file before modifying')
    parser.add_argument('-r', '--restore', action='store_true', help='Restore files from backup')
    args = parser.parse_args()

    if args.new_delay is not None and args.new_delay < 0:
        parser.error("new_delay must be a positive integer.")
    
    if args.restore:
        restore_from_backup(args.directory, args.ext, args.verbose)
    else:
        if args.new_delay is None:
            parser.error("new_delay is required unless restoring from backup.")
        modify_all_ducky_scripts(args.directory, args.new_delay, args.ext, args.verbose, args.backup)
