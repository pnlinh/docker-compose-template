SELECT 'CREATE DATABASE laravel_testing'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'laravel_testing')\gexec
