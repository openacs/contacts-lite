<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="contact_select">      
      <querytext>
    select contact_id,
        title,
        given_name,
	family_name,
	middle_name,
	preferred_given_name,
	formatted_name,
	affix,
	company_name,
	notes,
        company_type_name,
	given_name || ' ' || family_name as pretty_name,
        case when acs_permission__permission_p(contact_id,:user_id,'write') = 't'
  	  then 1 else 0 end as write_p,
        case when acs_permission__permission_p(contact_id,:user_id,'delete') = 't'
	  then 1 else 0 end as delete_p
    from contacts c left join cn_company_types t on (c.company_type_id = t.company_type_id)
    where contact_id = :contact_id

      </querytext>
</fullquery>

 
<fullquery name="address_select">      
      <querytext>
    select address_id,
           delivery_address,
           municipality,
           region,
           postal_code,
           description as add_desc,
           default_name as country,
	   cn.given_name || ' ' || cn.family_name as pretty_name,
           case when acs_permission__permission_p(address_id, :user_id, 'write')='t'
               then 1 else 0 end as write_p,
           case when acs_permission__permission_p(address_id, :user_id, 'delete')='t'
               then 1 else 0 end  as delete_p
    from cn_addresses a left join cn_address_types t on (a.address_type_id = t.address_type_id), countries c, contacts cn
    where a.address_id = :address_id
    and a.country_code = c.iso
    and :contact_id = cn.contact_id
      </querytext>
</fullquery>

 
</queryset>
