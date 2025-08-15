### ZSTD using `tar`
```
# create:
tar -I 'zstd -19 --ultra -T0' -cf mydir.tar.zst mydir/

# extract:
tar -I 'zstd -d' -xf mydir.tar.zst
```

- `-I 'zstd -19 --ultra -T0'` : tell tar to run `zstd` as compressor with level 19; `--ultra` enables levels ≥20 (you can use 20–22 but they use much more memory); `-T0` uses all CPU cores (auto).
  
- `-cf` : create file
- `-v` : verbose