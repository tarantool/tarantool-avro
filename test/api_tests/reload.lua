local tap = require('tap')
local test = tap.test('reload test')

test:plan(1)

test:test('reload test', function(test)
    test:plan(1)

    -- Require the module first time.
    require('avro_schema')

    -- Unload it.
    package.loaded['avro_schema'] = nil
    package.loaded['avro_schema.backend'] = nil
    package.loaded['avro_schema.compiler'] = nil
    package.loaded['avro_schema.fingerprint'] = nil
    package.loaded['avro_schema.il'] = nil
    package.loaded['avro_schema.runtime'] = nil
    package.loaded['avro_schema.utils'] = nil

    -- Require it again.
    local ok, err = pcall(require, 'avro_schema')
    test:ok(ok, 'Successfully reloaded', {err = err})
end)

os.exit(test:check() and 0 or 1)
