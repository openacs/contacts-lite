<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="phone_select">      
      <querytext>
      
    select contact_id,
        phone_number_id,
        best_contact_time,
	phone_number,
	p.phone_type_id,
	description
    from cn_phone_numbers p, cn_phone_types t
    where phone_number_id = :phone_number_id
    and p.phone_type_id = t.phone_type_id (+)
  
      </querytext>
</fullquery>

 
<fullquery name="new_phone">      
      <querytext>
      
      declare
        id integer;
      begin
        id := cn_phone_number.new (
	contact_id      => :contact_id,
	phone_number    => :phone_number,
	best_contact_time => :best_contact_time,
	phone_type_id   => :phone_type_id,
        creation_user   => :user_id,
        creation_ip     => :peeraddr,
        context_id      => :package_id
        );

        acs_permission.grant_permission(
          object_id  => id,
          grantee_id => :user_id,
          privilege  => 'write'
        );

        acs_permission.grant_permission (
          object_id  => id,
          grantee_id => :user_id,
          privilege  => 'delete'
        );
      end;
    
      </querytext>
</fullquery>

 
</queryset>
