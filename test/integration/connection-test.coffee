Connection = require('../../lib/connection')
fs = require('fs')

config = JSON.parse(fs.readFileSync(process.env.HOME + '/.tedious/test-connection.json', 'utf8'))
config.options.debug =
  data: true,
  payload: true

exports.test = (test) ->
  connection = new Connection(config.server, config.userName, config.password, config.options, (err, info) ->
    test.ok(!err)
    test.ok(info)

    test.done()
  )

  connection.on('debug', (message) ->
    #console.log(message);
  )

  
    #test.ok(info.infos.length > 0);
    #test.strictEqual(info.errors.length, 0);
  
    #test.ok(info.envChanges.length > 0);
    #info.envChanges.forEach(function(envChange) {
    #  if (envChange.type === 'database') {
    #    test.strictEqual(envChange.newValue, config.options.database);
    #  }
