local M = {}

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
