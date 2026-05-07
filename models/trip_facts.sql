with trips as 
(
Select 
bikeid, 
user_type, 
start_station_id, 
end_station_id, 
tripduration,
iff(end_station_id %2 = 0, 'Electric bike', 'Normal Bike') as bike_type, 
starttime::date as trip_date
 from 
{{ source('sf_trial_5_may', 'bike_data') }}

)
select * from trips