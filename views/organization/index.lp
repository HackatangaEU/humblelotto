<style>
	.table td {
	    cursor: pointer;
	}
</style>
<h2>View all</h2>
<table class="table"> 
	<tr> 
		<th>id</th> 
		<th>name</th> 
		<th>logo_path</th> 
		<th>url</th> 
		<th>description</th> 
		<th>wallet</th> 
	</tr>
	<?lua for k,v in pairs(organizations) do ?>
		<tr onclick="location.href='<%= sailor.make_url('organization/view',{id = v.id}) %>'" > 
			<td> <%= v.id %> </td> 
			<td> <%= v.name %> </td> 
			<td> <%= v.logo_path %> </td> 
			<td> <%= v.url %> </td> 
			<td> <%= v.description %> </td> 
			<td> <%= v.wallet %> </td> 
		</tr>
	<?lua end ?> 
</table> 
<br/>
<a href="<%= sailor.make_url('organization/create') %>" class="btn btn-primary">Create new organization</a>
