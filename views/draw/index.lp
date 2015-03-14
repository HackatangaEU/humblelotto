<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>date_begin</th> 
		<th>date_end</th> 
		<th>first_winner</th> 
		<th>second_winner</th> 
		<th>sum</th> 
		<th>name</th> 
	</tr>
	<?lua for k,v in pairs(draws) do ?>
		<tr onclick="location.href='<%= sailor.make_url('draw/view',{id = v.id}) %>'" > 
			<td> <%= v.id %> </td> 
			<td> <%= v.date_begin %> </td> 
			<td> <%= v.date_end %> </td> 
			<td> <%= v.first_winner %> </td> 
			<td> <%= v.second_winner %> </td> 
			<td> <%= v.sum %> </td> 
			<td> <%= v.name %> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('draw/create') %>" class="btn btn-primary">Create new draw</a>
