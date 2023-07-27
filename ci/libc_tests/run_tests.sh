sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y qemu-system-x86-64 python3 > /dev/null 2>&1

git clone https://github.com/unikraft/app-helloworld --depth=1 > /dev/null 2>&1
git clone https://github.com/i-Pear/lib-libc-test --depth=1 > /dev/null 2>&1
git clone https://github.com/unikraft/lib-musl --depth=1 > /dev/null 2>&1
git clone https://github.com/unikraft/lib-lwip --depth=1 > /dev/null 2>&1
cp config app-helloworld/.config
cp Makefile app-helloworld/Makefile
cd app-helloworld && make -j$(nproc) > /dev/null 2>&1
qemu-system-x86_64 -kernel "build/app-helloworld_qemu-x86_64" -nographic -cpu max > test_result.txt
