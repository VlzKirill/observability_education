1. В docker-compose добавил контейнер с grafana последней версии. Создал папку grafana, дал на ней права. Эта пупка будет монтироваться в контейнер.
2. Запустил docker-compose, зашел под пользователем admin сменив пароль.
3. Добавил Data Source prometheus. 
4. Перешел в dashboards. Справа нажал кнопку New. - New Folder. Создал Папки App и Infra.
5. Снова нажал кнопку New. Выбрал Import. Ввел ID dashboard node-exporter (1860). Нажал Load. В поле signcl-prometheus выбрал prometheus data source. Нажал Import.
6. Открылся dashboard. Нажал шестеренку, открылись настройки dashboard. Изменил Folder на Infra. Сохранил.
7. Повторил п. 5 и 6, только для ID 7587 и папки App. Так же активировал пункт Refresh live dashboards.
8. 
