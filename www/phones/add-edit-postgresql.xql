<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="phone_select">
      <querytext>
    select contact_id,
        phone_number_id,
        best_contact_time,
        phone_number,
        p.phone_type_id,
        description
    from cn_phone_numbers p left join  cn_phone_types t on (p.phone_type_id = t.phone_type_id)
    where phone_number_id = :phone_number_id

      </querytext>
</fullquery>

<fullquery name="new_phone">      
      <querytext>
        select cn_phone_number__new (
	:contact_id,
	:phone_number,
	:phone_number_id,
	:phone_type_id,
	:best_contact_time,
        :user_id,
        :peeraddr,
        :package_id
        );
      </querytext>
</fullquery>

</queryset>
