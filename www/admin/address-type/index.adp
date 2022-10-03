<master>
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>

<h3>@title@</h3>
<hr>

<if @address_types:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Admin Address Type</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=address_types>

<if @address_types.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @address_types.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="90%">
    <a href="add-edit?address_type_id=@address_types.address_type_id@">@address_types.description@</a>
  </td>

  <td width="10%" valign="right">
    <a href="delete?address_type_id=@address_types.address_type_id@">Delete</a>
  </td>
</tr>
</multiple>

</table>
</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no address types<br>&nbsp;</td>
    </tr>
  </table>
</else>

  <br>
  <a href="add-edit">New Address Type</a>
