Select distinct
start_station_id as station_id,
start_station_name, 
start_stattion_lat as start_station_lat,
start_station_lon

    from
    {{ source('sf_trial_5_may', 'bike_data') }}
