---
dg-publish: true
---
Yes, you _can_ partition your existing disk to make space for another Linux distro — even if Void Linux is already installed. The process is straightforward, but you **must back up any important data first** in case something goes wrong. Here's how to do it safely:

---

### 🧩 Step-by-Step: Partition Your Disk for Dual Boot

#### 1. **Check Current Partition Layout**

Boot into your existing Void Linux system and run:

```bash
lsblk
```

or:

```bash
sudo fdisk -l
```

This will show you how your storage is currently used (e.g. `/dev/sda1`, `/dev/sda2`, etc.).

---

#### 2. **Shrink an Existing Partition**

If you have one large root partition (`/`), you’ll need to shrink it to make room for the new distro.

**Use `gparted` (GUI) or `parted` (CLI):**

##### Option A: Using `gparted` (recommended for GUI users)

1. Boot from a **live USB** of any Linux distro that includes `gparted` (e.g. Ubuntu).
    
2. Open `gparted`.
    
3. Select your disk (e.g., `/dev/sda`).
    
4. Right-click your main partition → "Resize/Move".
    
5. Shrink it to free up unallocated space (at least 15–20GB is recommended).
    
6. Click "Apply" to commit changes.
    

##### Option B: Using `parted` (CLI)

More advanced and riskier. If you want this method, let me know and I’ll walk you through it.

---

#### 3. **Install the Second Distro**

Now that you have unallocated space:

1. Boot into the installer USB of your second Linux distro.
    
2. During installation, choose **"Manual Partitioning"** or similar.
    
3. Select the unallocated space and create:
    
    - A new root (`/`) partition.
        
    - (Optional) Swap partition or reuse existing.
        
4. Install the new distro **without formatting your Void partition**.
    

> ✅ Most installers will ask where to install the bootloader. Pick the disk (`/dev/sda`) — GRUB from the second distro will manage both OSes.

---

#### 4. **Update GRUB to See Both OSes**

Once installed, reboot into the new distro and run:

```bash
sudo update-grub
```

This should detect Void Linux and add it to the boot menu.

---

### 🧠 Notes:

- If your system uses **UEFI**, be sure both OSes are installed in UEFI mode.
    
- You can later customize GRUB’s menu order.
    

---

Want help analyzing your `lsblk` or `fdisk` output? Paste it here and I’ll walk you through the partitioning plan step by step.