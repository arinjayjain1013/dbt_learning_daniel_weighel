Select * from 
{{ ref('trip_facts') }} trips 
inner join {{ ref('daily_weather') }} dweather 
on trips.trip_date = dweather.date