<h2>
	View user #<%= user.id %> 
	<small>(<a href="<%= sailor.make_url('user/update', {id = user.id} ) %>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('user/delete', {id = user.id} ) %>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><%= user.id %> </td></tr> 
	<tr><td>wallet</td><td><%= user.wallet %> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('user/index') %>"><- Back to View All</a>
