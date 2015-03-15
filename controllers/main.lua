local main = {}

function main.index(page)
    page:render('index')
end

function main.adminLogin(page)
	local access = require 'sailor.access'
	access.salt = 'hackathanga'
	local hash = 'dc122b3f6f36fca2388dd1a2a643dfb50d7a630a'
	if next(page.POST) and page.POST.admin_login and page.POST.admin_pass then
		page:inspect("got post")
		if access.hash(page.POST.admin_login,page.POST.admin_pass) == hash then
			page:inspect("is equal")
			access.grant({id=1,username='admin'})
			page:redirect('main/index')
		end
	end
	page:render('admin')
end

return main
