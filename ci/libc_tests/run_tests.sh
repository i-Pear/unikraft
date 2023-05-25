sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y qemu-system-x86-64 > /dev/null 2>&1

cd ci/libc_tests
git clone https://github.com/unikraft/app-helloworld > /dev/null 2>&1
git clone https://github.com/i-Pear/lib-libc-test > /dev/null 2>&1
git clone https://github.com/unikraft/lib-musl > /dev/null 2>&1
cp config app-helloworld/.config
cp Makefile app-helloworld/Makefile
cd app-helloworld && make -j$(nproc) > /dev/null 2>&1
qemu-system-x86_64 -kernel "build/app-helloworld_qemu-x86_64" -nographic -cpu Skylake-Server
