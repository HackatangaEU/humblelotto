<?lua local form = require "sailor.form" ?>
<h2>Update draw</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<%= form.text(draw,'id', 'class="form-control" placeholder="id"') %>
	</div>
	<div class="form-group">
		<label>date_begin:</label>
		<%= form.text(draw,'date_begin', 'class="form-control" placeholder="date_begin"') %>
	</div>
	<div class="form-group">
		<label>date_end:</label>
		<%= form.text(draw,'date_end', 'class="form-control" placeholder="date_end"') %>
	</div>
	<div class="form-group">
		<label>first_winner:</label>
		<%= form.text(draw,'first_winner', 'class="form-control" placeholder="first_winner"') %>
	</div>
	<div class="form-group">
		<label>second_winner:</label>
		<%= form.text(draw,'second_winner', 'class="form-control" placeholder="second_winner"') %>
	</div>
	<div class="form-group">
		<label>sum:</label>
		<%= form.text(draw,'sum', 'class="form-control" placeholder="sum"') %>
	</div>
	<div class="form-group">
		<label>name:</label>
		<%= form.text(draw,'name', 'class="form-control" placeholder="name"') %>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form>
<br/>
<a href="<%= sailor.make_url('draw/index') %>"><- Back to View All</a> 
