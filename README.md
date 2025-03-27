Yêu cầu: 
----------- DOCKER -------------
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

Chạy không cần sudo, nếu không được fix được bằng lệnh dưới thì vào "sudo su" để chạy
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

*** Log Out user và đăng nhập lại.

Download git:
sudo apt install git -y
git clone https://github.com/matthew28302/NT114-music.git
cd NT114-music

******** Đôi tên thư mục thành lab3-2
-----------------BUILD----------------------
Chỉnh sửa thông tin đăng nhập email: config.cfg ( dùng mật khẩu ứng dụng của Google )

docker-compose up --build
