--[[
    Copyright 2017 wrxck <matthew@matthewhesketh.com>
    This code is licensed under the MIT. See LICENSE for details.
]]

local uuid = {}

local mattata = require('mattata')
local socket = require('socket')
local uuidgen = require('uuid')

function uuid:init()
    uuid.commands = mattata.commands(
        self.info.username
    ):command('uuid')
     :command('guid').table
    uuid.help = [[/uuid - Generates a random UUID. Alias: /guid.]]
end

function uuid:on_message(message)
    return mattata.send_message(
        message.chat.id,
        string.format(
            '<pre>%s</pre>',
            uuidgen()
        ),
        'html'
    )
end

return uuid