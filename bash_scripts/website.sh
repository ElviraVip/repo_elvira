#!/bin/bash

# Запрашиваем URL у пользователя
read -p "Введите URL веб-сайта для проверки: " URL

# Если URL не введен, используем google.com
if [ -z "$URL" ]; then
    URL="https://google.com"
fi

# Отправляем запрос на URL и сохраняем HTTP статус код
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L $URL)

# Проверяем статус код
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Веб-сайт $URL доступен."
else
    echo "Веб-сайт $URL недоступен. Статус: $HTTP_STATUS"
fi
