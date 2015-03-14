-- Uncomment this to use validation rules
local val = require "valua"
local M = {}

-- Attributes and their validation rules
M.attributes = {
	-- {<attribute> = <validation function, valua required>}
	-- Ex. {id = val:new().integer()}
	{ id = "safe" },
	{ wallet = val:new().len(0,35) }
}

M.db = {
	key = 'id',
	table = 'users'
}

M.relations = {
	tickets = {relation = "HAS_MANY", model = "tickets", attribute = "user_id"}
}

return M

