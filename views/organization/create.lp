<?lua local form = require "sailor.form" ?>
<h2>Create organization</h2>
<?lua if saved == false then ?>
	There was an error while saving.
<?lua end ?>
<form method="post"> 
	<div class="form-group">
		<label>id:</label>
		<%= form.text(organization,'id', 'class="form-control" placeholder="id"') %>
		<span class="help-block"> <%= organization.errors.id or '' %> </span>
	</div>
	<div class="form-group">
		<label>name:</label>
		<%= form.text(organization,'name', 'class="form-control" placeholder="name"') %>
		<span class="help-block"> <%= organization.errors.name or '' %> </span>
	</div>
	<div class="form-group">
		<label>logo_path:</label>
		<%= form.text(organization,'logo_path', 'class="form-control" placeholder="logo_path"') %>
		<span class="help-block"> <%= organization.errors.logo_path or '' %> </span>
	</div>
	<div class="form-group">
		<label>url:</label>
		<%= form.text(organization,'url', 'class="form-control" placeholder="url"') %>
		<span class="help-block"> <%= organization.errors.url or '' %> </span>
	</div>
	<div class="form-group">
		<label>description:</label>
		<%= form.text(organization,'description', 'class="form-control" placeholder="description"') %>
		<span class="help-block"> <%= organization.errors.description or '' %> </span>
	</div>
	<div class="form-group">
		<label>wallet:</label>
		<%= form.text(organization,'wallet', 'class="form-control" placeholder="wallet"') %>
		<span class="help-block"> <%= organization.errors.wallet or '' %> </span>
	</div>
	<input type="submit" class="btn btn-primary"/>
</form> 
<br/>
<a href="<%= sailor.make_url('organization/index') %>"><- Back to View All</a>
