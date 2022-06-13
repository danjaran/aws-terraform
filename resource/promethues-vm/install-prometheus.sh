#!/bin/bash
sudo yum -y update && sudo yum -y upgrade
sudo yum -y install wget curl
useradd --no-create-home --shell /bin/false prometheus
useradd --no-create-home --shell /bin/false node_exporter
mkdir /etc/prometheus
mkdir /var/lib/prometheus
chown prometheus:prometheus /etc/prometheus
chown prometheus:prometheus /var/lib/prometheus
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.17.1/prometheus-2.17.1.linux-amd64.tar.gz
tar xzvf prometheus-2.17.1.linux-amd64.tar.gz 
cp prometheus-2.17.1.linux-amd64/prometheus /usr/local/bin
cp prometheus-2.17.1.linux-amd64/promtool /usr/local/bin
chown prometheus:prometheus /usr/local/bin/prometheus
chown prometheus:prometheus /usr/local/bin/promtool
cp -r prometheus-2.17.1.linux-amd64/consoles /etc/prometheus
cp -r prometheus-2.17.1.linux-amd64/console_libraries /etc/prometheus
chown -R prometheus:prometheus /etc/prometheus/consoles
chown -R prometheus:prometheus /etc/prometheus/console_libraries

echo "Copying prometheus.yml"
echo -e "global:\n\tscrape_interval: 15s\nscrape_configs:\n\t- job_name: 'prometheus'\n\tscrape_interval: 5s\n\tstatic_configs:\n\t\t- targets: ['localhost:9090'] " >> /etc/prometheus/prometheus.yml
chown prometheus:prometheus /etc/prometheus/prometheus.yml

echo "Copying prometheus.service"
echo -e "[Unit]\nDescription=Prometheus\nWants=network-online.target\nAfter=network-online.target\n\n[Service]\nUser=prometheus\nGroup=prometheus\nType=simple\nExecStart=/usr/local/bin/prometheus \ \n\t--config.file /etc/prometheus/prometheus.yml \ \n\t--storage.tsdb.path /var/lib/prometheus/ \ \n\t--web.console.templates=/etc/prometheus/consoles \ \n\t--web.console.libraries=/etc/prometheus/console_libraries\n\n[Install]\nWantedBy=multi-user.target " >> /etc/systemd/system/prometheus.service

systemctl daemon-reload
systemctl enable --now prometheus

##install nodeexporter
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzvf node_exporter-0.18.1.linux-amd64.tar.gz
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin
chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo tee /etc/systemd/system/node_exporter.service<<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target  
EOF
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter

##ubuntu 18.04
# sudo apt -y update && sudo apt -y upgrade
# useradd --no-create-home --shell /bin/false prometheus
# useradd --no-create-home --shell /bin/false node_exporter
# mkdir /etc/prometheus
# mkdir /var/lib/prometheus
# chown prometheus:prometheus /etc/prometheus
# chown prometheus:prometheus /var/lib/prometheus
# curl -LO https://github.com/prometheus/prometheus/releases/download/v2.17.1/prometheus-2.17.1.linux-amd64.tar.gz
# tar xzvf prometheus-2.17.1.linux-amd64.tar.gz 
# cp prometheus-2.17.1.linux-amd64/prometheus /usr/local/bin
# cp prometheus-2.17.1.linux-amd64/promtool /usr/local/bin
# chown prometheus:prometheus /usr/local/bin/prometheus
# chown prometheus:prometheus /usr/local/bin/promtool
# cp -r prometheus-2.17.1.linux-amd64/consoles /etc/prometheus
# cp -r prometheus-2.17.1.linux-amd64/console_libraries /etc/prometheus
# chown -R prometheus:prometheus /etc/prometheus/consoles
# chown -R prometheus:prometheus /etc/prometheus/console_libraries

# echo "Copying prometheus.yml"
# echo -e "global:\n\tscrape_interval: 15s\nscrape_configs:\n\t- job_name: 'prometheus'\n\tscrape_interval: 5s\n\tstatic_configs:\n\t\t- targets: ['localhost:9090'] " >> /etc/prometheus/prometheus.yml
# chown prometheus:prometheus /etc/prometheus/prometheus.yml

# echo "Copying prometheus.service"
# echo -e "[Unit]\nDescription=Prometheus\nWants=network-online.target\nAfter=network-online.target\n\n[Service]\nUser=prometheus\nGroup=prometheus\nType=simple\nExecStart=/usr/local/bin/prometheus \ \n\t--config.file /etc/prometheus/prometheus.yml \ \n\t--storage.tsdb.path /var/lib/prometheus/ \ \n\t--web.console.templates=/etc/prometheus/consoles \ \n\t--web.console.libraries=/etc/prometheus/console_libraries\n\n[Install]\nWantedBy=multi-user.target " >> /etc/prometheus/prometheus.yml

# systemctl daemon-reload
# systemctl enable prometheus
# systemctl start prometheus



###install node exporter
