# Для развертывания и мониторинга выбрана CMS Wordpress
# Последовательность действий:
1. Развернул ВМ с Ubuntu 22.04
2. Обновил кеши репозиториев и пакеты:
sudo apt update
sudo apt upgrade
3. Установил docker.io и docker-compose
sudo apt-get install docker.io docker-compose
4.Настроил докер:
usermod -a -G docker $USER
systemctl restart docker
4. Создал каталоги, которые будут примонтированы к контейнерам для хранения данных:
sudo mkdir -p wordpress-compose
cd wordpress-compose/
sudo touch docker-compose.yml
sudo mkdir -p nginx/
sudo mkdir -p logs/
sudo mkdir -p logs/nginx
sudo mkdir -p data/
sudo mkdir -p data/html
sudo mkdir -p data/mysql
sudo mkdir -p prometheus
5. Cконфигурировал docker-compose.yaml (добавил в репозиторий)
6. Cконфигурировал nginx (скопировал конфиг в папку nginx)
7. Запустил docker-compose
sudo docker-compose up -d
8. Перешел на страницу ip:8080 и произвел первоначальную настройку. Установил плагин woocommerce, активировал его  (интернет-магазин, для большего числа метрик, и экспортер заточен под него)
9. Проверил наличие метрик в prometheus