<h2>
	View organization #<%= organization.id %> 
	<small>(<a href="<%= sailor.make_url('organization/update', {id = organization.id} ) %>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('organization/delete', {id = organization.id} ) %>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><%= organization.id %> </td></tr> 
	<tr><td>name</td><td><%= organization.name %> </td></tr> 
	<tr><td>logo_path</td><td><%= organization.logo_path %> </td></tr> 
	<tr><td>url</td><td><%= organization.url %> </td></tr> 
	<tr><td>description</td><td><%= organization.description %> </td></tr> 
	<tr><td>wallet</td><td><%= organization.wallet %> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('organization/index') %>"><- Back to View All</a>
