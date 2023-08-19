1. Установил zabbix, пользуясь инструкцией с сайта: https://www.zabbix.com/ru/download
2. Запустил веб-интерфейс, выполнил первоначальную настройку.
3. Написал скрипт /usr/local/script.sh
4. Выполнил настройку zabbix agent (в папке /etc/zabbix/zabbix_agentd.d создал файл lesson.conf)
5. Перезапустил агент (systemctl restart zabbix-agent)
6. В интерфейсе zabbix перешел "Сбор данных > Узлы сети > zabbix-server > Элементы данных > Создать элемент данных"
7. Добавлен элемент с типом "текст", имя - otus_important_metrics, ключ - lesson