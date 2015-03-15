<?lua
	local cjson = require "cjson"
	if next(page.POST) and page.POST.transactionJSON then

		local transaction = cjson.decode(page.POST.transactionJSON)

		page:inspect(transaction)
		if transaction and transaction.reference 
			and transaction.reference.address 
			and transaction.reference.n_tickets
			and transaction.reference.institution then

			local user = sailor.model('user'):find("wallet ='"..transaction.reference.address.."'")
			if not user then
				user = sailor.model('user'):new()
			end

			user.wallet = transaction.reference.address 
			if user:save() then

				for i=1,transaction.reference.n_tickets do 
					local ticket = sailor.model('ticket'):new()
					ticket.organization_id = transaction.reference.institution
					ticket.user_id = user.id
					ticket.datetime = os.date('%Y-%m-%d %H:%M:%S')
					ticket:save()
				end
			end

		end 

	end

	local test = {
		a = 'aaaa',
		reference = {
			address = '123124dfvxc',
			n_tickets = '2',
			institution = '1'
		}
	}

	page:inspect(cjson.encode(test))
?>

<form method='post'>
	<input type="hidden" name="transactionJSON" value='<%= cjson.encode(test) %>'/>
	<input type="submit"/>
</form>


?>