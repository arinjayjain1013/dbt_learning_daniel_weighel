{% macro date_to_weather(x) %}

case when month({{x}}) in (12,1,2) then 'Winter'
when month({{x}}) in (3,4,5,6,9,10,11) then 'Rainy'
else 'Summer'
end

{% endmacro %}