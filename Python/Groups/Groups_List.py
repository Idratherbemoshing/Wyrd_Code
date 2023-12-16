# Using Python Pandas module to parse through large amounts of gorup memberships for AAD user's 
# find a user on AAD and export their associated groups to excel, edit the script and away you go
# This can also be useful when comparing different Devices via Intune/EndPoint and their associated groups

import pandas as pd

# Load the first Excel file
file1_path = 'C:\_Assets\path\to\excel\files\ someone - Groups.xlsx'
df1 = pd.read_excel(file1_path)

# Load the second Excel file
file2_path = 'C:\_Assets\path\to\excel\files\ someone - Groups.xlsx'
df2 = pd.read_excel(file2_path)

# Compare the 2nd column and find rows without matches
non_matching_rows = df1[~df1.iloc[:, 1].isin(df2.iloc[:, 1])]

# Display the non-matching rows
print("Non-matching rows:")
print(non_matching_rows)