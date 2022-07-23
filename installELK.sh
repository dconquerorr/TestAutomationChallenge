#!/bin/bash

sudo apt update
sudo apt-get upgrade -y
sudo apt-get install openjdk-8-jre -y
sudo java -version

# install elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

sudo apt-get update
sudo apt-get install elasticsearch -y
sleep 10
sudo mv /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo curl http://localhost:9200

# install logstash
sudo apt-get install logstash
sleep 10

# install kibana
sudo apt-get install kibana
sleep 10

sudo mv /tmp/kibana.yml /etc/kibana/kibana.yml
sudo systemctl daemon-reload
sudo systemctl enable kibana.service
sudo systemctl start kibana.service

# install filebeats
sudo apt-get install metricbeat
sleep 10
sudo systemctl daemon-reload
sudo systemctl enable metricbeat.service
sudo systemctl start metricbeat.service

# Start LogStash
sudo mv /tmp/apache-01.conf /etc/logstash/conf.d/apache-01.conf
sleep 10
sudo systemctl daemon-reload
sudo systemctl enable logstash.service
sudo systemctl start logstash.service
echo "Successfully created EC2 instance"

