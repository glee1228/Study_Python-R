import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import platform

path ="c:/Windows/Fonts/malgun.ttf"
from matplotlib import font_manager,rc

if platform.system() =='Darwin':
    rc('font',family='AppleGothic')
elif platform.system()=='Windows':
    font_name = font_manager.FontProperties(fname=path).get_name()
    rc('font',family=font_name)
else :
    print('Unknown system... sorry')

crime_anal_norm = pd.read_csv('data/crime_in_Seoul_norm.csv',thousands=',', encoding='utf-8')
print(crime_anal_norm)
#강도 살인 폭력 3 속성을 서로 3*3으로 비교 연관그래프
sns.pairplot(crime_anal_norm,vars=["강도","살인","폭력"],kind='reg',height=3)
plt.show()

#x축 인구수 CCTV y축 살인 강도 비교분석한 연관그래프
sns.pairplot(crime_anal_norm,x_vars=["인구수","CCTV"],y_vars=["살인","강도"],kind='reg',height=3)
plt.show()
#x축 인구수 CCTV y축 살인검거율 폭력검거율 비교 분석한 연관그래프
sns.pairplot(crime_anal_norm,x_vars=["인구수","CCTV"],y_vars=["살인검거율","폭력검거율"],kind='reg',height=3)
plt.show()
#x축 인구수 CCTV y축 절도검거율 강도검거율 비교 분석한 연관그래프
sns.pairplot(crime_anal_norm,x_vars=["인구수","CCTV"],y_vars=["절도검거율","강도검거율"],kind='reg',height=3)
plt.show()

tmp_max = crime_anal_norm['검거'].max()
crime_anal_norm['검거'] = crime_anal_norm['검거'] /tmp_max * 100
crime_anal_norm_sort = crime_anal_norm.sort_values(by='검거',ascending=False)
print(crime_anal_norm_sort.head())

#최종 결과 데이터 출력
#crime_anal_norm.to_csv('data/crime_in_Seoul_final.csv',sep=',',encoding='utf-8')