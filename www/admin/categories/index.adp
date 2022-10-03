<master>
<property name="title">@title;literal@</property>
<property name="context">@context_bar;literal@</property>

<h3>@title@</h3>
<hr>

<if @categories:rowcount;literal@ gt 0>
<table border="0" cellspacing="0" cellpadding="1" width="100%">
<tr>
  <th align="left">Category</th>
  <th>&nbsp;</th>
  <th>&nbsp;</th>
</tr>
<multiple name=categories>

<if @categories.rownum@ odd>
<tr bgcolor="#eeeeee">
</if>
<else @categories.rownum@ even>
<tr bgcolor="#ffffff">
</else>

  <td width="90%">
    <a href="add-edit?category_id=@categories.category_id@">@categories.category_name@</a>
  </td>

  <td width="10%" valign="right">
    <a href="delete?category_id=@categories.category_id@">Delete</a>
  </td>
</tr>
</multiple>

</table>
</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no categories<br>&nbsp;</td>
    </tr>
  </table>
</else>

  <br>
  <a href="add-edit">New Category</a>
