<master>
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>

<h3>@title@</h3>

<if admin_p ne 0>
  <a href="admin/">Admin</a><br/>
</if>

@contacts.pretty_name@<br>

<strong>@contacts.company_name@</strong><br>


<if @addresses:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Address</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=addresses>

<if @addresses.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @addresses.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="10%">
    <a href="one?address_id=@addresses.address_id@&amp;contact_id=@addresses.contact_id@">@addresses.address_id@</a>
  </td>

  <td width="60%">
    @addresses.address@
  </td>
  <td width="10%">
    @addresses.address_type_id@
  </td>

  <td width="5%" valign="right">
  <if @addresses.write_p;literal@ true>
    <a href="add-edit?address_id=@addresses.address_id@&amp;contact_id=@addresses.contact_id@">Edit</a>
  </if>
  <else>
    &nbsp;
  </else>
  </td>

  <td width="5%" valign="right">
  <if @addresses.delete_p;literal@ true>
    <a href="delete?address_id=@addresses.address_id@">Delete</a>
  </if>
  <else>
    &nbsp;
  </else>  
  </td>
</tr>
</multiple>
</table>
</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no addresses<br>&nbsp;</td>
    </tr>
  </table>
</else>

<if @addresses_create_p@ ne 0>
  <br>
  <a href="add-edit?contact_id=@contact_id@">New Address</a>
</if>
