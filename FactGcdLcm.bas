
'SmallBASIC,0.12.8 Android Sat, 22 Oct 2016, [jsalai49]
' Prime factors, divisors, gcd, lcm for integers
color 15,0
while 1
  ?:?"Enter integers > 1 for Factor, GCD and LCM"
  i=1:dim n
'  n=[12,23,34,45,56,67,78,89,91]
'  n=[123,234,345,456,567,678,789,891]
'  n=[1234,2345,3456,4567,5678,6789,7891] 'gcde - no ok
'  n=[12345,23456,34567,45678,56789,67891]
'  n=[123456,234567,345678,456789,567891] ' dv - slow
'  n=[1234567,2345678,3456789,4567891]
  while 1
    repeat
      ?"No-";i,:input,k:j=k in n
    until j=0
    if k<2:cls:if !len(n):stop:fi:exit loop:fi
    n << k:i++
  wend
  ?"Number";tab(12);"[Prime factors]"
  ?"[All divisors of given number]"
  u=pfact(n(0)):v=u:g=n(0):l=g
  for x in n
    f=pfact(x):?x;tab(12);f:?div(f)
'    ?dv(x,f(0))
    if len(v):v=gcd(v,f):fi:u=lcm(u,f)
    if g>1:g=gcde(g,x):fi:l=l*(x/gcde(l,x))
  next
  p=1:for x in v do p*=x:?:?"gcd:",p,v
  o=1:for x in u do o*=x:?"lcm:",o:?u
'  ?:?"gcde:",g,pfact(g):?"lcme:",l:?pfact(l)

  input,xxxx:cls
wend

func div(@f)
  'replacement for the function below, based on all
  'combinations of primes, and their unique products
  local i,k,l,m,t,u,y
  m=len(f):y=[1]:l=m:dim t:for i=0 to m-1 do t << i
  for k=1 to m:dim u(k-1):comb(m,k):next:sort y:div=y
  sub comb(n,c)
    local a,b
    if c=0
      a=1:for b in u:a*=f(b):next
      if !(a in y):y << a:fi:exit sub:fi
    if n=0 then exit sub
    u(k-c)=t(l-n):comb n-1,c-1:comb n-1,c
  end
end

func dv(n,o)
  'find all divisors of an integer; brute-force, cited
  'in Rosetta code, although correct, hopelessly slow,
  'specially for large integers
  local i,a
  if n<1:exit func:fi
  for i=1 to n/o:if !(n%i):a << i:fi:next:a << n:dv=a
end

func pfact(x)
  local f,q,s,d
  s=sqr(x):f=2:dim d
  while x>1
    q=x/f
    if q=int(q)
    d << f:x=q
    else
      f=if(f=2,3,f+2):if f>s:f=x:fi
    fi
  wend
  pfact=d
end

func lcm(a,b)
  local i,j,d
  for i in a:j=i in b:if j:delete b,j-1:fi:next
  d=a:for i in b:d << i:next:sort d:lcm=d
end

func gcd(a,b)
  local i,j,d
  dim d:for i in a:j=i in b:if j:delete b,j-1:d << i:fi
  next:gcd=d
end

func gcde(a,b)
  'euclidian algorithm is of course much better when
  'arbitrary precision arithmetics present, but now for
  'a few large numbers, or several small numbers gives
  'wrong results - "b=a%b" replaced by "b=a-int(a/b)*b"
  'gives some slight improvements
  local t
  if a<b:swap a,b:fi
  while b
    t=b:b=a-int(a/b)*b:a=t
  wend
  gcde=a
end