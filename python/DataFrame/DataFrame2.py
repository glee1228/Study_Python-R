import numpy as np
import pandas as pd
import googlemaps
from sklearn import preprocessing

#데이터 출력 및 googleAPI 연동
crime_anal_police = pd.read_csv('data/crime_in_Seoul.csv',thousands=',', encoding='utf-8')
print(crime_anal_police.head())

gmaps_key = "AIzaSyDoo-W3P1VcrY-_JzpRBxkH_EDiYynCNEo"
gmaps = googlemaps.Client(key=gmaps_key)

print(gmaps.geocode('서울중부경찰서',language='ko'))

station_name = []

for name in crime_anal_police['관서명']:
    station_name.append('서울'+str(name[:-1])+'경찰서')

print(station_name)

#이름,위도, 경도 속성 geocode를 통해 리스트에 저장

station_address=[]
station_lat =[]
station_lng=[]

for name in station_name:
    tmp = gmaps.geocode(name,language='ko')
    station_address.append(tmp[0].get("formatted_address"))

    tmp_loc = tmp[0].get("geometry")

    station_lat.append(tmp_loc['location']['lat'])
    station_lng.append(tmp_loc['location']['lng'])
    print(name + '==>' + tmp[0].get("formatted_address"))

print(station_address)
print(station_lat)
print(station_lng)

#관서별 구 열 속성 추가하기
gu_name=[]
for name in station_address:
    tmp = name.split()
    #print(tmp)
    tmp_gu = [gu for gu in tmp if gu[-1] == '구'][0]
    #print(tmp_gu)
    gu_name.append(tmp_gu)

crime_anal_police['구별'] = gu_name
print(crime_anal_police.head())

print(crime_anal_police[crime_anal_police['관서명']=='금천서'])
print(crime_anal_police.loc[crime_anal_police['관서명']=='금천서',['구별']]=='금천구')

#crime_anal_police.to_csv('data/crime_in_Seoul_gu_name.csv',sep=',',encoding='utf-8')
crime_anal_raw = pd.read_csv('data/crime_in_Seoul_gu_name.csv',thousands=',', encoding='utf-8',index_col=0)

crime_anal = pd.pivot_table(crime_anal_raw,index='구별',aggfunc=np.sum)
print(crime_anal.head())

# 검거율 열 추가
crime_anal['강간검거율'] = crime_anal['강간 검거']/crime_anal['강간 발생']*100
crime_anal['강도검거율'] = crime_anal['강도 검거']/crime_anal['강도 발생']*100
crime_anal['살인검거율'] = crime_anal['살인 검거']/crime_anal['살인 발생']*100
crime_anal['절도검거율'] = crime_anal['절도 검거']/crime_anal['절도 발생']*100
crime_anal['폭력검거율'] = crime_anal['폭력 검거']/crime_anal['폭력 발생']*100

del crime_anal['강간 검거']
del crime_anal['강도 검거']
del crime_anal['살인 검거']
del crime_anal['절도 검거']
del crime_anal['폭력 검거']

print(crime_anal)

#???
con_list = ['강간검거율','강도검거율','살인검거율','절도검거율','폭력검거율']

for column in con_list :
    crime_anal.loc[crime_anal[column]>100,column]=100

print(crime_anal)

#열 이름 바꾸기
crime_anal.rename(columns = {'강간 발생':'강간',
                             '강도 발생':'강도',
                             '살인 발생':'살인',
                             '절도 발생':'절도',
                             '폭력 발생':'폭력'},inplace=True)

print(crime_anal.head())

# min_max_scaler 를 이용하여 지수로 표현
col = ['강간','강도','살인','절도','폭력']
x = crime_anal[col].values
min_max_scaler = preprocessing.MinMaxScaler()

x_scaled = min_max_scaler.fit_transform(x.astype(float))
crime_anal_norm = pd.DataFrame(x_scaled,columns =col, index =crime_anal.index)

col2 = ['강간검거율','강도검거율','살인검거율','절도검거율','폭력검거율']
crime_anal_norm[col2] = crime_anal[col2]

print(crime_anal_norm)

#CCTV_reulst의 인구수, 소계 열 속성을 crime_anal_norm dataframe에 복사
result_CCTV = pd.read_csv('data/cctv_result.csv',encoding='utf-8',index_col='구별')
crime_anal_norm[['인구수','CCTV']]= result_CCTV[['인구수','소계']]
print(crime_anal_norm)

#강간 강도 살인 절도 폭력 열을 sum하여 범죄 열로 추가
col = ['강간','강도','살인','절도','폭력']
crime_anal_norm['범죄'] = np.sum(crime_anal_norm[col],axis=1)
print(crime_anal_norm)

#강간검거율 강도검거율 살인검거율 절도검거율 폭력검거율을 다 더하여 검거 열로 추가
col = ['강간검거율','강도검거율','살인검거율','절도검거율','폭력검거율']
crime_anal_norm['검거'] = np.sum(crime_anal_norm[col],axis=1)
print(crime_anal_norm)

#결과물 저장
#crime_anal_norm.to_csv('data/crime_in_Seoul_norm.csv',sep=',',encoding='utf-8')