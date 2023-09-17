1. Установил Filebeat, metricbeat, heartbeat
2. Выполнил настройку beats, sudo heartbeat setup -e, добился того, чтобы не было ошибок
3. Запустил beats: sudo service heartbeat-elastic start, добавил в автозагрузку: sudo systemctl enable heartbeat-elastic.service
4. Сделал скриншоты из dashboards.

Скриншоты находятся в директории screenshots, уонфиги в директории configs
