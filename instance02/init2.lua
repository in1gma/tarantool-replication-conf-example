box.cfg {
    listen = 3305,
    replication = {
        'replicator:password@172.17.0.2:3305',
        'replicator:password@172.17.0.3:3305'
    },
    log = 'log',
    read_only = true
}

box.once('user_replicator', function()
    box.schema.user.create('replicator', { password = 'password' })
    box.schema.user.grant('replicator', 'replication')
end)