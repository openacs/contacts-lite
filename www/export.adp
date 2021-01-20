<master>
<property name="title">@page_title;noquote@</property>
<property name="context_bar">@context_bar;noquote@</property>

<h3>CSV Export Selection</h3>

<form name="search-select" action="csv-export-2" method="post">
 <input type="checkbox" name="given_name" title="First Name" checked>
 First Name<br />
 <input type="checkbox" name="middle_name" checked>
 Middle Name<br />
 <input type="checkbox" name="family_name" checked>
 Last Name<br />
 <input type="checkbox" name="preferred_name" checked>
 Preferred Name<br />
 <input type="checkbox" name="formatted_name" checked>
 Formatted Name<br />
 <input type="checkbox" name="affix" checked>
 Affix<br />
 <input type="checkbox" name="suffix" checked>
 Suffix<br />
 <input type="checkbox" name="category_id" checked>
 Contact Category<br />
 <input type="checkbox" name="title" checked>
 Title<br />
 <input type="checkbox" name="company_name" checked>
 Company Name<br />
 <input type="checkbox" name="company_type" checked>
 Company Type<br />
 <input type="checkbox" name="notes">
 Notes<br />
 <input type="checkbox" name="delivery_address" checked>
 Delivery Address<br />
 <input type="checkbox" name="municipality" checked>
 City<br />
 <input type="checkbox" name="region" checked>
 State<br />
 <input type="checkbox" name="postal_code" checked>
 Zip Code<br />
 <input type="checkbox" name="country_name" >
 Country<br />
 <input type="checkbox" name="address_type" checked>
 Address Type<br />
 <input type="checkbox" name="phone_number" checked>
 Phone Number<br />
 <input type="checkbox" name="phone_type" checked>
 Phone Type<p />
  Sort by<br />
 <select name="sort_by" multiple>
 <!--multiple name=columns-->
 <option value="">--- </option>
 <option value="company_name">Company Name </option>
 <option value="family_name">Last Name </option>
 <option value="given_name">First Name </option>
 <!--/multiple-->
 </select><p />

Category = <br />
 <select name="where_clause">
  <option value="">--- </option>
  <multiple name=categories>
  <option value="@categories.category_id@">@categories.category_name@</option>
 </multiple>
 </select>
 

 <p />
 <input type="submit" name="Submit" value="submit"> 

</form>
