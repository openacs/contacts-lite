-- @cvs-id: $Id$

-- lookup table 
create table cn_address_types
(
    address_type_id  integer
                     constraint address_types_pk
                       primary key,
    description      varchar2 (40)
                     constraint address_type_nn
                       not null
);

-- main table

create table cn_addresses
(
    address_id                       integer 
                                     constraint cn_addresses_address_id_pk
                                       primary key
                                     constraint cn_addresses_address_id_fk
                                       references acs_objects (object_id),
    delivery_address                 varchar2 (1000),
    postal_code                      varchar2 (30),
    municipality                     varchar2 (100),
    region                           varchar2 (100),
    country_code                     char     (2)
                                     constraint cn_addresses_country_code_fk
                                       references countries (iso),
    contact_id                       integer
                                     constraint cn_addresses_contact_id_fk
                                       references contacts (contact_id), 
    address_type_id                  integer
                                     constraint cn_addresses_address_type_fk
                                       references cn_address_types(address_type_id)
);

comment on table cn_addresses is '
This is the master address table. It is linked to person.
';

comment on column cn_addresses.delivery_address is '
This is the main delivery address. In the US of A it would be equivalent to line1, line2 and etc.
';

comment on column cn_addresses.postal_code is '
This is equivalent to zip in the good ol'' US of A.
';

comment on column cn_addresses.municipality is '
This is equivalent to City in the good ol'' US of A.
';

comment on column cn_addresses.region is '
This is equivalent to state in the good ol'' US of A.
';

comment on column cn_addresses.country_code is '
Required. This is the country of reference for validations and etc.
';

comment on column cn_addresses.contact_id is '
Foreign key into contacts table. All addresses will be hooked into contacts.
';

comment on column cn_addresses.address_type_id is '
This is a foreign key link into address_types.
';

-- plsql
@@cn-addresses-plsql.sql
