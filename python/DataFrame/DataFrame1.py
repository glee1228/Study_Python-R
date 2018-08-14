import pandas as pd
import numpy as np

s = pd.Series([1,3,5,np.nan,6,8])
#print(s)
dates = pd.date_range('20130101',periods=6)
#print(dates)

df = pd.DataFrame(np.random.randn(6,4),index=dates,columns=['A','B','C','D'])
df.iloc[1]['A']=0

print(df)
#print(df.head())
#print(df.index)
#print(df.columns)
#print(df.values)
#print(df.info())
#print(df.describe())
#print(df.sort_values(by='B',ascending=False))
#print(float(df[0:1]['A']))
#print(df[1:1]['A'])
#print(df[0:3])
#print(df['20130102':'20130104'])
#print(df.loc[dates[0]])
#print(df.loc[:,['A','B']])
#print(df.loc['20130102':'20130104',['A','B']])
#print(df.loc['20130102',['A','B']])
#print(df.loc[dates[0],'A'])
#print(df.iloc[3])
#print(df.iloc[3,0])
#print(df.iloc[[1,2,4],[0,2]])
#print(df[df.A>0])