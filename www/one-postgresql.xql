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
    email,
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

 
<fullquery name="get_addresses">      
      <querytext>
    select address_id,
           delivery_address,
           municipality,
           region,
           postal_code,
           description as add_desc,
           default_name as country,
           case when acs_permission__permission_p(address_id, :user_id, 'admin')='t'
               then 1 else 0 end as write_p,
           case when acs_permission__permission_p(address_id, :user_id, 'delete')='t'
               then 1 else 0 end  as delete_p
    from cn_addresses a left join cn_address_types t on (a.address_type_id = t.address_type_id), countries c
    where a.contact_id = :contact_id
    and a.country_code = c.iso
      </querytext>
</fullquery>

 
<fullquery name="get_phones">      
      <querytext>

    select pn.phone_number_id as phone_number_id,
           pn.phone_number as phone_number,
           pn.best_contact_time as best_contact_time,
           pt.description as phone_type,
           case when acs_permission__permission_p(phone_number_id, :user_id, 'write')='t'
               then 1 else 0 end as write_p,
           case when acs_permission__permission_p(phone_number_id, :user_id, 'delete')='t'
               then 1 else 0 end as delete_p
    from cn_phone_numbers pn left join cn_phone_types pt on (pn.phone_type_id = pt.phone_type_id)
    where pn.contact_id = :contact_id

      </querytext>
</fullquery>

 
</queryset>
