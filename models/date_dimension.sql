with date_ranges as
(
    Select 
    to_timestamp(starttime)  as started_at, 
    date(to_timestamp(starttime)) as date_started_as,
    hour(to_timestamp(starttime)) as hour_started_as,
    dayofweek(to_timestamp(starttime)) as weekday_started_as,
    dayname(to_timestamp(starttime)) as day_name, 
    case when day_name in ('SUN','SAT') then 'holiday'
    else 'business_day'
    end as business_working_day, 
    case when month(to_timestamp(starttime)) in (12,1,2) then 'Winter'
    when month(to_timestamp(starttime)) in (3,4,5,6,9,10,11) then 'Summer'
    else 'Rainy'
    end as weather_started_at, 
    {{ date_to_weather('to_timestamp(starttime)')}} as weather_started_at_using_macro
    
    from 
    {{ source('sf_trial_5_may', 'bike_data') }}
)
Select * from date_ranges 