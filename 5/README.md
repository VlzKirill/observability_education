1. Установил zabbix, пользуясь инструкцией с сайта: https://www.zabbix.com/ru/download
2. Запустил веб-интерфейс, выполнил первоначальную настройку.
3. Написал скрипт /usr/local/script.sh
4. Выполнил настройку zabbix agent (в папке /etc/zabbix/zabbix_agentd.d создал файл lesson.conf)
5. Перезапустил агент (systemctl restart zabbix-agent)

6. Настроил канал оповещений (telegram) в zabbix (добавил поле MarkDown). Настройки на скриншоте.
7. Добавил ID канала в телеграм в настройках пользователя (способах оповещений).
8. Выполнил тестовую отправку уведомления
9. Ссылка на канал: https://t.me/otus_monitoirng_zab_vlz

10. Создал правило обнаружения с ключем otus_important_metrics
11. Создал прототип элементов данных с ключем otus_important_metrics[{#METRIC}]
12. Создал прототип триггеров c выражением last(/Zabbix server/otus_important_metrics[{#METRIC}])>=95
13. 