-- @cvs-id: $Id$

create or replace package cn_address
is
    --
    function new (
        address_id                      in cn_addresses.address_id%TYPE default null,
        delivery_address                in cn_addresses.delivery_address%TYPE,
        postal_code                     in cn_addresses.postal_code%TYPE,
        municipality                    in cn_addresses.municipality%TYPE,
        region                          in cn_addresses.region%TYPE,
        country_code                    in cn_addresses.country_code%TYPE,
        contact_id                      in cn_addresses.contact_id%TYPE,
        address_type_id                 in cn_addresses.address_type_id%TYPE,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    ) return cn_addresses.address_id%TYPE;
    --
    procedure delete (
        address_id in cn_addresses.address_id%TYPE
    );
end cn_address;
/
show errors

create or replace package body cn_address
is
    --
    function new (
        address_id                      in cn_addresses.address_id%TYPE default null,
        delivery_address                in cn_addresses.delivery_address%TYPE,
        postal_code                     in cn_addresses.postal_code%TYPE,
        municipality                    in cn_addresses.municipality%TYPE,
        region                          in cn_addresses.region%TYPE,
        country_code                    in cn_addresses.country_code%TYPE,
        contact_id                      in cn_addresses.contact_id%TYPE,
        address_type_id                 in cn_addresses.address_type_id%TYPE,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    )
    return cn_addresses.address_id%TYPE
    is
        v_address_id cn_addresses.address_id%TYPE;
    begin
        v_address_id := acs_object.new (
            object_id => address_id,
            object_type => object_type,
            creation_date => creation_date,
            creation_user => creation_user,
            creation_ip => creation_ip,
            context_id => context_id
        );
        --
        insert into cn_addresses
        (address_id, delivery_address, postal_code, municipality, region, country_code, contact_id, address_type_id)
        values
        (v_address_id, delivery_address, postal_code, municipality, region, country_code, contact_id, address_type_id);
	return v_address_id;
    end new;
    --
    procedure delete (
        address_id in cn_addresses.address_id%TYPE
    )
    is
    begin
        delete from cn_addresses
        where  address_id = cn_address.delete.address_id;
--
        acs_object.delete(address_id);
    end delete;
end cn_address;
/
show errors
