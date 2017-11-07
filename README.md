# master
sudo docker run --name tmaster -d -v /home/maks/files/mlab/tarantool-replication-expamle-conf/instance01:/usr/local/etc/tarantool/instances.enabled tarantool/tarantool
sudo docker exec -i -t tmaster /bin/sh

tarantoolctl start init1
tarantoolctl enter init1

## some master lua commands
box.space.test:insert{2, 200}
box.space.test:select{}

box.space._cluster:select{}


# slave
sudo docker run --name tslave01 -d -v /home/maks/files/mlab/tarantool-replication-expamle-conf/instance02:/usr/local/etc/tarantool/instances.enabled tarantool/tarantool
sudo docker exec -i -t tslave01 /bin/sh

tarantoolctl start init2
tarantoolctl enter init2

tarantoolctl status init2