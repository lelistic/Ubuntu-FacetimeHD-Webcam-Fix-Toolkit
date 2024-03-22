# Ubuntu-FacetimeHD-Webcam-Fix-Toolkit

## Description: 

This toolkit provides a comprehensive solution for resolving webcam recognition issues specifically on Ubuntu systems, focusing on fixing FaceTime HD webcam problems. 

The repository includes a detailed README guide and a bash script to automate the installation process, simplifying the setup for users experiencing webcam detection problems. With step-by-step instructions and automated installation, users can effortlessly install FaceTime HD firmware and the bcwc_pcie driver, ensuring seamless webcam functionality on their Ubuntu systems. 

Say goodbye to webcam woes and hello to hassle-free video conferencing and camera usage on Ubuntu with the Ubuntu-FacetimeHD-Webcam-Fix-Toolkit.

## Problem:
After installing Ubuntu 23.10 on macOS, the webcam was not recognized. The `lsusb` command did not detect any camera devices, and there were no camera drivers visible.

### Reproducing the problem error
After executing the `installer.sh` 

```bash
v4l2-ctl --list-devices -D
```

Resulting in this log:

```log
Cannot open device /dev/video0, exiting.
```


## Solution:

### Step 1: Install necessary tools
```bash
sudo apt install git curl cpio
```

### Step 2: Install FaceTime HD firmware
```bash
git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make clean
make
sudo make install
```

### Step 3: Install required packages
```bash
sudo apt install kmod libssl-dev checkinstall
```

### Step 4: Install bcwc_pcie driver
```bash
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make clean
make
sudo make install
```

### Step 5: Load the driver
```bash
sudo depmod
sudo modprobe facetimehd
```

## Results:
- After following the above steps, the webcam was successfully recognized.
- The webcam became visible in applications such as video conferencing software (e.g., Zoom, Google Meet) and the `v4l2-ctl` configuration.
### After executing the `installer.sh` 
```bash
v4l2-ctl --list-devices -D
```

Results in the following logs:
```log
Apple Facetime HD (PCI:0000:02:00.0):
	/dev/video0

Driver Info:
	Driver name      : facetimehd
	Card type        : Apple Facetime HD
	Bus info         : PCI:0000:02:00.0
	Driver version   : 6.5.13
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
```



