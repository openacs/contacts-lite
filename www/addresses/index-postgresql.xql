<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="addresses_select">      
      <querytext>
      
    select  a.contact_id,address_id,
            delivery_address || '<br>' || municipality || ' ' || region || ' ' || postal_code as address,
            country_code,address_type_id,
           acs_permission__permission_p(a.contact_id, :user_id,
                   	               'write') as write_p,
           acs_permission__permission_p(a.contact_id, :user_id,
                                       'delete') as delete_p
      from cn_addresses a, acs_objects o
      where a.contact_id = o.object_id
      and a.contact_id = :contact_id

      </querytext>
</fullquery>

 
</queryset>
