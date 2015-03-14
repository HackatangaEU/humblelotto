local M = {}

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

	page:inspect(page.POST)
	page:inspect("QQQQQ")
	if next(page.POST) then
		page:inspect(page.POST)
		page:inspect("AAAAA")
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

	page:render('view',{draw = draw, orgs = orgs})
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

return M
