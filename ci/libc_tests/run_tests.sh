sudo apt-get update -y > /dev/null
sudo apt-get install -y qemu-system-x86-64 > /dev/null

cd ci/libc_tests
git clone https://github.com/unikraft/app-helloworld
git clone https://github.com/i-Pear/lib-libc-test
git clone https://github.com/unikraft/lib-musl
cp config app-helloworld/.config
cp Makefile app-helloworld/Makefile
cd app-helloworld && make -j$(nproc) > /dev/null
qemu-system-x86_64 -kernel "build/app-helloworld_qemu-x86_64" -nographic -cpu Skylake-Server
