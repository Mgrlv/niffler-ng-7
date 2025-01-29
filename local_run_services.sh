#!/bin/bash

# shellcheck disable=SC2164
cd /"$HOME"/IdeaProjects/qa-guru/niffler-ng-7

# Получаем текущую версию Gradle
current_version=$(./gradlew --version | grep "Gradle " | awk '{print $2}')

# Целевая версия Gradle
target_version="8.6"

# Проверяем, отличается ли текущая версия от целевой
if [ "$current_version" != "$target_version" ]; then
  echo "Текущая версия Gradle: $current_version. Обновляем до версии $target_version..."
  ./gradlew wrapper --gradle-version="$target_version"
  echo "Gradle обновлен до версии $target_version."
else
  echo "Текущая версия Gradle ($current_version) уже соответствует целевой версии ($target_version). Обновление не требуется."
fi

mkdir -p logs

cd niffler-auth
nohup ../gradlew bootRun --args='--spring.profiles.active=local' > ../logs/niffler-auth.log 2> ../logs/niffler-auth-error.log &

cd ../niffler-gateway
nohup ../gradlew bootRun --args='--spring.profiles.active=local' > ../logs/niffler-gateway.log 2> ../logs/niffler-gateway-error.log &

cd ../niffler-userdata
nohup ../gradlew bootRun --args='--spring.profiles.active=local' > ../logs/niffler-userdata.log 2> ../logs/niffler-userdata-error.log &

cd ../niffler-currency
nohup ../gradlew bootRun --args='--spring.profiles.active=local' > ../logs/niffler-currency.log 2> ../logs/niffler-currency-error.log &

cd ../niffler-spend
nohup ../gradlew bootRun --args='--spring.profiles.active=local' > ../logs/niffler-spend.log 2> ../logs/niffler-spend-error.log &

cd ..