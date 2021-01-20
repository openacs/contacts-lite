-- @cvs-id: $Id$	

create or replace package contact
is
    --
    --
    function new (
        contact_id                  in contacts.contact_id%TYPE default null,
        family_name                 in contacts.family_name%TYPE,
        given_name                  in contacts.given_name%TYPE,
        middle_name                 in contacts.middle_name%TYPE default null,
        formatted_name              in contacts.formatted_name%TYPE default null,
        preferred_given_name        in contacts.preferred_given_name%TYPE default null,
        affix                       in contacts.affix%TYPE default null,
        suffix                      in contacts.suffix%TYPE default null,
        title                       in contacts.title%TYPE default null,
        email                       in contacts.email%TYPE default null,
        category_id                 in contacts.category_id%TYPE,
        company_name                in contacts.company_name%TYPE default null,
        company_type_id             in contacts.company_type_id%TYPE,
        notes                       in contacts.notes%TYPE,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    ) return contacts.contact_id%TYPE;
    --
    --
    procedure delete (
        contact_id in contacts.contact_id%TYPE
    );
end contact;
/
show errors


create or replace package body contact
is
    function new (
        contact_id                  in contacts.contact_id%TYPE default null,
        family_name                 in contacts.family_name%TYPE,
        given_name                  in contacts.given_name%TYPE,
        middle_name                 in contacts.middle_name%TYPE default null,
        formatted_name              in contacts.formatted_name%TYPE default null,
        preferred_given_name        in contacts.preferred_given_name%TYPE default null,
        affix                       in contacts.affix%TYPE default null,
        suffix                      in contacts.suffix%TYPE default null,
        title                       in contacts.title%TYPE default null,
        email                       in contacts.email%TYPE default null,
        category_id                 in contacts.category_id%TYPE,
        company_name                in contacts.company_name%TYPE default null,
        company_type_id             in contacts.company_type_id%TYPE,
        notes                       in contacts.notes%TYPE default null,
        object_type                     in acs_objects.object_type%TYPE default 'acs_object',
        creation_date                   in acs_objects.creation_date%TYPE default sysdate,
        creation_user                   in acs_objects.creation_user%TYPE default null,
        creation_ip                     in acs_objects.creation_ip%TYPE default null,
        context_id                      in acs_objects.context_id%TYPE default null
    ) return contacts.contact_id%TYPE
    is
        v_contact_id contacts.contact_id%TYPE;
    begin
        v_contact_id := acs_object.new (
            object_id => contact_id,
            object_type => object_type,
            creation_date => creation_date,
            creation_user => creation_user,
            creation_ip => creation_ip,
            context_id => context_id
        );
        --
        insert into contacts
        (contact_id, family_name, given_name, middle_name, formatted_name, preferred_given_name, affix,
         title, email,suffix,
         category_id, company_name, company_type_id)
        values
        (v_contact_id, family_name, given_name, middle_name, formatted_name, preferred_given_name, affix,
         title,email,suffix,
         category_id, company_name, company_type_id);
	return v_contact_id;
    end new;
    --
    --
    procedure delete (
        contact_id in contacts.contact_id%TYPE
    )
    is
    begin
        delete from contacts
        where  contact_id = contact.delete.contact_id;
        --
        acs_object.delete(contact_id);
    end delete;
    --
    --
end contact;
/
show errors
