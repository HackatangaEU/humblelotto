<h2>
	View draw #<%= draw.id %> 
	<small>(<a href="<%= sailor.make_url('draw/update', {id = draw.id} ) %>" >update</a>)</small> 
	<small>(<a href="<%= sailor.make_url('draw/delete', {id = draw.id} ) %>" >delete</a>)</small>
</h2>
<table class="table"> 
	<tr><td>id</td><td><%= draw.id or '' %> </td></tr> 
	<tr><td>date_begin</td><td><%= draw.date_begin or '' %> </td></tr> 
	<tr><td>date_end</td><td><%= draw.date_end or '' %> </td></tr> 
	<tr><td>first_winner</td><td><%= draw.first.owner.wallet or '' %> - <%= draw.first.organization.name or '' %></td></tr> 
	<tr><td>second_winner</td><td><%= draw.second.owner.wallet or '' %> - <%= draw.second.organization.name or '' %></td></tr> 
	<tr><td>sum</td><td><%= draw.sum or '' %> </td></tr> 
	<tr><td>name</td><td><%= draw.name or '' %> </td></tr> 
	<tr>
		<td>Organizations</td>
		<td>
			<?lua 
				for _,o in pairs(draw.organizations) do 
					page:print(o.name..'<br/>')
				end
			?>
		</td>
	</tr> 
	<tr>
		<td>Tickets bought</td>
		<td>
			<?lua 
				for _,t in pairs(tickets) do 
					page:print(t.id..' - '..(t.organization.name or '')..'<br/>')
				end
			?>
		</td>
	</tr> 
</table> 
<br/>
<?lua if next(orgs) then ?>
<form method="post">
	<input list="organizations" name="organizations"/>

	<datalist id="organizations">
		<?lua 
			for _,o in pairs(orgs or {}) do 
				page:print('<option value="'..o.name..'">')
			end
		?>
	</datalist>
	<input type="submit" class="btn-xs btn-primary" value="Add Organization"/>
</form>
</br></br>
<?lua end ?>
<a class="btn-xs btn-primary" href="<%= sailor.make_url('draw/make',{id=draw.id}) %>">Make draw</a>
</br></br>
<a href="<%= sailor.make_url('draw/index') %>"><- Back to View All</a>


