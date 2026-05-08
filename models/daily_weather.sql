with daily_weather as
(

Select  
DATE(to_timestamp(time)) as date,
main,
temp,
lon as pressure,
lat as humidity 

from 
{{ source('sf_trial_5_may', 'weather_table_prod') }}

), 
cte2 as(

Select 
date,
main as weather, 
row_number() over(partition by date order by count(main) desc) as row_num, 
avg(temp)::decimal(18,2) as avg_temp,
avg(humidity)::decimal(18,2) as avg_humidity,
avg(pressure)::decimal(18,2) as avg_pressure, 
(avg_temp / 300) :: decimal(18,2) as avg_clouds
from daily_weather
group by date, main
qualify row_num =1
)
Select * exclude row_num from cte2