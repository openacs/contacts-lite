<master>
<property name="title">@title;noquote@</property>
<property name="context">@context_bar;noquote@</property>

<h3>@title@</h3>
<hr>

<if @company_types:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Admin Company Type</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=company_types>

<if @company_types.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @company_types.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="90%">
    <a href="add-edit?company_type_id=@company_types.company_type_id@">@company_types.company_type_name@</a>
  </td>

  <td width="10%" valign="right">
    <a href="delete?company_type_id=@company_types.company_type_id@">Delete</a>
  </td>
</tr>
</multiple>

</table>
</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no company types<br>&nbsp;</td>
    </tr>
  </table>
</else>

  <br>
  <a href="add-edit">New Company Type</a>
