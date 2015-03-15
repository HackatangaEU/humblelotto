<?lua 
local a = require "sailor.access"
if a.is_guest() then ?>

<a href="<%= sailor.make_url('main/adminLogin') %>">Login</a> <br/>

<?lua else ?>

<a href="<%= sailor.make_url('draw/index') %>">Manage Draws</a> <br/>
<a href="<%= sailor.make_url('ticket/index') %>">Manage Tickets</a> <br/>
<a href="<%= sailor.make_url('organization/index') %>">Manage Organizations</a> <br/>
<a href="<%= sailor.make_url('user/index') %>">Manage Users</a> <br/>

<?lua end ?>