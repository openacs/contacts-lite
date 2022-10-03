<master>
<property name="title">@title;literal@</property>
<property name="context_bar">@context_bar;literal@</property>


<form name="search">
<table width="100%" cellpadding="1" bgcolor="#cccccc">
<tr><td>
<table width="100%" cellpadding="5" bgcolor="#eeeeee">
<tr><td align="left"><if admin_p ne 0>
  <a href="admin/">Admin</a>
</if>
</td>
  <td align="right">
 <input type="hidden" name="search_p" value="1">
 Search for:
 <input type="text" name="search_string" value="@search_string@">
 in
 <select name="search_in">
    <option value="any">Any
    <option value="lname">Last Name
    <option value="fname">First Name
    <option value="cmpny">Company
 </select>
 <input type="submit" value="Search">
 <if @search_p@ eq 1 and @search_string@ ne "">
 <input type="button" value="View All" onClick="clearSubmission();">
 </if>
</td></tr>
</table>
</td></tr>
</table>
</form>

<script language="javascript">
  function clearSubmission () {
    forma = document.search;

    forma.search_p.value = 0;
    forma.search_string.value = '';
    forma.submit();
  }
</script>



<if @contacts:rowcount;literal@ gt 0>

<if @contacts:rowcount;literal@ gt @max_dspl@>
  @showing@ of @total_contacts@ contacts<br/>
</if>

<table border="0" cellspacing="1" cellpadding="5" width="100%">
<tr bgcolor="#ffffff">
  <td colspan="7">
    <center>
    <multiple name="first_letter">
      <if @first_letter.letter@ ne @starts_with@>
      <a href=".?starts_with=@first_letter.letter@">@first_letter.letter@</a>
      </if>
      <else>
      <strong>@first_letter.letter@</strong>
      </else>
    </multiple>
    <if @starts_with@ eq "all">
      <strong>&nbsp;</strong>
    </if>
    <else>
      <a href=".?starts_with=all"><strong>All</strong></a>
    </else>
    </center>
      <br>

    <if @starts_with@ ne "">
    <div style="background-color: #eeeeee; width:100%;">
    <strong>@starts_with@:</strong>
    </div>
    </if>

    <if @search_p@ ne 0 and @search_string@ ne "">
    <div style="background-color: #eeeeee; width:100%;">
    <font size="+1"><strong>Search results :</strong></font>
    </div>
    </if>
  </td>
</tr>
</table>

<table>
<tr bgcolor="#cccccc">
  <th nowrap align="left" width=><a href=".?sort=lname&amp;search_p=@search_p@&amp;search_string=@search_string@&amp;starts_with=@starts_with@">Last Name</a></th>
  <th nowrap align="left"><a href=".?sort=fname&amp;search_p=@search_p@&amp;search_string=@search_string@&amp;starts_with=@starts_with@">First Name</a></th>
  <th align="left"><a href=".?sort=cmpny&amp;search_p=@search_p@&amp;search_string=@search_string@&amp;starts_with=@starts_with@">Company</a></th> 
  <th align="left" width="10%">Category</th>
  <th align="left" width="10%">Email</th>
  <td width="2%">&nbsp;</td>
  <td width="2%">&nbsp;</td>
</tr>
<multiple name=contacts>
<if @contacts.rownum@ odd>
<tr class="odd">
</if>
<else @contacts.rownum@ even>
<tr class="even">
</else>

  <td width="20%"><a href="one?contact_id=@contacts.contact_id@">@contacts.family_name@</a></td>

  <td width="20%">@contacts.given_name@</td>

  <td width="20%">
    @contacts.company_name@	
    </td>

  <td width="14%">
    <if @contacts.category@ not nil>@contacts.category@</if>
    <else>&nbsp;</else>
  </td>

  <td width="10%">
      @contacts.email@
  </td>
  <td width="10%">
      @contacts.category@
  </td>

  
  <if @admin_p;literal@ true>
   <td width="2%">
    <a href="add-edit?contact_id=@contacts.contact_id@">
     <img src="/graphics/Edit16.gif" border="0" alt="Edit""></a>
   </td>

   <td width="2%">
    <a href="delete?contact_id=@contacts.contact_id@">
     <img src="/graphics/Delete16.gif" border="0" alt="Delete"">
    </a>
   </td>
  </if>
 </tr>
</multiple>
</table>

<br><br>
@pagination_link;noquote@

</if>
<else>
  <table border="0" width="100%">
    <tr bgcolor="#eeeeee">
      <td align="center"><br>There are no contacts<br>&nbsp;</td>
    </tr>
  </table>
</else>

<if @contacts_create_p@ ne 0>
  <br>
  <div align="right">
  <a href="add-edit?mode=add">New contact</a>
  </div>
  <% # I am using this perm for now, probably for dev testing only %>
  <br>
</if>

