1. Установил Filebeat, metricbeat, heartbeat
2. Выполнил настройку beats, сконфигурировал согласно приложенным файлам конфигурации, выполнил команды:
sudo heartbeat setup -e
sudo metricbeat setup -e
sudo filebeat setup -e
3. Запустил beats: 
sudo service heartbeat-elastic start 
sudo service metricbeat start 
sudo service filebeat start 
5. добавил в автозагрузку: sudo systemctl enable heartbeat-elastic.service
6. Сделал скриншоты из dashboards.

Скриншоты находятся в директории screenshots, уонфиги в директории configs
