box.cfg {
    listen = 3303,
    replication = {
        'replicator:password@172.17.0.2:3303',
        'replicator:password@172.17.0.3:3303'
    },
    log = 'log',
    read_only = true
}

box.once('user_replicator', function()
    box.schema.user.create('replicator', { password = 'password' })
    box.schema.user.grant('replicator', 'replication')
end)