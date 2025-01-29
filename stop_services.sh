#!/bin/bash

#ps aux | grep '[g]radle': Находит процессы Gradle.
#awk '{print $2}': Извлекает только PID.
#xargs kill -9: Принудительно завершает процессы по PID.
ps aux | grep '[g]radle' | awk '{print $2}' | xargs kill -9

ps aux | grep '[g]radle'

#удаляем логи
rm -rf logs

#просмотр логов
ls -l logs
