<master>
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>

<h3>@title@</h3>
<hr>
<if admin_p ne 0>
  <a href="admin/">Admin</a>
</if>
<hr>
@contacts.pretty_name@<br>
<strong>@contacts.company_name@</strong>
<hr>
<if @phones:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Phone Numbers</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=phones>

<if @phones.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @phones.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="10%">
    <a href="one?phone_id=@phones.phone_number_id@">@phones.phone_number_id@</a>
  </td>

  <td width="25%">
    @phones.phone_number@
  </td>
  <td width="60%">
    @phones.phone_type@
  </td>

  <td width="5%" valign="right">
  <if @phones.write_p;literal@ true>
    <a href="add-edit?contact_id=@phones.contact_id@&amp;phone_number_id=@phones.phone_number_id@">Edit</a>
  </if>
  <else>
    &nbsp;
  </else>
  </td>

  <td width="5%" valign="right">
  <if @phones.delete_p;literal@ true>
    <a href="delete?phone_number_id=@phones.phone_number_id@">Delete</a>
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
      <td align="center"><br>There are no phone numbers<br>&nbsp;</td>
    </tr>
  </table>
</else>

<if @phones_create_p@ ne 0>
  <br>
  <a href="add-edit?contact_id=@contacts.contact_id@">New Phone</a>
</if>
