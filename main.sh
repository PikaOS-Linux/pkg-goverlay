DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/benjamimgois/goverlay -b 0.9.1
cp -rvf ./debian ./goverlay
cd ./goverlay

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p goverlay_0.9.1
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
