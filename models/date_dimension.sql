with date_ranges as
(
    Select 
    starttime  as started_at, 
    date(starttime) as date_started_as,
    hour(starttime) as hour_started_as,
    dayofweek(starttime) as weekday_started_as,
    dayname(starttime) as day_name, 
    case when day_name in ('SUN','SAT') then 'holiday'
    else 'business_day'
    end as business_working_day, 
    case when month(starttime) in (12,1,2) then 'Winter'
    when month(starttime) in (3,4,5,6,9,10,11) then 'Summer'
    else 'Rainy'
    end as weather_started_at
    
    from 
    {{ source('sf_trial_5_may', 'bike_data') }}
)
Select * from date_ranges 