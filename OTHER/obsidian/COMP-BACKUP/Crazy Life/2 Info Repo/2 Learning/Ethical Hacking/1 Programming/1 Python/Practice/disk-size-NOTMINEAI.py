import os
from collections import defaultdict
from pathlib import Path

# Set this to the root of your directory structure
ROOT_DIR = Path("/home/sstf/ObsidianDND/Crazy Life/")

# To collect total sizes by file extension
file_sizes = defaultdict(int)

# Walk through all files
for file_path in ROOT_DIR.rglob("*"):
    if file_path.is_file():
        ext = file_path.suffix.lower() or "[no_ext]"
        size = file_path.stat().st_size
        file_sizes[ext] += size

# Sort by largest size
sorted_sizes = sorted(file_sizes.items(), key=lambda x: x[1], reverse=True)

# Print results
print(f"{'Extension':<10} {'Size (MB)':>12}")
print("=" * 24)
total_size = 0
for ext, size in sorted_sizes:
    size_mb = size / (1024 * 1024)
    total_size += size
    print(f"{ext:<10} {size_mb:>10.2f}")

print("\nTotal Size: {:.2f} MB".format(total_size / (1024 * 1024)))

