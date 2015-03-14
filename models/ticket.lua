-- Uncomment this to use validation rules
-- local val = require "valua"
local M = {}

-- Attributes and their validation rules
M.attributes = {
	-- {<attribute> = <validation function, valua required>}
	-- Ex. {id = val:new().integer()}
	{ id = "safe" },
	{ user_id = "safe" },
	{ datetime = "safe" },
	{ organization_id = "safe" },
}

M.db = {
	key = 'id',
	table = 'tickets'
}

M.relations = {
	owner = {relation = "BELONGS_TO", model = "user", attribute = "user_id"},
	organization = {relation = "BELONGS_TO", model = "organization", attribute = "organization_id"},
}

return M

