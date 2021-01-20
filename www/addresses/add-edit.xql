<?xml version="1.0"?>
<queryset>

<fullquery name="get_contact">      
      <querytext>
      
  select given_name || ' ' || family_name as pretty_name from contacts where contact_id = :contact_id

      </querytext>
</fullquery>

<fullquery name="get_address_types">      
    <querytext>
      
      select description, address_type_id from cn_address_types
    
    </querytext>
</fullquery>

<fullquery name="get_countries">      
    <querytext>
      select default_name, iso from countries
      where default_name != 'UNITED STATES'
    </querytext>
</fullquery>

<fullquery name="get_states">      
    <querytext>
      
    select state_name,abbrev from us_states order by state_name
    
    </querytext>
</fullquery>

 
<fullquery name="address_select">      
      <querytext>
      
    select c.contact_id,
        family_name, 
        given_name,
        address_id,
        delivery_address,
        postal_code,
        municipality,
        region,
        country_code,
        address_type_id
    from contacts c , cn_addresses a
    where a.address_id = :address_id
    and c.contact_id = a.contact_id
  
      </querytext>
</fullquery>

 
<fullquery name="note_update">      
      <querytext>
      
      update cn_addresses
      set contact_id       = :contact_id,
	  delivery_address = :delivery_address,
	  postal_code      = :postal_code,
	  municipality     = :municipality,
	  region           = :region,
	  country_code     = :country_code,
	  address_type_id  = :address_type_id
      where address_id = :address_id
    
      </querytext>
</fullquery>

 
</queryset>
