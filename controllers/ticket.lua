local M = {}

function M.index(page)
	local tickets = sailor.model("ticket"):find_all()
	page:render('index',{tickets = tickets})
end

function M.create(page)
	local ticket = sailor.model("ticket"):new()
	local saved
	if next(page.POST) then
		ticket:get_post(page.POST)
		saved = ticket:save()
		if saved then
			page:redirect('ticket/index')
		end
	end
	page:render('create',{ticket = ticket, saved = saved})
end

function M.update(page)
	local ticket = sailor.model("ticket"):find_by_id(page.GET.id)
	if not ticket then
		return 404
	end
	local saved
	if next(page.POST) then
		ticket:get_post(page.POST)
		saved = ticket:update()
		if saved then
			page:redirect('ticket/index')
		end
	end
	page:render('update',{ticket = ticket, saved = saved})
end

function M.view(page)
	local ticket = sailor.model("ticket"):find_by_id(page.GET.id)
	if not ticket then
		return 404
	end
	page:render('view',{ticket = ticket})
end

function M.delete(page)
	local ticket = sailor.model("ticket"):find_by_id(page.GET.id)
	if not ticket then
		return 404
	end

	if ticket:delete() then
		page:redirect('ticket/index')
	end
end

return M
