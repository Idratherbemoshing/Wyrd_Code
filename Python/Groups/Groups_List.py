import pandas as pd

# Load the first Excel file
file1_path = 'C:\SWTOOLS\Secure_Files\Work_Scripts\_Assets\Nathan Strohmayer-Groups.xlsx'
df1 = pd.read_excel(file1_path)

# Load the second Excel file
file2_path = 'C:\SWTOOLS\Secure_Files\Work_Scripts\_Assets\Ashlea Champness - Groups.xlsx'
df2 = pd.read_excel(file2_path)

# Compare the 2nd column and find rows without matches
non_matching_rows = df1[~df1.iloc[:, 1].isin(df2.iloc[:, 1])]

# Display the non-matching rows
print("Non-matching rows:")
print(non_matching_rows)