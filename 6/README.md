DZ 6 Установка ELK
1. Загрузил deb-пакеты, установил пакет elasticsearch. Записал сгенерированный пароль.
2. Выполнил первоначальную настройку /etc/elasticsearch/elasticsearch.yml, а именно пунктов:
node.name: ELK
cluster.name: ELK-cluster
node.roles: [ master, data ]
bootstrap.memory_lock: true
network.host: 192.168.0.108
http.port: 9200
3. Установил переменную окружения ES_JAVA_OPTS=-Xms4096m -Xmx4096m
4. Установил /etc/elasticsearch/jvm.options Xms и Xmx 4g
5. Отключил подкачку: sudo swapoff -a
6. Настроил виртуальную память: sysctl -w vm.max_map_count=262144 (так же добавил запись в /etc/sysctl.conf
7. Настроил временный каталог для JNA: export ES_TMPDIR=/usr/share/elasticsearch/tmp
8. Запустил сервис: systemctl daemon-reload
systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
9. Проверил работоспособность: curl -k --user elastic:'go-+4cnY6cMPopiDx5YA' https://192.168.0.108:9200/_cluster/health?pretty

Установка Kibana:
1. Установил kibana из deb-пакета.
2. Cбросил пароль для пользователя kibana-system: sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u kibana_system
3. Скопировал серты из эластика в кибану: sudo cp -R /etc/elasticsearch/certs /etc/kibana
sudo chown -R root:kibana /etc/kibana/certs
4. Выполнил настройку /etc/kibana/kibana.yml, а именно:
server.port: 5601
server.host: 192.168.0.108
elasticsearch.hosts: ["https://localhost:9200"]
elasticsearch.ssl.certificateAuthorities: [ "/etc/kibana/certs/http_ca.crt" ]
elasticsearch.username: "kibana_system"
elasticsearch.password: "mkEc93a6KScO4v6lO=Br"
5. Запустил сервис: systemctl daemon-reload
systemctl enable kibana.service
sudo systemctl start kibana.service
7. Перешел на страницу: http://192.168.0.108:5601 зашел под пользователем elastic

Установка logstash:
1. Установил logstash из deb-пакета.
2. systemctl enable logstash.service
3. Настраиваю порт для beats: sudo nano /etc/logstash/conf.d/input.conf
input {
  beats {
    port => 5044
  }
}

input {
  udp {
    host => "192.168.0.108"
    port => 10514
    codec => "json"
    type => "rsyslog"
  }
}
4. Копирую серты эластика в логстэш:
cp -R /etc/elasticsearch/certs /etc/logstash
chown -R root:logstash /etc/logstash/certs
5. Настраиваю подключение logstash к elastic: sudo nano /etc/logstash/conf.d/output.conf
output {
  if [type] == "rsyslog" {
        elasticsearch {
            hosts    => "https://localhost:9200"
            index    => "ssh-new-%{+YYYY.MM}"
            user => "elastic"
            password => "go-+4cnY6cMPopiDx5YA"
            cacert => "/etc/logstash/certs/http_ca.crt"
        }
  }
}
6. Настраиваем обработку логов sshd: sudo nano /etc/logstash/conf.d/ssh.conf
filter {
}
8. Запускаю logstash
systemctl daemon-reload
systemctl start logstash.service

Настройка rsyslog:
1. Настраиваю json-template: sudo nano /etc/rsyslog.d/01-json-template.conf
template(name="json-template"
type="list") {
constant(value="{")
constant(value="\"@timestamp\":\"")     property(name="timereported" dateFormat="rfc3339")
constant(value="\",\"@version\":\"1")
constant(value="\",\"message\":\"")     property(name="msg" format="json")
constant(value="\",\"sysloghost\":\"")  property(name="hostname")
constant(value="\",\"severity\":\"")    property(name="syslogseverity-text")
constant(value="\",\"facility\":\"")    property(name="syslogfacility-text")
constant(value="\",\"programname\":\"") property(name="programname")
constant(value="\",\"procid\":\"")      property(name="procid")
constant(value="\"}\n")
}
2. Добавляю правило в rsyslog: sudo nano /etc/rsyslog.d/ssh.conf:
if $programname == 'sshd' then @192.168.0.108:10514;json-template
3. Перезапускаю сервис:
sudo systemctl restart rsyslog.service

Проверка появились ли индексы:
4. curl -k --user elastic:'go-+4cnY6cMPopiDx5YA' https://192.168.0.108:9200/_cat/indices?v