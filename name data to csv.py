import os
import csv

# Ask for the directory where the files are


directory = input("Enter directory: ")
print("RAW INPUT:", repr(directory))

directory = os.path.expanduser(directory)
directory = os.path.abspath(directory)

print("EXPANDED:", directory)
print("EXISTS:", os.path.exists(directory))
print("IS DIR:", os.path.isdir(directory))


all_data = []

# Loop through all files in the directory
for filename in os.listdir(directory):
    if filename.startswith("yob") and filename.endswith(".txt"):
        year = filename[3:7]  # Extract year from filename like 'yob1880.txt'
        filepath = os.path.join(directory, filename)
        with open(filepath, "r") as f:
            for line in f:
                parts = line.strip().split(",")
                if len(parts) != 3:
                    print(f"Skipping invalid line in {filename}: {line.strip()}")
                    continue
                name, gender, count = parts
                try:
                    count = int(count)
                except ValueError:
                    print(f"Invalid count in {filename}, skipping line: {line.strip()}")
                    continue
                all_data.append({
                    "Year": year,
                    "Name": name,
                    "Gender": gender,
                    "Count": count
                })

# Write all collected data to CSV
csv_filename = "combined_names.csv"
with open(csv_filename, mode='w', newline='') as csvfile:
    fieldnames = ["Year", "Name", "Gender", "Count"]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(all_data)

print(f"All data saved to {csv_filename}")
