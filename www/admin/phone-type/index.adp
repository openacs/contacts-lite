<master>
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>

<h3>@title@</h3>
<hr>

<if @phone_types:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Admin Phone Type</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=phone_types>

<if @phone_types.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @phone_types.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="90%">
    <a href="add-edit?phone_type_id=@phone_types.phone_type_id@">@phone_types.description@</a>
  </td>

  <td width="10%" valign="right">
    <a href="delete?phone_type_id=@phone_types.phone_type_id@">Delete</a>
  </td>
</tr>
</multiple>

</table>
</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no phone types<br>&nbsp;</td>
    </tr>
  </table>
</else>

  <br>
  <a href="add-edit">New Phone Type</a>
