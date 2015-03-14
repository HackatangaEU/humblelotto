<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>user_id</th> 
		<th>datetime</th> 
		<th>organization_id</th> 
	</tr>
	<?lua for k,v in pairs(tickets) do ?>
		<tr onclick="location.href='<%= sailor.make_url('ticket/view',{id = v.id}) %>'" > 
			<td> <%= v.id %> </td> 
			<td> <%= v.user_id %> </td> 
			<td> <%= v.datetime %> </td> 
			<td> <%= v.organization_id %> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('ticket/create') %>" class="btn btn-primary">Create new ticket</a>
