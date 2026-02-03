@echo off
chcp 65001 >nul
title Остановка системы учёта
echo Останавливаю сервер...
for /f "tokens=2" %%a in ('wmic process where "commandline like '%%app.py%%'" get processid 2^>nul ^| findstr /r "[0-9]"') do (
  taskkill /PID %%a /F 2>nul
  echo Сервер остановлен.
  goto :done
)
echo Процесс не найден. Возможно, программа уже закрыта.
:done
pause
