<master>
<property name="title">Viewing @addresses.pretty_name;noquote@</property>
<property name="context_bar">@context_bar;noquote@</property>

<h3>Address Details</h3>
@addresses.pretty_name@
<table width="100%" summary="Main Table">
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
	<if @addresses.write_p;literal@ true>
          <a href="addresses/add-edit?contact_id=@contact_id@&address_id=@addresses.address_id@">edit</a> 
        </if>
        <if @addresses.delete_p;literal@ true>
	  <a href="addresses/delete?address_id=@addresses.address_id@&contact_id=@contact_id@">delete</a>
  	</if>
      </td>
    </tr>
 
    <tr>
    <td colspan="2">&nbsp;</td>
    </tr> 
    </table>    
    <if @contact_write_p;literal@ true>
    <div align="left"> [ <a href="addresses/add-edit?contact_id=@contact_id@">New Address</a> ]
    </div>
    </if>
    </td>
  </tr>
</table>



