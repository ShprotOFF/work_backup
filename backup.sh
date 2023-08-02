#!/bin/sh

# Добавляем необходимые пути в переменные
DATA=`/usr/bin/date +"%Y-%m-%d_%H-%M"`
PATH=/BackUp/DB/nzpdvpg
NAME=nzpdvpg.sql.gz

# Записываем информацию в лог с секундами
echo "`/usr/bin/date +"%Y-%m-%d_%H-%M-%S"` Запущено резервное копирование БД nbpdvpg" >> /BackUp/logs/nbpdvpg.log

# Бэкапим базу данных, сразу сжимаем и создаём файл с путём...=)
/opt/pgpro/1c-15/bin/pg_dump -U postgres nbpdvpg | /usr/bin/pigz > $PATH/$DATA-$NAME | echo $PATH/$DATA-$NAME > last

# Записываем информацию в лог с секундами
echo "`/usr/bin/date +"%Y-%m-%d_%H-%M-%S"` БД nbpdvpg выгружена\n" >> /BackUp/logs/nbpdvpg.log

# Удаляем в папке с бэкапами архивы старше 2-x дней
/usr/bin/find /BackUp/DB/nbpdvpg -type f -mtime +2 -exec /usr/bin/rm -rf {} \;
