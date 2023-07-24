Lesson4. DZ 2.
Шаги воспроизведения:
1. Доработал docker-compose, наработанный в предыдущем задании (добавил alert-manager)
2. Разработал конфиг alertmanager.yml
3. Создал бота в telegram через bot father, получил api token. Узнал ID собственного чата. Нашел бота в телеграм, инициализировал чат (выполнил /start)
4. Доработал конфиг prometheus для использования alertmanager, написал alert.rules.yml
   - в качестве учебного правила выбрал отслеживание статуса страницы wordpress через blackbox exporter по коду 500 
5. Запустил docker-compose
6. остановил контейнер с базой mysql (docker-compose stop mysql)
7. Подождал немного, получил alert в telegram от бота.