# Replication
## master
```
sudo docker run --name tmaster -d -v ~/files/mlab/tarantool-replication-conf-example/instance01:/usr/local/etc/tarantool/instances.enabled tarantool/tarantool
sudo docker exec -i -t tmaster /bin/sh
```

```
tarantoolctl start init1
tarantoolctl enter init1
```

### some master lua commands
```
box.space.test:insert{2, 200}
box.space.test:select{}

box.space._cluster:select{}
box.space._schema:select{}
box.info.replication
```

## slave
```
sudo docker run --name tslave01 -d -v ~/files/mlab/tarantool-replication-conf-example/instance02:/usr/local/etc/tarantool/instances.enabled tarantool/tarantool
sudo docker exec -i -t tslave01 /bin/sh
```

```
tarantoolctl start init2
tarantoolctl enter init2

tarantoolctl status init2
```

> *Может ли slave сам стать мастером?*