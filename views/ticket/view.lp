<h2>
	View ticket #<%= ticket.id %> 
	<small>(<a href="<%= sailor.make_url('ticket/update', {id = ticket.id} ) %>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('ticket/delete', {id = ticket.id} ) %>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><%= ticket.id %> </td></tr> 
	<tr><td>user_id</td><td><%= ticket.user_id %> </td></tr> 
	<tr><td>datetime</td><td><%= ticket.datetime %> </td></tr> 
	<tr><td>organization_id</td><td><%= ticket.organization_id %> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('ticket/index') %>"><- Back to View All</a>
