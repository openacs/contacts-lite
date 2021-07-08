-- @cvs-id: $Id$

select acs_object_type__drop_type('cn_address', TRUE);

CREATE OR REPLACE FUNCTION inline_0 ()  RETURNS integer AS $$  
BEGIN 
    PERFORM acs_object_type__create_type (  
  'cn_address', -- object_type  
  'Address', -- pretty_name 
  'Addresses', -- pretty_plural 
  'acs_object',   -- supertype 
  'cn_addresses', -- table_name 
  'address_id', -- id_column 
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
select define_function_args('cn_address__new','address_id,address_type_id,contact_id,delivery_address,municipality;null,postal_code;null,region;null,country_code,creation_user,creation_ip,context_id');

--
-- procedure cn_address__new/11
--
CREATE OR REPLACE FUNCTION cn_address__new(
   p_address_id integer,
   p_address_type_id integer,  -- default
   p_contact_id integer,       -- default
   p_delivery_address varchar, -- default
   p_municipality varchar,     -- default null
   p_postal_code varchar,      -- default null
   p_region varchar,           -- default null
   p_country_code varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer

) RETURNS integer AS $$
DECLARE 
  v_address_id cn_addresses.address_id%TYPE; 
BEGIN 
  v_address_id := acs_object__new (  
    p_address_id,  
    'cn_address', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_addresses 
    (address_id, address_type_id, contact_id, delivery_address, municipality, postal_code, region,country_code) 
  values
    (v_address_id, p_address_type_id, p_contact_id, p_delivery_address, p_municipality, 
     p_postal_code, p_region, p_country_code);

  PERFORM acs_permission__grant_permission (
     v_address_id,
     p_creation_user,
     'admin'
  );

  return v_address_id;

END;
$$ LANGUAGE plpgsql;



--
-- procedure cn_address__new/10
--
CREATE OR REPLACE FUNCTION cn_address__new(
   p_address_type_id integer,  -- default
   p_contact_id integer,       -- default
   p_delivery_address varchar, -- default
   p_municipality varchar,     -- default null
   p_postal_code varchar,      -- default null
   p_region varchar,           -- default null
   p_country_code varchar,
   p_creation_user integer,
   p_creation_ip varchar,
   p_context_id integer

) RETURNS integer AS $$
DECLARE 
  v_address_id cn_addresses.address_id%TYPE; 
BEGIN 
  v_address_id := acs_object__new (  
    null,  
    'cn_address', 
    now(), 
    p_creation_user, 
    p_creation_ip, 
    p_context_id 
  );   
  
  insert into cn_addresses 
    (address_id, address_type_id, contact_id, delivery_address, municipality, postal_code, region,country_code) 
  values
    (v_address_id, p_address_type_id, p_contact_id, p_delivery_address, p_municipality, 
     p_postal_code, p_region, p_country_code);

  PERFORM acs_permission__grant_permission (
     v_address_id,
     p_creation_user,
     'admin'
  );

  return v_address_id;

END;
$$ LANGUAGE plpgsql;


select define_function_args('cn_address__del','address_id');

CREATE OR REPLACE FUNCTION cn_address__del (
   p_address_id integer
)  RETURNS integer AS $$
DECLARE 
 v_return cn_addresses.address_id%TYPE := 0;  
BEGIN 
   delete from acs_permissions 
     where object_id = p_address_id; 

   delete from cn_addresses 
     where address_id = p_address_id;

   raise NOTICE 'Deleting cn_address...';

   return v_return;

END;
$$ language plpgsql;



-- added
select define_function_args('cn_address__set','address_id,address_type_id,contact_id,delivery_address,municipality;null,postal_code;null,region;null,country_code');

--
-- procedure cn_address__set/8
--
CREATE OR REPLACE FUNCTION cn_address__set(
   p_address_id integer,       -- default
   p_address_type_id integer,  -- default
   p_contact_id integer,       -- default
   p_delivery_address varchar, -- default
   p_municipality varchar,     -- default null
   p_postal_code varchar,      -- default null
   p_region varchar,           -- default null
   p_country_code varchar

) RETURNS integer AS $$
DECLARE 
  v_return integer := 0; 
BEGIN  

  if p_address_type_id is not null
  then
   update cn_addresses set address_type_id = p_address_type_id
    where address_id = p_address_id;
  end if;

  if p_contact_id is not null
  then
   update cn_addresses set contact_id = p_contact_id
    where address_id = p_address_id;
  end if;

  if p_delivery_address is not null
  then
   update cn_addresses set delivery_address = p_delivery_address
    where address_id = p_address_id;
  end if;

  if p_municipality is not null
  then
   update cn_addresses set municipality = p_municipality
    where address_id = p_address_id;
  end if;

  if p_postal_code is not null
  then
   update cn_addresses set postal_code = p_postal_code
    where address_id = p_address_id;
  end if;

  if p_region is not null
  then
   update cn_addresses set region = p_region
    where address_id = p_address_id;
  end if;

  if p_country_code is not null
  then
   update cn_addresses set country_code = p_country_code
    where address_id = p_address_id;
  end if;

  return v_return;
END;
$$ LANGUAGE plpgsql;



