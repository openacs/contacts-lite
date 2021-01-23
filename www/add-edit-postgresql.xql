<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="new_contact">      
      <querytext>
        select contact__new (
	:affix,                   -- affix
	:given_name,              -- given_name
        :family_name,             -- family_name 
        :middle_name,             -- middle name
	:suffix,                  -- suffix
	:formatted_name,          -- formatted_name
	:preferred_given_name,    -- preferred_given_name
	:company_name,            -- company_name
	:company_type_id,         -- company_type_id
	:category_id,             -- category_id
        :notes,                   -- notes
	:email,                   -- email
	:title,                   -- title
        :user_id,                 -- user_id
        :peeraddr,                -- peeraddr
        :package_id,              -- package_id
        :contact_id               -- contact_id
        );
      </querytext>
</fullquery>

<fullquery name="set_contact">      
      <querytext>
        select contact__set (
	:affix,
	:given_name,
        :family_name,
        :middle_name,
	:suffix,
	:formatted_name,
	:preferred_given_name,
	:company_name,
	:company_type_id,
	:category_id,
        :notes,
	:email,
	:title,
        :contact_id
    );

      </querytext>
</fullquery>
 
</queryset>
