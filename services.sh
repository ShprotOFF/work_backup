#!/bin/sh

# Записываем информацию в лог
echo "`date +"%Y-%m-%d_%H-%M-%S"` Запуск очистки БД nbpdvpg" >> /BackUp/logs/nbpdvpg.log

# Выполняем очистку и анализ базы данных
/opt/pgpro/1c-15/bin/vacuumdb --full --analyze --username postgres --dbname nbpdvpg

echo "`date +"%Y-%m-%d_%H-%M-%S"` БД nbpdvpg очищена" >> /BackUp/logs/nbpdvpg.log

sleep 3

echo "`date +"%Y-%m-%d_%H-%M-%S"` Запуск переиндексации таблиц БД nbpdvpg" >> /BackUp/logs/nbpdvpg.log

# Переиндексируем базу
/opt/pgpro/1c-15/bin/reindexdb --username postgres --dbname nbpdvpg

echo "`date +"%Y-%m-%d_%H-%M-%S"` Переиндексация таблиц БД nbpdvpg завершена\n" >> /BackUp/logs/nbpdvpg.log
