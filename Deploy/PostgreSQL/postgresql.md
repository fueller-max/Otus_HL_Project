### 1.  Create DB and user

```bash
CREATE DATABASE demosite;
CREATE USER pguser WITH PASSWORD 'pgpass';
```

### 2. Restore database

```bash
pg_restore -Fc -d 'postgresql://postgres:new_superuser_password@192.168.70.74:5000/demosite' -j 4 '/home/maksim/Downloads/qpdb/demosite.dump'
```

### 3.Run current.sql

Before run: 

```bash
SET search_path TO qp;
```

### 4. give such rights to the base:

```bash
GRANT USAGE,CREATE ON SCHEMA qp TO pguser;
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES,TRIGGER ON ALL TABLES IN SCHEMA qp TO pguser;
GRANT USAGE,SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA qp TO pguser;
GRANT EXECUTE ON ALL ROUTINES IN SCHEMA qp TO pguser;
ALTER ROLE dpguser SET search_path TO qp,public;
ALTER DEFAULT PRIVILEGES IN SCHEMA qp GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES,TRIGGER ON
TABLES TO pguser;
ALTER DEFAULT PRIVILEGES IN SCHEMA qp GRANT USAGE,SELECT,UPDATE ON SEQUENCES TO pguser;
ALTER DEFAULT PRIVILEGES IN SCHEMA qp GRANT EXECUTE ON ROUTINES TO pguser;
CALL qp_change_contents_ownership('pguser');
```

