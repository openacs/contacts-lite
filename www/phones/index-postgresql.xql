<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="phones_select">      
      <querytext>
      
    select  contact_id,phone_number_id,phone_number,
           description as phone_type,
           acs_permission__permission_p(contact_id, :user_id,
                   	               'write') as write_p,
           acs_permission__permission_p(contact_id, :user_id,
                                       'delete') as delete_p
      from cn_phone_numbers p, acs_objects o, cn_phone_types t
      where p.contact_id = o.object_id
      and p.contact_id = :contact_id
      and p.phone_type_id = t.phone_type_id

      </querytext>
</fullquery>

 
</queryset>
