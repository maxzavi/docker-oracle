
1.- Crear base de datos oracle desde imagen con comando docker:


```bash
docker run -d -p 1521:1521 -p 5500:5500 \
  -e ORACLE_PASSWORD=Oracle123 \
  gvenzl/oracle-free
```

Luego te conectas con:

- Host: localhost
- Puerto: 1521
- Usuario: system
- Password: Oracle123
- SID/Service Name: FREEPDB1

Para conectarse dese sqlplus:

```bash
export LANG=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
sqlplus system/Oracle123@localhost:1521/FREEPDB1

2.- Crear base de datos con docker-compose, y con persistencia de datos, usando docker-compose.yml:

```bash
docker compose up -d
```

Luego te conectas con:

- Host: localhost
- Puerto: 1521
- Usuario: appuser
- Password: app123
- SID/Service Name: FREEPDB1

Para conectarse dese sqlplus:

```bash
export LANG=en_US.UTF-8
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
sqlplus system/Oracle123@localhost:1521/FREEPDB1
```
Crear esquema *demo*:

```sql
@sql/0_demo_schema.sql
```


Crear tabla de productos:

```sql
@sql/1_product_create.sql
```

Cargar datos de ejemplo:

```sql
@sql/2_product_load.sql
```

Crear tabla de locales:

```sql
@sql/3_local_create.sql
```

Cargar datos de ejemplo:

```sql
@sql/4_local_load.sql
```

Crear tabla de inventario:

```sql
@sql/5_inventory_create.sql
```

Cargar datos de ejemplo:

```sql
@sql/6_inventory_load.sql
```
