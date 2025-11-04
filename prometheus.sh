# Update
sudo apt update && sudo apt upgrade -y

# Create user for Prometheus
sudo useradd --no-create-home --shell /bin/false prometheus

# Create directories
sudo mkdir /etc/prometheus /var/lib/prometheus

# Download Prometheus
cd /tmp
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.55.1/prometheus-2.55.1.linux-amd64.tar.gz

# Extract
tar -xvf prometheus-*.tar.gz
cd prometheus-*.linux-amd64

# Move binaries
sudo cp prometheus promtool /usr/local/bin/

# Move config & console files
sudo cp -r consoles console_libraries /etc/prometheus
sudo cp prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

