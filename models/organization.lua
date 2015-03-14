-- Uncomment this to use validation rules
-- local val = require "valua"
local M = {}

-- Attributes and their validation rules
M.attributes = {
	-- {<attribute> = <validation function, valua required>}
	-- Ex. {id = val:new().integer()}
	{ id = "safe" },
	{ name = "safe" },
	{ logo_path = "safe" },
	{ url = "safe" },
	{ description = "safe" },
	{ wallet = "safe" },
}

M.db = {
	key = 'id',
	table = 'organizations'
}

M.relations = {
	tickets = {relation = "HAS_MANY", model = "tickets", attribute = "organizaion_id"},
	draws = {relation = "MANY_MANY", model = "draw", table = "org_draw", attributes = {"organization_id","draw_id"}},

}

return M

