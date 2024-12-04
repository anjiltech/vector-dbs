#! /bin/bash

### Clone and install postgres
echo "######## Cloning postgresql #########"
mkdir -p install/postgres

git clone  https://github.com/postgres/postgres.git
cd postgres/
./configure --prefix=/home/anjil/install/postgres
echo "######## make postgresql #########"
make
echo "######## install postgresql #########"
make install
export PATH=/home/anjil/install/postgres/bin:$PATH

cd /home/anjil

### Clone and install pgvector
echo "######## Cloning pgvector #########"
git clone https://github.com/pgvector/pgvector.git
export PG_CONFIG=/home/anjil/install/postgres/bin/pg_config
echo "######## make and install pgvector #########"
cd pgvector/
make
make install
echo "######## Done with pgvector installation #########"

sleep 5

cd /home/anjil/

### Start DB
echo "######## Start pgsql  #########"
mkdir -p /home/anjil/workloads/pgsql/
/home/anjil/install/postgres/bin/initdb -D /home/anjil/workloads/pgsql/
/home/anjil/install/postgres/bin/pg_ctl -D /home/anjil/workloads/pgsql/ -l logfile start

### Stop DB
# /home/anjil/install/postgres/bin/pg_ctl -D /home/anjil/workloads/pgsql/ -l logfile stop

