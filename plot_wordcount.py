import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import pandas as pd

print('plotting wordcount from log_wordcount.txt...')
goal = 60000
start = '2018-01-01'
draft = '2018-06-01'
final = '2018-08-01'
deadline = '2018-09-01'

data = pd.read_csv('log_wordcount.txt',delim_whitespace=True,header=None, usecols=[0,1,3],
	names=['date','time','words'],parse_dates=[['date','time']],index_col=[0])

estimate = pd.DataFrame(data=[0,goal],index=[pd.Timestamp('2018-02-01'),pd.Timestamp('2018-06-01')])

plt.close('all')
fig, ax = plt.subplots(nrows=1,ncols=1,figsize=(8,5))

data.plot(ax=ax,marker='+',ms=3,mec='k',title='Words in commited thesis files',legend=False)
estimate.plot(ax=ax,legend=False,color='r')

# ax.xaxis.set_major_locator(mdates.WeekdayLocator(interval=2))
# ax.xaxis.set_major_formatter(mdates.DateFormatter('%b\n%d'))
ax.xaxis.set_major_locator(mdates.MonthLocator(interval=1))
ax.xaxis.set_major_formatter(mdates.DateFormatter('%b'))

ax.set_xlim(pd.Timestamp(start), pd.Timestamp(deadline))
# xmax = data.max()[0]*1.05
xmax = goal*1.05
ax.set_ylim(0, xmax)

# deadlines
ax.vlines(pd.Timestamp(draft),ymin=0, ymax=xmax, color='0.6')
ax.text(pd.Timestamp(draft),data.max()[0]*0.05, 'draft',
	color='0.6',rotation=90,va='bottom',ha='right')

ax.vlines(pd.Timestamp(final),ymin=0, ymax=xmax, color='0.6')
ax.text(pd.Timestamp(final),data.max()[0]*0.05, 'final',
	color='0.6',rotation=90,va='bottom',ha='right')

ax.vlines(pd.Timestamp(deadline),ymin=0, ymax=xmax, color='0.6')
ax.text(pd.Timestamp(deadline),data.max()[0]*0.05, 'deadline',
	color='0.6',rotation=90,va='bottom',ha='right')

plt.xticks(ax.get_xticks(), rotation=0,ha='center')
plt.xlabel('')
plt.tight_layout()
plt.savefig('plot_wordcount.png',dpi=300)

print('done')