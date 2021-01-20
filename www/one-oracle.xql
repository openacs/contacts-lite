<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

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
        decode(acs_permission.permission_p(contact_id,
                                        :user_id,
                                        'write'),
            't',1,
            'f',0) as write_p,
       decode(acs_permission.permission_p(contact_id,
                                        :user_id,
                                        'delete'),
            't',1,
            'f',0) as delete_p
    from contacts c, company_types t
    where contact_id = :contact_id
    and c.company_type_id = t.company_type_id(+)

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
           decode(acs_permission.permission_p(address_id, :user_id, 'write'),'t',1,'f',0) as write_p,
           decode(acs_permission.permission_p(address_id, :user_id, 'delete'),'t',1,'f',0) as delete_p
    from cn_addresses a, cn_address_types t, countries c
    where a.contact_id = :contact_id
    and a.country_code = c.iso
    and a.address_type_id = t.address_type_id(+)

      </querytext>
</fullquery>

 
<fullquery name="get_phones">      
      <querytext>
      
    select pn.phone_number_id as phone_number_id,
           pn.phone_number as phone_number,
           pn.best_contact_time as best_contact_time,
           pt.description as phone_type,
           decode(acs_permission.permission_p(phone_number_id, :user_id, 'write'),'t',1,'f',0) as write_p,
           decode(acs_permission.permission_p(phone_number_id, :user_id, 'delete'),'t',1,'f',0) as delete_p
    from cn_phone_numbers pn, cn_phone_types pt
    where pn.contact_id = :contact_id
    and pn.phone_type_id = pt.phone_type_id(+)

      </querytext>
</fullquery>

 
</queryset>
