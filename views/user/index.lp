<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>wallet</th> 
	</tr>
	<?lua for k,v in pairs(users) do ?>
		<tr onclick="location.href='<%= sailor.make_url('user/view',{id = v.id}) %>'" > 
			<td> <%= v.id %> </td> 
			<td> <%= v.wallet %> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('user/create') %>" class="btn btn-primary">Create new user</a>
