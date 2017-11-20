box.cfg {
    listen = 3305,
    replication = {
        'replicator:password@172.17.0.2:3305',
        'replicator:password@172.17.0.3:3305'
    },
    log = 'log',
    read_only = false
}

box.space._cluster:select({0}, {iterator = 'GE'})

box.once('user_replicator', function()
    box.schema.user.create('replicator', { password = 'password' })
    box.schema.user.grant('replicator', 'replication')
end)

box.once('schema', function()
    box.schema.space.create('test')
    box.space.test:create_index('primary')
    box.space.test:insert{1, 100}
end)