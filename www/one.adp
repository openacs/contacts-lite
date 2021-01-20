<master>
<property name="title">Viewing @contact.pretty_name;noquote@</property>
<property name="context_bar">@context_bar;noquote@</property>

<h3>Contact Details</h3>

<table width="100%">
  <tr>
    <td valign="top" width="45%">
    <table>
    <tr><th valign=top align=right>Title</th>
    <td> @contact.title@ </td></tr>
    
    <tr><th valign=top align=right>First Name</th>
    <td> @contact.given_name@ </td></tr>
    
    <tr><th valign=top align=right>Middle Name</th>
    <td> @contact.middle_name@ </td></tr>
    
    <tr><th valign=top align=right>Family Name</th>
    <td> @contact.family_name@ </td></tr>

    <tr><th valign=top align=right>Email</th>
    <td> @contact.email@ </td></tr>
    
    <if @contact.preferred_given_name@ not nil>
    <tr><th valign=top align=right>Preferred Name</th>
    <td> @contact.preferred_given_name@ </td></tr>
    </if>
	 
    <if @contact.formatted_name@ not nil>
    <tr><th valign=top align=right>Formatted Name</th>
    <td> @contact.formatted_name@ </td></tr>
    </if>

    <if @contact.company_name@ not nil>
    <tr><th valign=top align=right>Company Name</th>
    <td> @contact.company_name@ </td></tr>
    </if>
	
    <if @contact.company_type_name@ not nil>
    <tr><th valign=top align=right>Company Type</th>
    <td> @contact.company_type_name@ </td></tr>
    </if>
	
    <if @contact.notes@ not nil>
    <tr><th valign=top align=right>Notes</th>
    <td> @contact.notes@ </td></tr>
    </if>

    <if @contact_write_p@ eq 1>
    <tr><td colspan="2" align="right">
    <a href="add-edit.tcl?contact_id=@contact_id@">edit info</a>
    </td></tr>
    </if>
    </table>
    </td>

    <td rowspan="2" width="5%"></td>

    <td rowspan="2" valign="top" width="40%">
    <h4>Address Information</h4>

    <table>
    <if @addresses:rowcount@ gt 0>
    <multiple name="addresses">
    <tr><th valign=top align=right>Address</th>
    <td>@addresses.delivery_address@</a></td>
    </tr>

    <tr><th valign=top align=right>City</th>
    <td> @addresses.municipality@ </td></tr>

    <tr><th valign=top align=right>Region</th>
    <td> @addresses.region@ </td></tr>
 
    <tr><th valign=top align=right>Zipcode</th>
    <td> @addresses.postal_code@ </td></tr>

    <tr><th valign=top align=right>Country</th>
    <td> @addresses.country@ </td></tr>

    <tr><th valign=top align=right>Address Type</th>
    <td> @addresses.add_desc@ </td></tr>

    <tr>
      <td colspan="2" align="right">
	<if @contact_write_p@ eq 1>
          <a href="addresses/add-edit?contact_id=@contact_id@&address_id=@addresses.address_id@">edit</a> 
        </if>
        <if @contact_write_p@ eq 1>
	  <a href="addresses/delete?address_id=@addresses.address_id@&contact_id=@contact_id@">delete</a>
  	</if>
      </td>
    </tr>
 
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr> 
    </multiple>
    </if>
    <else>
    <tr><td>No address information</td></tr>
    </else>
    </table>    
    <if @contact_write_p@ eq 1>
    <div align="left">
      [ <a href="addresses/add-edit?contact_id=@contact_id@">New Address</a> ]
    </div>
    </if>
    </td>
  </tr>

  <tr>
    <td>
    <br><br>
    <h4>Phone Information</h4>

    <table>
    <if @phones:rowcount@ gt 0>
    <multiple name="phones">
    <tr>
      <th align="right">Phone Number:</th>
      <td>@phones.phone_number@</td>
    </tr>
    <tr>
      <th align="right">Best Contact Time:</th>
      <td>@phones.best_contact_time@</td>
    </tr>
    <tr>
      <th align="right">Phone Type:</th>
      <td>@phones.phone_type@</td>
    </tr>
    <tr>
      <td colspan="2" align="right">
	<if @contact_write_p@ eq 1>
          <a href="phones/add-edit?contact_id=@contact_id@&phone_number_id=@phones.phone_number_id@">edit</a> 
        </if>
        <if @contact_write_p@ eq 1>
	  <a href="phones/delete?phone_number_id=@phones.phone_number_id@&contact_id=@contact_id@">delete</a>
  	</if>
      </td>
    </tr>

    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    </multiple>
    </if>
    <else>
    <tr>
      <td>No phone information</td>
    </tr>
    </else>
    </table>
    <if @contact_write_p@ eq 1>
    <div align="left">
      [ <a href="phones/add-edit?contact_id=@contact_id@">New Phone Number</a> ]
    </div>
    </if>
    </td>
  </tr>
</table>

[ <a href="/agent-info/one?agent_id=@contact_id@">Return to Agent Info</a> ]

