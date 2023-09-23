Logstash grok filters:
https://grokdebugger.com
https://github.com/cjslack/grok-debugger/tree/master/public/patterns

Выполнение ДЗ:
1. Установил вектор:
2. curl -1sLf \
  'https://repositories.timber.io/public/vector/cfg/setup/bash.deb.sh' \
| sudo -E bash
3. sudo apt-get install vector
4. Сконфигурировал vector.toml
5. ЗАпустил vector: sudo vector --config ~/.vector/config/vector.toml