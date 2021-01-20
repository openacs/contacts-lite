-- @cvs-id: $Id$	

select acs_object_type__drop_type('contact', TRUE);

CREATE OR REPLACE FUNCTION inline_0 ()  RETURNS integer AS $$  
BEGIN 
    PERFORM acs_object_type__create_type (  
  'contact', -- object_type  
  'Contact', -- pretty_name 
  'Contacts', -- pretty_plural 
  'acs_object',   -- supertype 
  'contacts', -- table_name 
  'contact_id', -- id_column 
  null, -- package_name 
  'f', -- abstract_p 
  null, -- type_extension_table 
  null -- name_method 
  ); 

     return 0;  
END;
$$ LANGUAGE plpgsql; 

select inline_0 (); 

drop function inline_0 ();



-- added
select define_function_args('contact__new','affix,given_name,family_name,middle_name,suffix,formatted_name,preferred_given_name,company_name,company_type_id,category_id,notes,email,title,creation_user,creation_ip,context_id,contact_id');

--
-- procedure contact__new/17
--
CREATE OR REPLACE FUNCTION contact__new(
   p_affix varchar,                -- default
   p_given_name varchar,           -- default
   p_family_name varchar,          -- default
   p_middle_name varchar,          -- default
   p_suffix varchar,               -- default
   p_formatted_name varchar,       -- default
   p_preferred_given_name varchar, -- default
   p_company_name varchar,         -- default
   p_company_type_id integer,      -- default
   p_category_id integer,          -- default
   p_notes text,                   -- default
   p_email varchar,
   p_title varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer,
   p_contact_id integer

) RETURNS integer AS $$
DECLARE 
  v_contact_id contacts.contact_id%TYPE; 
BEGIN 
  v_contact_id := acs_object__new (  
    p_contact_id,  
    'contact', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (affix, given_name, family_name, 
     middle_name, suffix, formatted_name, 
     preferred_given_name, company_name, company_type_id, 
     category_id, notes,email,title,  contact_id) 
  values
    (p_affix, p_given_name, p_family_name, 
     p_middle_name, p_suffix, p_formatted_name, 
     p_preferred_given_name, p_company_name, p_company_type_id, 
     p_category_id, p_notes, p_email, p_title, v_contact_id);

  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     'admin'
  );

  return v_contact_id;

END;
$$ LANGUAGE plpgsql;

-- need for non-complete import


--
-- procedure contact__new/11
--
CREATE OR REPLACE FUNCTION contact__new(
   p_given_name varchar,      -- default
   p_family_name varchar,     -- default
   p_middle_name varchar,     -- default
   p_formatted_name varchar,  -- default
   p_company_name varchar,    -- default
   p_company_type_id integer, -- default
   p_category_id integer,     -- default
   p_email varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer

) RETURNS integer AS $$
DECLARE 

  v_contact_id contacts.contact_id%TYPE; 
  v_formatted_name contacts.formatted_name%TYPE;
BEGIN 
        if p_formatted_name is null 
        then
          v_formatted_name := p_given_name || ' ' || p_family_name;
        else
          v_formatted_name := p_formatted_name;
        end if;  

  v_contact_id := acs_object__new (  
    null,  
    'contact', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (given_name, family_name, middle_name, formatted_name, 
     preferred_given_name, company_name, company_type_id,email, category_id, contact_id) 
  values
    (p_given_name, p_family_name, p_middle_name,p_given_name || ' ' || p_family_name, 
     p_given_name, p_company_name, p_company_type_id, p_email,p_category_id, v_contact_id);


  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     'admin'
  );

  return v_contact_id;

END;
$$ LANGUAGE plpgsql;



--
-- procedure contact__new/12
--
CREATE OR REPLACE FUNCTION contact__new(
   p_given_name varchar,      -- default
   p_family_name varchar,     -- default
   p_middle_name varchar,     -- default
   p_formatted_name varchar,  -- default
   p_company_name varchar,    -- default
   p_company_type_id integer, -- default
   p_category_id integer,     -- default
   p_email varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer,
   p_contact_id integer

) RETURNS integer AS $$
DECLARE 

  v_contact_id contacts.contact_id%TYPE; 
  v_formatted_name contacts.formatted_name%TYPE;
BEGIN 
        if p_formatted_name is null 
        then
          v_formatted_name := p_given_name || ' ' || p_family_name;
        else
          v_formatted_name := p_formatted_name;
        end if;  

  v_contact_id := acs_object__new (  
    p_contact_id,  
    'contact', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into contacts 
    (given_name, family_name, middle_name, formatted_name, 
     preferred_given_name, company_name, company_type_id,email, category_id, contact_id) 
  values
    (p_given_name, p_family_name, p_middle_name,p_given_name || ' ' || p_family_name, 
     p_given_name, p_company_name, p_company_type_id, p_email,p_category_id, v_contact_id);


  PERFORM acs_permission__grant_permission (
     v_contact_id,
     p_creation_user,
     'admin'
  );

  return v_contact_id;

END;
$$ LANGUAGE plpgsql;




-- added
select define_function_args('contact__del','contact_id');

--
-- procedure contact__del/1
--
CREATE OR REPLACE FUNCTION contact__del(
   p_contact_id integer
) RETURNS integer AS $$
DECLARE 
 v_return integer := 0;  
BEGIN 

   delete from acs_permissions 
     where object_id = p_contact_id; 

   delete from contacts 
     where contact_id = p_contact_id;

   raise NOTICE 'Deleting contact...';

   return v_return;

END;
$$ LANGUAGE plpgsql;



-- added
select define_function_args('contact__set','affix,given_name,family_name,middle_name,suffix,formatted_name,preferred_given_name,company_name,company_type_id,category_id,notes,email,title,contact_id');

--
-- procedure contact__set/14
--
CREATE OR REPLACE FUNCTION contact__set(
   p_affix varchar,                -- default
   p_given_name varchar,           -- default
   p_family_name varchar,          -- default
   p_middle_name varchar,          -- default
   p_suffix varchar,               -- default
   p_formatted_name varchar,       -- default
   p_preferred_given_name varchar, -- default
   p_company_name varchar,         -- default
   p_company_type_id integer,      -- default
   p_category_id integer,          -- default
   p_notes text,                   -- default
   p_email varchar,
   p_title varchar,
   p_contact_id integer            -- default

) RETURNS integer AS $$
DECLARE 
  v_return integer := 0; 
BEGIN 

  update contacts
  set family_name          = p_family_name,
      given_name           = p_given_name,
      middle_name          = p_middle_name,
      formatted_name       = p_formatted_name,
      preferred_given_name = p_preferred_given_name,
      affix                = p_affix,
      title                = p_title,
      suffix               = p_suffix,
      email                = p_email,
      company_name         = p_company_name,
      company_type_id      = p_company_type_id,
      category_id          = p_category_id,
      notes                = p_notes
  where contact_id = p_contact_id;

  raise NOTICE 'Updating Contacts';

  return v_return;

END;
$$ LANGUAGE plpgsql;

