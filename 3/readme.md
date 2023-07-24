1. В docker-compose добавил контейнер с victoria metrics.
2. При запуске приложения добавлен ключ -retentionPeriod=2w 
3. в prometheus.yml добавлена секция remote_write с указанием базы VM
4. в prometheus.yml в секции global добавлен параметр external_labels site:prod

Всю информацию взял отсюда:
https://github.com/VictoriaMetrics/VictoriaMetrics