##### Create a 16GB Swapfile
```bash
sudo dd if=/dev/zero of=/swapfile bs=1024 count=16179869 status=progress
```

##### Create a 8GB Swapfile
```bash
sudo dd if=/dev/zero of=/swapfile bs=1024 count=8179869 status=progress
```

##### Follow these steps in order

```bash
sudo chown 600 /swapfile
```

```bash
sudo mkswap /swapfile
```

```bash
sudo swapon /swapfile
```

```bash
cat /proc/swaps
```
OR
```bash
sudo swapon --show
```

##### Add to FSTAB and reboot to take effect (CAREFUL, MAKE SURE IT'S PERFECT!! OR NO BOOT!)
```bash
/swapfile none swap defaults 0 0
```
