while 1
input "n:",n:if n=0:stop:fi
input "k:",k:dim u(k-1),x,y,z,t:for i=1 to n do t << i
l=n:com n,k:combin n,k,u:comb n,k,0,u:?x:?y:?z
wend

sub com(n,c)
  if c=0 then x << u:exit sub
  if n=0 then exit sub
  u(k-c)=t(l-n):
  com n-1,c-1:com n-1,c
end

sub combin(n,c,@u)
  if c=0 then y << u:exit sub
  if n=0 then exit sub
  u(k-c)=t(l-n):combin n-1,c-1,u:combin n-1,c,u
end

sub comb(n,c,x,@u)
  if c=0 then z << u:exit sub
  if n=0 then exit sub
  u(x)=t(l-n):comb n-1,c-1,x+1,u:comb n-1,c,x,u
end