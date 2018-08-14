import folium
import json
import pandas as pd
import codecs
'''#folium에서 좌표를 찍어서 해당영역 마커표시
map_osm = folium.Map(location=[45.5236,-122.6750])
#map_osm.save('data/Visualization_by_folium.html')

stamen = folium.Map(location=[45.5236,-122.6750],zoom_start=13)
#stamen.save('data/Visualization_by_folium.html')

stamen = folium.Map(location=[45.5236,-122.6750],tiles='Stamen Toner',zoom_start=13)
#stamen.save('data/Visualization_by_folium.html')

#map_1 = folium.Map(location=[45.372,-121.6972],zoom_start=12,tiles='Stamen Terrain')
folium.Marker([45.3288,-121.6625],popup='Mt.Hood Meadows',icon=folium.Icon(icon='cloud')).add_to(map_1)
folium.Marker([45.3311,-121.7113],popup='Timberline Lodge',icon=folium.Icon(icon='cloud')).add_to(map_1)
#map_1.save('data/Visualiztion_by_folium2.html')

map_2 = folium.Map(location=[45.5236,-122.6750],tiles='Stamen Toner',zoom_start=13)
folium.Marker([45.5244, -122.6699],popup='The Waterfront').add_to(map_2)
folium.CircleMarker([45.5215,-122.6261],radius=50,popup='Laurehurst Park',color='#3186cc',fill_color='#3186cc',).add_to(map_2)
#map_2.save('data/Visualization_by_folium3.html')
'''
#범죄율에 대한 지도 시각화
crime_anal_norm = pd.read_csv('data/crime_in_Seoul_norm.csv',thousands=',', encoding='utf-8')
print(crime_anal_norm)
geo_path = 'data/skorea_municipalities_geo_simple.json'
geo_str = json.load(open(geo_path,encoding='utf-8-sig'))

map = folium.Map(location=[37.5502,126.982],zoom_start=11,tiles='Stamen Toner')

map.choropleth(geo_data = geo_str,data = crime_anal_norm['강간'],
               columns=[crime_anal_norm['구별'],crime_anal_norm['강간']],
               fill_color = 'PuRd',
               key_on='feature.id')
map.save('data/Visualization_by_folium4.html')

