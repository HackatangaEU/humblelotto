<?lua local form = require "sailor.form" ?>
<h2>Create ticket</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<%= form.text(ticket,'id', 'class="form-control" placeholder="id"') %>
		<span class="help-block"> <%= ticket.errors.id or '' %> </span>
	</div>
	<div class="form-group">
		<label>user_id:</label>
		<%= form.text(ticket,'user_id', 'class="form-control" placeholder="user_id"') %>
		<span class="help-block"> <%= ticket.errors.user_id or '' %> </span>
	</div>
	<div class="form-group">
		<label>datetime:</label>
		<%= form.text(ticket,'datetime', 'class="form-control" placeholder="datetime"') %>
		<span class="help-block"> <%= ticket.errors.datetime or '' %> </span>
	</div>
	<div class="form-group">
		<label>organization_id:</label>
		<%= form.text(ticket,'organization_id', 'class="form-control" placeholder="organization_id"') %>
		<span class="help-block"> <%= ticket.errors.organization_id or '' %> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="<%= sailor.make_url('ticket/index') %>"><- Back to View All</a>
