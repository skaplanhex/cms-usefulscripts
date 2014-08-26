from scipy import *
from pylab import *

f=open('/Users/skaplan/scripts/tempor','r')
lines=f.readlines()
x=[]
y=[]
for i in lines:
    a=i.split()
    x.append(a[0])
    y.append(a[1])
plot(x,y)
show()
