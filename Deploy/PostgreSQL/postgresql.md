### Create DB and user

```bash
CREATE DATABASE demosite;
CREATE USER pguser WITH PASSWORD 'pgpass';

GRANT ALL PRIVILEGES ON DATABASE demosite TO pguser;
```

### Restore database

```bash
pg_restore -Fc -d 'postgresql://postgres:new_superuser_password@192.168.70.74:5000/demosite' -j 4 '/home/maksim/Downloads/qpdb/demosite.dump'
```