{
sudo apt install git curl cpio
git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make clean
make
sudo make install

cd ..
sudo apt install kmod libssl-dev checkinstall
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make clean
make
sudo make install

sudo depmod
sudo modprobe facetimehd
}
