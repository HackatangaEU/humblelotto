<h2>
	View draw #<%= draw.id %> 
	<small>(<a href="<%= sailor.make_url('draw/update', {id = draw.id} ) %>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('draw/delete', {id = draw.id} ) %>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><%= draw.id %> </td></tr> 
	<tr><td>date_begin</td><td><%= draw.date_begin %> </td></tr> 
	<tr><td>date_end</td><td><%= draw.date_end %> </td></tr> 
	<tr><td>first_winner</td><td><%= draw.first_winner %> </td></tr> 
	<tr><td>second_winner</td><td><%= draw.second_winner %> </td></tr> 
	<tr><td>sum</td><td><%= draw.sum %> </td></tr> 
	<tr><td>name</td><td><%= draw.name %> </td></tr> 
</table> 
<br/>
<a href="<%= sailor.make_url('draw/index') %>"><- Back to View All</a>
