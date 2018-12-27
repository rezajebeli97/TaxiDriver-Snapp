
create table driver (
	driver_id serial primary key,
    driver_name varchar(20),
    driver_family varchar(20),
    driver_picture varchar(100),
    birth_date timestamp,
    certification_year date,
    isfinishedCooperation boolean,
    status varchar(20),
    driver_credit int,
    register_date timestamp 
);

----------------------------------------------------------------------------------------------------

create table driver_mobilephones(
    driver_id int primary key,
    mobilephone varchar(20),
    foreign key (driver_id) references driver(driver_id)
);

----------------------------------------------------------------------------------------------------

create table driver_landlinephones(
    driver_id int primary key,
    landlinephone varchar(20),
    foreign key (driver_id) references driver(driver_id)
);

----------------------------------------------------------------------------------------------------

create table profileEdit_driver (
    driver_id int,
    edited_column varchar(20),
    old_amount text,
    new_amount text,
    date timestamp,
    who varchar(20),
    primary key (driver_id , date),
    foreign key (driver_id) references driver(driver_id)
);

----------------------------------------------------------------------------------------------------

create table passenger (
    passenger_id serial primary key,
    isfinishedCooperation boolean
);

----------------------------------------------------------------------------------------------------

create table passenger_Has_Subscription (
    passenger_id int primary key,
    passenger_picture varchar(100),
    username varchar(20),
    passenger_credit int,
    foreign key (passenger_id) references passenger(passenger_id)
);

----------------------------------------------------------------------------------------------------

create table passenger_without_Subscription (
    passenger_id int primary key,
    foreign key (passenger_id) references passenger(passenger_id)
);

----------------------------------------------------------------------------------------------------

create table passenger_mobilephones(
    passenger_id int primary key,
    mobilephone varchar(20),
    foreign key (passenger_id) references passenger(passenger_id)
);

----------------------------------------------------------------------------------------------------

create table passenger_address(
    passenger_id int primary key,
    address varchar(100),
    foreign key (passenger_id) references passenger(passenger_id)
);

----------------------------------------------------------------------------------------------------

create table supporter (
    supporter_id serial primary key,
    supporter_name varchar(20),
    supporter_family varchar(20),
    supporter_picture varchar(100),
    isOnline boolean
);

----------------------------------------------------------------------------------------------------

create table account (
    account_id int,
    bank_name varchar(20),
    account_number varchar(20),
    primary key (account_id)
);

----------------------------------------------------------------------------------------------------

create table driver_account (
    driver_id int,
    account_id int,
    primary key (driver_id,account_id),
    foreign key (driver_id) references driver(driver_id),
    foreign key (account_id) references account(account_id)
);
----------------------------------------------------------------------------------------------------

create table cruise_driver (
    driver_id int,
    source varchar(20),
    destination varchar(20),
    time timestamp,
    primary key (time,driver_id),
    foreign key (driver_id) references driver(driver_id)
);

----------------------------------------------------------------------------------------------------

create table finishedCooperation_Date (
    driver_id int primary key,
    date timestamp,
    foreign key (driver_id) references driver(driver_id)
);

----------------------------------------------------------------------------------------------------

create table profileEdit_passenger (
    passenger_id int,
    edited_column varchar(20),
    old_amount text,
    new_amount text,
    date timestamp,
    who varchar(20),
    primary key (passenger_id , date),
    foreign key (passenger_id) references passenger(passenger_id)
);

----------------------------------------------------------------------------------------------------

create table report (
    driver_id int ,
    passenger_id int ,
    comment varchar(100),
    score int check ( score >=0 and score <= 20),
    time timeStamp,
    foreign key (passenger_id) references passenger(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    primary key (driver_id , passenger_id , time)
);

----------------------------------------------------------------------------------------------------

create table request (
    driver_id int ,
    passenger_id int ,
    driverAccept boolean,
    passengerAccept boolean,
    hasSubscription boolean,
    time timeStamp,
    cost int,
    foreign key (passenger_id) references passenger(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    primary key (driver_id , passenger_id , time)
);

----------------------------------------------------------------------------------------------------

create table journey_withSubscription (
    driver_id int ,
    passenger_id int ,
    source varchar(20),
    destination varchar(20),
    cost int,
    payment_method varchar(20),
    foreign key (passenger_id) references passenger_Has_Subscription(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    primary key (driver_id , passenger_id)
);

----------------------------------------------------------------------------------------------------

create table journey_withOutSubscription (
    driver_id int ,
    passenger_id int ,
    source varchar(20),
    destination varchar(20),
    cost int,
    foreign key (passenger_id) references passenger_without_Subscription(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    primary key (driver_id , passenger_id)
);

----------------------------------------------------------------------------------------------------

create table complaint (
    driver_id int ,
    passenger_id int ,
    supporter_id int ,
    request_time timestamp,
    answer_time timestamp,
    text varchar(100),
    foreign key (passenger_id) references passenger(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    foreign key (supporter_id) references supporter(supporter_id),
    primary key (driver_id , passenger_id , supporter_id , request_time)
);

----------------------------------------------------------------------------------------------------

create table delayFollow (
    driver_id int ,
    passenger_id int ,
    supporter_id int ,
    request_time timestamp,
    foreign key (passenger_id) references passenger(passenger_id),
    foreign key (driver_id) references driver(driver_id),
    foreign key (supporter_id) references supporter(supporter_id),
    primary key (driver_id , passenger_id , supporter_id , request_time)
);

----------------------------------------------------------------------------------------------------

create table reckoning (
    account_id int,
    supporter_id int,
    cost int,
    request_time timestamp,
    interception_code varchar(20),
    request_cause varchar(100),
    request_number int,
    payment_time timestamp,
    foreign key (account_id) references account(account_id),
    foreign key (supporter_id) references supporter(supporter_id),
    primary key (account_id,supporter_id)
);

----------------------------------------------------------------------------------------------------

create or replace function log_profile_driver_function()
returns trigger as $BODY$
begin
    if(new.driver_name <> old.driver_name) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_name',old.driver_name :: text, new.driver_name :: text, current_timestamp,current_user);
    end if;

    if(new.driver_family <> old.driver_family) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_family',old.driver_family :: text, new.driver_family :: text, current_timestamp,current_user);
    end if;

    if(new.driver_picture <> old.driver_picture) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_picture',old.driver_picture :: text, new.driver_picture :: text, current_timestamp,current_user);
    end if;

    if(new.birth_date <> old.birth_date) then
      insert into profileEdit_driver
      values (old.driver_id,'birth_date',old.birth_date :: text, new.birth_date :: text, current_timestamp,current_user);
    end if;

    if(new.certification_year <> old.certification_year) then
      insert into profileEdit_driver
      values (old.driver_id,'certification_year',old.certification_year :: text, new.certification_year :: text, current_timestamp,current_user);
    end if;

    if(new.isfinishedCooperation <> old.isfinishedCooperation) then
      insert into profileEdit_driver
      values (old.driver_id,'isfinishedCooperation',old.isfinishedCooperation :: text, new.isfinishedCooperation :: text, current_timestamp,current_user);
    end if;

    if(new.status <> old.status) then
      insert into profileEdit_driver
      values (old.driver_id,'status',old.status :: text, new.status :: text, current_timestamp,current_user);
    end if;

    if(new.driver_credit <> old.driver_credit) then
      insert into profileEdit_driver
      values (old.driver_id,'driver_credit',old.driver_credit :: text, new.driver_credit :: text, current_timestamp,current_user);
    end if;

    if(new.register_date <> old.register_date) then
      insert into profileEdit_driver
      values (old.driver_id,'register_date',old.register_date :: text, new.register_date :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$BODY$ language plpgsql;


  
create trigger log_profile_driver_trigger after update on driver
for each row
execute procedure log_profile_driver_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_driver_mobilephone_function()
returns trigger as $BODY$
begin
    if(old.mobilephone <> new.mobilephone) then
        insert into profileEdit_driver
        values (old.driver_id,'mobilephone', old.mobilephone :: text,new.mobilephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger log_profile_driver_mobilephone_trigger after update on driver_mobilephones
for each row
execute procedure log_profile_driver_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_driver_landlinephone_function()
returns trigger as $BODY$
begin
    if(old.landlinephone <> new.landlinephone) then
        insert into profileEdit_driver
        values (old.driver_id,'landlinephone', old.landlinephone :: text,new.landlinephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger log_profile_driver_landlinephone_trigger after update on driver_landlinephones
for each row
execute procedure log_profile_driver_landlinephone_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_driver_account_function()
returns trigger as $BODY$
begin
    if(old.account_id <> new.account_id) then
        insert into profileEdit_driver
        values (old.driver_id,'account_id', old.account_id :: text,new.account_id :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger log_profile_driver_account_trigger after update on driver_account
for each row
execute procedure log_profile_driver_account_function();

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

create or replace function log_profile_passenger_function()
returns trigger as $BODY$
begin
    if(new.username <> old.username) then
      insert into profileEdit_passenger
      values (old.passenger_id,'username',old.username :: text, new.username :: text, current_timestamp,current_user);
    end if;

    if(new.driver_picture <> old.driver_picture) then
      insert into profileEdit_passenger
      values (old.passenger_id,'driver_picture',old.driver_picture :: text, new.driver_picture :: text, current_timestamp,current_user);
    end if;

    if(new.passenger_credit <> old.passenger_credit) then
      insert into profileEdit_passenger
      values (old.passenger_id,'passenger_credit',old.passenger_credit :: text, new.passenger_credit :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$BODY$ language plpgsql;


  
create trigger log_profile_passenger_trigger after update on passenger_Has_Subscription
for each row
execute procedure log_profile_passenger_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_passenger_isfinishedcooperation_function()
returns trigger as $BODY$
begin
    if(new.isfinishedCooperation <> old.isfinishedCooperation) then
      insert into profileEdit_passenger
      values (old.passenger_id,'isfinishedCooperation',old.isfinishedCooperation :: text, new.isfinishedCooperation :: text, current_timestamp,current_user);
    end if;

  return new;
end;
$BODY$ language plpgsql;


  
create trigger log_profile_passenger_isfinishedcooperation_trigger after update on passenger
for each row
execute procedure log_profile_passenger_isfinishedcooperation_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_passenger_mobilephone_function()
returns trigger as $BODY$
begin
    if(old.mobilephone <> new.mobilephone) then
        insert into profileEdit_passenger
        values (old.passenger_id,'mobilephone', old.mobilephone :: text,new.mobilephone :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger log_profile_passenger_mobilephone_trigger after update on passenger_mobilephones
for each row
execute procedure log_profile_passenger_mobilephone_function();

----------------------------------------------------------------------------------------------------

create or replace function log_profile_passenger_address_function()
returns trigger as $BODY$
begin
    if(old.address <> new.address) then
        insert into profileEdit_passenger
        values (old.passenger_id,'address', old.address :: text,new.address :: text,current_timestamp,current_user);
    end if;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger log_profile_passenger_address_trigger after update on passenger_address
for each row
execute procedure log_profile_passenger_address_function();

----------------------------------------------------------------------------------------------------

create or replace function journey_delete_fuction1()
returns trigger as $BODY$
begin
    insert into request
    values (old.driver_id, old.passenger_id, true, true, true , current_timestamp, old.cost );
    update driver 
    set driver_credit = driver_credit + old.cost * 0.61
    where driver_id = old.driver_id;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger journey_delete_trigger1 after delete on journey_withSubscription
for each row
execute procedure journey_delete_fuction1();

----------------------------------------------------------------------------------------------------

create or replace function journey_delete_fuction2()
returns trigger as $BODY$
begin
    insert into request
    values (old.driver_id, old.passenger_id, true, true, false ,  current_timestamp, old.cost );
    update driver 
    set driver_credit = driver_credit + old.cost * 0.61
    where driver_id = old.driver_id;
    return new;
end;
$BODY$ language plpgsql;

  
create trigger journey_delete_trigger2 after delete on journey_withOutSubscription
for each row
execute procedure journey_delete_fuction2();


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Queries
----------------------------------------------------------------------------------------------------1

(select driver_id as id, driver_name as name, driver_family as family, status as status, 'Driver' as role, register_date as register_date
    from driver)
union
(select passenger_id as id, username as name, username as family, 'Active' as status, 'passenger' as role, null as register_date
    from passenger_Has_Subscription
)
union
(select passenger_id as id, null as name , null as family, 'Active' as status, 'passenger' as role, null as register_date
    from passenger_without_Subscription
)
union
(select supporter_id as id, supporter_name as name, supporter_family as family, 'Active' as status, 'Supporter' as role, null as register_date
    from supporter
)

----------------------------------------------------------------------------------------------------2

(
select driver_name,driver_family,status,time
from cruise_driver natural join driver
where source = 'meghdad'   and    destination = 'valiasr'     and     date(time) = current_date
)
union
(
select driver_name,driver_family,status,current_timestamp as time
from journey_withSubscription natural join driver
where source = 'meghdad'   and    destination = 'valiasr'
)
union
(
select driver_name,driver_family,status,current_timestamp as time
from journey_withOutSubscription natural join driver
where source = 'meghdad'   and    destination = 'valiasr'
)

----------------------------------------------------------------------------------------------------3

select * from report where driver_id = '1';

-----------------ezafe kardane matloobate soale 1  be 3 entity asli---------------------------------5

select *
from request
where hassubscription = false and driverAccept = true and passengerAccept = true

----------------------------------------------------------------------------------------------------6

(
select driver_id,passenger_id,passenger_picture,username,passenger_credit,source,destination
from journey_withSubscription natural join passenger_Has_Subscription
)
union
(
select driver_id,passenger_id,null as passenger_picture,null as username,null as passenger_credit,source,destination
from journey_withOutSubscription natural join passenger_without_Subscription
)

----------------------------------------------------------------------------------------------------7

select sum(cost) * 0.3 as sum_of_earned
from request 
where date(time)=current_date and passengeraccept = true and driverAccept = true

----------------------------------------------------------------------------------------------------8

select passenger_id
from request 
where driverAccept = false and driver_id = 1

----------------------------------------------------------------------------------------------------9

select driver_id
from request 
where passengerAccept = false and passenger_id = 1

----------------------------------------------------------------------------------------------------10

select 'reckoning' as role , account_id as id1 , null as id2
from reckoning
where supporter_id = 1
union
select 'delayfollow' as role , driver_id as id1 , passenger_id as id2
from delayfollow
where supporter_id = 1
union
select 'complaint' as role , driver_id as id1 , passenger_id as id2
from complaint
where supporter_id = 1

----------------------------------------------------------------------------------------------------11

select * 
from reckoning natural join supporter natural join account natural join driver
where supporter_id = 1

----------------------------------------------------------------------------------------------------12

select 'driver' as role , driver_id as id , date , edited_column , old_amount , new_amount
from profileEdit_driver
where who = 'manager'
union
select 'passenger' as role , passenger_id as id , date , edited_column , old_amount , new_amount
from profileEdit_passenger
where who = 'manager'

----------------------------------------------------------------------------------------------------13

select *
from complaint natural join supporter












