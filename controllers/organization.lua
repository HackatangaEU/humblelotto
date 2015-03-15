local M = {}
local cjson = require "cjson"

local function unfunction(obj)
	for k,v in pairs(obj) do 
		if type(v) == 'function' then
			obj[k] = nil
		elseif type(v) == 'table' then
			unfunction(v)
		end
	end
end

function M.index(page)
	local organizations = sailor.model("organization"):find_all()
	page:render('index',{organizations = organizations})
end

function M.create(page)
	local organization = sailor.model("organization"):new()
	local saved
	if next(page.POST) then
		organization:get_post(page.POST)
		saved = organization:save()
		if saved then
			page:redirect('organization/index')
		end
	end
	page:render('create',{organization = organization, saved = saved})
end

function M.update(page)
	local organization = sailor.model("organization"):find_by_id(page.GET.id)
	if not organization then
		return 404
	end
	local saved
	if next(page.POST) then
		organization:get_post(page.POST)
		saved = organization:update()
		if saved then
			page:redirect('organization/index')
		end
	end
	page:render('update',{organization = organization, saved = saved})
end

function M.view(page)
	local organization = sailor.model("organization"):find_by_id(page.GET.id)
	if not organization then
		return 404
	end
	page:render('view',{organization = organization})
end


function M.getList(page)
	page.theme = nil
	local date = os.date("%Y-%m-%d %H:%M:%S")
	local draw = sailor.model('draw'):find("date_begin <= '" .. date .. "' AND date_end >= '" .. date .. "'")
	local orgs = draw.organizations
	unfunction(orgs)
	page:write(cjson.encode(orgs))
end

function M.delete(page)
	local organization = sailor.model("organization"):find_by_id(page.GET.id)
	if not organization then
		return 404
	end

	if organization:delete() then
		page:redirect('organization/index')
	end
end

return M
