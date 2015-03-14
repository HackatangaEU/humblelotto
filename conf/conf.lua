local conf = {
	sailor = {
		app_name = 'Humble Lotto',
		default_static = nil, -- If defined, default page will be a rendered lp as defined. 
							  -- Example: 'maintenance' will render /views/maintenance.lp
		default_controller = 'main', 
		default_action = 'index',
		theme = 'default',
		layout = 'main',
		route_parameter = 'r',
		default_error404 = 'error/404',
		enable_autogen = true, -- default is false, should be true only in development environment
		friendly_urls = false,
		max_upload = 1024 * 1024, 
	},
	db = {
		driver = 'mysql',
		host = 'localhost',
		user = 'root',
		pass = '1234',
		dbname = 'humblelotto'
	},
	smtp = {
		server = '',
		user = '',
		pass = '',
		from = ''
	},
	debug = {
		inspect = false
	}
}

return conf
