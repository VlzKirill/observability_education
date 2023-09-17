1. Установил Filebeat, metricbeat, heartbeat
2. Выполнил настройку beats, проверил конфиг sudo heartbeat setup -e, добился того, чтобы не было ошибок
3. Установил компоненты: sudo heartbeat setup
4. Запустил beats: sudo service heartbeat-elastic start, добавил в автозагрузку: sudo systemctl enable heartbeat-elastic.service
