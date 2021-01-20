<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="new_address">      
      <querytext>
      
      declare
        id integer;
      begin
        id := cn_address.new (
        contact_id      => :contact_id,
	delivery_address => :delivery_address,
	postal_code     => :postal_code,
	municipality    => :municipality,
	region          => :region,
	country_code    => :country_code,
	address_type_id => :address_type_id,
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
