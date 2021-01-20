<master>
<property name="title">@title;noquote@</property>
<property name="context_bar">@context_bar;noquote@</property>

<h3>@title@</h3>
<hr>
Are you sure you want to delete <p><b>@one_address.address@</b>?<p>

<a href="delete-2?address_id=@one_address.address_id@">Delete</a><p>
<a href=".?contact_id=@one_address.contact_id@&address_id=@one_address.address_id@">Return</a>
