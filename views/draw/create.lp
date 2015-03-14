<?lua local form = require "sailor.form" ?>
<h2>Create draw</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<%= form.text(draw,'id', 'class="form-control" placeholder="id"') %>
		<span class="help-block"> <%= draw.errors.id or '' %> </span>
	</div>
	<div class="form-group">
		<label>date_begin:</label>
		<%= form.text(draw,'date_begin', 'class="form-control" placeholder="date_begin"') %>
		<span class="help-block"> <%= draw.errors.date_begin or '' %> </span>
	</div>
	<div class="form-group">
		<label>date_end:</label>
		<%= form.text(draw,'date_end', 'class="form-control" placeholder="date_end"') %>
		<span class="help-block"> <%= draw.errors.date_end or '' %> </span>
	</div>
	<div class="form-group">
		<label>first_winner:</label>
		<%= form.text(draw,'first_winner', 'class="form-control" placeholder="first_winner"') %>
		<span class="help-block"> <%= draw.errors.first_winner or '' %> </span>
	</div>
	<div class="form-group">
		<label>second_winner:</label>
		<%= form.text(draw,'second_winner', 'class="form-control" placeholder="second_winner"') %>
		<span class="help-block"> <%= draw.errors.second_winner or '' %> </span>
	</div>
	<div class="form-group">
		<label>sum:</label>
		<%= form.text(draw,'sum', 'class="form-control" placeholder="sum"') %>
		<span class="help-block"> <%= draw.errors.sum or '' %> </span>
	</div>
	<div class="form-group">
		<label>name:</label>
		<%= form.text(draw,'name', 'class="form-control" placeholder="name"') %>
		<span class="help-block"> <%= draw.errors.name or '' %> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="<%= sailor.make_url('draw/index') %>"><- Back to View All</a>
