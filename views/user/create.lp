<?lua local form = require "sailor.form" ?>
<h2>Create user</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<%= form.text(user,'id', 'class="form-control" placeholder="id"') %>
		<span class="help-block"> <%= user.errors.id or '' %> </span>
	</div>
	<div class="form-group">
		<label>wallet:</label>
		<%= form.text(user,'wallet', 'class="form-control" placeholder="wallet"') %>
		<span class="help-block"> <%= user.errors.wallet or '' %> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="<%= sailor.make_url('user/index') %>"><- Back to View All</a>
