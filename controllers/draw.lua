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
	page:render('view',{draw = draw})
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
