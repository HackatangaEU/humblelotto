-- Uncomment this to use validation rules
-- local val = require "valua"
local M = {}

-- Attributes and their validation rules
M.attributes = {
	-- {<attribute> = <validation function, valua required>}
	-- Ex. {id = val:new().integer()}
	{ id = "safe" },
	{ date_begin = "safe" },
	{ date_end = "safe" },
	{ first_winner = "safe" },
	{ second_winner = "safe" },
	{ sum = "safe" },
	{ name = "safe" },
}

M.db = {
	key = 'id',
	table = 'draws'
}

M.relations = {
	organizations = {relation = "MANY_MANY", model = "organization", table = "org_draw", attributes = {"draw_id","organization_id"}},
	first = {relation = "BELONGS_TO", model = "ticket", attribute = "first_winner"},
	second = {relation = "BELONGS_TO", model = "ticket", attribute = "second_winner"},
}

return M

