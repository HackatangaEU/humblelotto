local M = {}

local json = require "lua-cjson"
function M.index(page)
	local draws = sailor.model("draw"):find_all()
	page:render('index',{draws = draws})
end

function M.create(page)
	local draw = sailor.model("draw"):new()
	local saved
	if next(page.POST) then
		draw:get_post(page.POST)
		saved = draw:save()
		if saved then
			page:redirect('draw/index')
		end
	end
	page:render('create',{draw = draw, saved = saved})
end



function M.update(page)
	local draw = sailor.model("draw"):find_by_id(page.GET.id)
	if not draw then
		return 404
	end
	local saved
	if next(page.POST) then
		draw:get_post(page.POST)
		saved = draw:update()
		if saved then
			page:redirect('draw/index')
		end
	end
	page:render('update',{draw = draw, saved = saved})
end

function M.view(page)
	local draw = sailor.model("draw"):find_by_id(page.GET.id)
	if not draw then
		return 404
	end

	if next(page.POST) and page.POST.organizations then
		page:inspect(page.POST)
		local org = sailor.model("organization"):find_by_attributes({name = page.POST.organizations})
		if org then
			local db = require "sailor.db"
			db.connect()
			db.query_insert("insert into org_draw values("..org.id..","..draw.id..") ")
			db.close()
		end
	end


	local orgs = sailor.model("organization"):find_all()
	
	for _,o in pairs(draw.organizations) do 
		for k,v in pairs(orgs) do 
			if o.id == v.id then
				orgs[k] = nil
			end
		end
	end
	page:inspect(orgs)

	local tickets = sailor.model("ticket"):find_all("datetime>='"..draw.date_begin.."' and datetime<='"..draw.date_end.."'")
	page:inspect(tickets)


	page:render('view',{draw = draw, orgs = orgs, tickets=tickets})
end

function M.delete(page)
	local draw = sailor.model("draw"):find_by_id(page.GET.id)
	if not draw then
		return 404
	end

	if draw:delete() then
		page:redirect('draw/index')
	end
end

function M.make(page)
	page.theme = nil
	local draw = sailor.model("draw"):find_by_id(page.GET.id)
	if not draw then
		return 404
	end

	local tickets = sailor.model("ticket"):find_all("datetime>='"..draw.date_begin.."' and datetime<='"..draw.date_end.."'")
	page:inspect(tickets)

	math.randomseed( os.time() )
	math.random(#tickets)
	local winner1 = math.random(#tickets)
	local winner2 = math.random(#tickets)
	while winner2 == winner1 do
		winner2 = math.random(#tickets)
	end
	draw.first_winner = tickets[winner1].id
	draw.second_winner = tickets[winner2].id
	if draw:save() then
		page:redirect('draw/view',{id=draw.id})
	end
end


return M
