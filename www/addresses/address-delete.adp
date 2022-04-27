<master src="master">
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>

<h3>@title@</h3>

<table width="100%">
<tr>
  <td width="50%" valign="top">
   Are you sure you want to delete <p><strong>@one_address.address@</strong><p>
  </td>
  <td width="50%" valign="top">
    <a href="address-delete-2?address_id=@one_address.address_id@&amp;contact_id=@one_address.contact_id@">Yes, delete address</a><p>
    <a href="one?contact_id=@one_address.contact_id@">No, return to contact</a>
  </td>
</tr>
</table>
