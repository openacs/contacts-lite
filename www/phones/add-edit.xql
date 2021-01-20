<?xml version="1.0"?>
<queryset>

<fullquery name="get_contact_name">      
      <querytext>
      select given_name || ' ' || family_name as contact_info from contacts where contact_id = :contact_id
      </querytext>
</fullquery>

 
<fullquery name="get_phone_types">      
      <querytext>
      select description, phone_type_id from cn_phone_types
      </querytext>
</fullquery>

<fullquery name="set_phone">      
      <querytext>
    update cn_phone_numbers
    set 
      phone_number = :phone_number,
      contact_id = :contact_id,
      phone_type_id = :phone_type_id,
      best_contact_time = :best_contact_time
    where phone_number_id = :phone_number_id
      </querytext>
</fullquery>
 

</queryset>
