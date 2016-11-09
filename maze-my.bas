w=20:m=25:k=(xmax-m)\w:b=(xmax-w*k)\2:h=(ymax-2*b)\k
dim a(1,w,h),v(w,h),s:i=rnd*w\1:j=rnd*h\1:c=[i,j]
v(i,j)=1:o=1:g=w*h:t=ticks
while o<g
  dim u:i=c(0):j=c(1)
  if i>0 && v(i-1,j)=0 then u << [i-1,j]
  if i<w-1 && v(i+1,j)=0 then u << [i+1,j]
  if j>0 && v(i,j-1)=0 then u << [i,j-1]
  if j<h-1 && v(i,j+1)=0 then u << [i,j+1]
  if len(u)
    n=u((rnd*100)%len(u)):x=n(0):y=n(1):s << c
    if i=x
      a(0,i,max(j,y))=1
    else
      a(1,max(i,x),j)=1
    fi
    c=n:v(x,y)=1:o++
  elif len(s)
    z=ubound(s):c=s(z):delete s,z
  else
    exit loop
  fi
wend
q=b:for j=0 to h:p=b:for i=0 to w
if i<w && !a(0,i,j) then line p,q,p+k,q,15
if j<h && !a(1,i,j) then line p,q,p,q+k,15
p+=k:next:q+=k:next:at k,ymax-txth("a")+1:?w,h,ticks-t;