# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
  qbittorrent-nox \
  openvpn \
  gnupg \
  wget

# Add ProtonVPN repository
RUN wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | apt-key add - \
  && echo "deb https://repo.protonvpn.com/debian unstable main" > /etc/apt/sources.list.d/protonvpn-stable.list

# Install ProtonVPN dependencies
RUN apt-get update && apt-get install -y \
  openvpn \
  dialog \
  python3-pip \
  python3-setuptools \
  git
# Install ProtonVPN CLI
RUN git clone https://github.com/ProtonVPN/linux-cli-community && cd linux-cli-community && pip3 install -e .

# Install qBittorrent
RUN apt-get update && apt-get install -y qbittorrent -y

# Expose qBittorrent web UI port
EXPOSE 8080

# Set the command to start qBittorrent
CMD ["sleep", "infinity"]
