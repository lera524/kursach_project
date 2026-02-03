#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DBNAME="${DB_NAME:-kursach1}"
DBUSER="${DB_USER:-postgres}"

echo "Creating database $DBNAME if not exists..."
psql -U "$DBUSER" -d postgres -c "CREATE DATABASE $DBNAME;" 2>/dev/null || true

echo "Running init_db.sql..."
psql -U "$DBUSER" -d "$DBNAME" -f "$SCRIPT_DIR/init_db.sql"

echo "Done. You can start the app (python app.py)."
