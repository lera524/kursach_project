@echo off
chcp 65001 >nul
set PGDATABASE=postgres
set DBNAME=kursach1
set DBUSER=postgres

if not "%DB_NAME%"=="" set DBNAME=%DB_NAME%
if not "%DB_USER%"=="" set DBUSER=%DB_USER%

echo Creating database %DBNAME% if not exists...
psql -U %DBUSER% -d postgres -c "CREATE DATABASE %DBNAME%;" 2>nul
if errorlevel 1 (
  echo Database may already exist, continuing...
) else (
  echo Database created.
)

echo Running init_db.sql...
psql -U %DBUSER% -d %DBNAME% -f "%~dp0init_db.sql"
if errorlevel 1 (
  echo Error. Check DB_USER, DB_NAME and that PostgreSQL is running.
  pause
  exit /b 1
)
echo Done. You can start the app (python app.py).
pause
