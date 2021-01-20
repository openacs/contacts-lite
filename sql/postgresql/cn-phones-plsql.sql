-- @cvs-id: $Id$

select acs_object_type__drop_type('cn_phone_number', TRUE);

CREATE OR REPLACE FUNCTION inline_0 ()  RETURNS integer AS $$  
BEGIN 
    PERFORM acs_object_type__create_type (  
  'cn_phone_number', -- object_type  
  'Phone Number', -- pretty_name 
  'Phone Numbers', -- pretty_plural 
  'acs_object',   -- supertype 
  'cn_phone_numbers', -- table_name 
  'phone_number_id', -- id_column 
  'cn_phone_number', -- package_name 
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
select define_function_args('cn_phone_number__new','contact_id,phone_number,phone_number_id,phone_type_id,best_contact_time,creation_user,creation_ip,context_id');

--
-- procedure cn_phone_number__new/8
--
CREATE OR REPLACE FUNCTION cn_phone_number__new(
   p_contact_id integer,      -- default
   p_phone_number varchar,    -- default
   p_phone_number_id integer, -- default
   p_phone_type_id integer,   -- default
   p_best_contact_time varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer

) RETURNS integer AS $$
DECLARE 
  v_phone_number_id cn_phone_numbers.phone_number_id%TYPE; 
BEGIN 
  v_phone_number_id := acs_object__new (  
    null,  
    'cn_phone_number', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_phone_numbers 
    (contact_id, phone_number, phone_number_id, phone_type_id,best_contact_time) 
  values
    (p_contact_id, p_phone_number, v_phone_number_id, p_phone_type_id, p_best_contact_time);
  
  PERFORM acs_permission__grant_permission (
     v_phone_number_id,
     p_creation_user,
     'admin'
  );

  return v_phone_number_id;

END;
$$ LANGUAGE plpgsql;




-- added
select define_function_args('cn_phone_number__del','phone_number_id');

--
-- procedure cn_phone_number__del/1
--
CREATE OR REPLACE FUNCTION cn_phone_number__del(
   p_phone_number_id integer
) RETURNS integer AS $$
DECLARE 
 v_return integer := 0;  
BEGIN 

   delete from acs_permissions 
     where object_id = p_phone_number_id; 

   delete from cn_phone_numbers 
     where phone_number_id = p_phone_number_id;

   raise NOTICE 'Deleting cn_phone_number...';

   return v_return;

END;
$$ LANGUAGE plpgsql;

  


-- added
select define_function_args('cn_phone_number__set','contact_id,phone_number,phone_number_id,phone_type_id,best_contact_time');

--
-- procedure cn_phone_number__set/5
--
CREATE OR REPLACE FUNCTION cn_phone_number__set(
   p_contact_id integer,      -- default
   p_phone_number varchar,    -- default
   p_phone_number_id integer, -- default
   p_phone_type_id integer,   -- default
   p_best_contact_time varchar

) RETURNS integer AS $$
DECLARE 
  v_return integer := 0; 
BEGIN  

  if p_contact_id is not null
  then
   update cn_phone_numbers set contact_id = p_contact_id
    where phone_number_id = p_phone_number_id;
  end if;

  if p_phone_number is not null
  then
   update cn_phone_numbers set phone_number = p_phone_number
    where phone_number_id = p_phone_number_id;
  end if;

  if p_phone_type_id is not null
  then
   update cn_phone_numbers set phone_type_id = p_phone_type_id
    where phone_number_id = p_phone_number_id;
  end if;

  if p_best_contact_time is not null
  then
   update cn_phone_numbers set best_contact_time = p_best_contact_time
    where phone_number_id = p_phone_number_id;
  end if;

  return v_return;
END;
$$ LANGUAGE plpgsql;
