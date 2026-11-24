#!/bin/bash
set -e

# 1. Cập nhật hệ thống
sudo apt-get update && sudo apt-get upgrade -y

# 2. Cài đặt các gói phần mềm bắt buộc
sudo apt-get install -y openjdk-17-jdk git curl

# 3. Kiểm tra và tạo nhóm quickbite nếu chưa tồn tại
if ! getent group quickbite > /dev/null 2>&1; then
    sudo groupadd quickbite
fi

# 4. Tạo system user quickbite thuộc nhóm quickbite, không tạo home (-r), khóa đăng nhập (/bin/false)
if ! id -u quickbite > /dev/null 2>&1; then
    sudo useradd -r -g quickbite -s /bin/false quickbite
fi
