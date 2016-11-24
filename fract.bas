
'SmallBASIC,0.12.8 Android Sat, 22 Oct 2016 [jsalai49]
'  Small Fraction Calculator
const _ch=txth("Q")
const _ls=2+_ch
const _mg=-txtw(" ")/2
func pfact(x)
  local d,q,f=2,s=sqr(x):dim d
  while x>1
    q=x/f:if q=int(q):d << f:x=q
    else:f=if(f=2,3,f+2):if f>s:f=x:fi:fi
  wend:pfact=d
end
func lcm(a,b)
  local i,j
  for i in a:j=i in b:if j:delete b,j-1:fi:next
  for i in b:a << i:next:sort a:lcm=a
end
func gcd(p,o)
  local d,i,j,q=1,a=pfact(p),b=pfact(o):dim d
  for i in a:j=i in b:if j:delete b,j-1:d << i:fi:next
  for i in d:q*=i:next:gcd=q
end
sub mm(v,l,x,y,t,c)
  local b
  b.x=x:b.y=y:b.value=v:b.label=l:b.backgroundColor=c
  b.color=15:b.type=t:b.nofocus=1:f.inputs << b
end
sub mk_ui
 local b,s=xmax\10,g=_mg,l=_ls,a="link",c="image",k=3*l
  mm("ext","[Quit",s,l,a,0):mm("use"," Use ",g,l,a,0)
  mm("vie","View",g,l,a,0):mm("clr"," Clr]",g,l,a,0)
  mm("+"," + ",s,k,c,1):mm("-"," - ",g,k,c,1)
  mm("x"," x ",g,k,c,1):mm("/"," / ",g,k,c,1)
  i_r=len(f.inputs):b.color=14:b.type="label":b.y=5*l
  b.label="":b.x=s:b.width=xmax/3:f.inputs << b
  i_o=len(f.inputs):b.y=8*l:f.inputs << b
  i_1=len(f.inputs):b.backgroundcolor=1:b.type="text"
  b.value="-3 4/6":b.y=7*l:b.color=15:f.inputs << b
  i_2=len(f.inputs):b.value="-2 2/8":b.y=9*l
  f.inputs << b:f=form(f)
end
sub viewLog
  local b,j,g
  if f.inputs(i_r).label="":exit sub:fi
  w.graphicsScreen2():cls:?
  for j in z:color if("{" in j,12,11):?j:next
  ?:b.y=-1:b.color=14:b.label="   [ Close ]":b.x=0
  b.type="link":g.inputs << b:g=form(g):?:g.doEvents()
  w.graphicsScreen1()
end
def xx(a,b,c,d)="("+a+"/"+b+")"+k+"("+c+"/"+d+")"
sub mulF(k)
  local x="":dim z,y
  if !("(" in f1):f1="("+f1+")":fi
  if !("(" in f2) or left(f2)="-":f2="("+f2+")":fi
  z << f1+k+f2:x=xx(n1,d1,n2,d2):if !(x in z):z << x:fi
  if k="/":k="x":swap n2,d2:if d2<0:n2=-n2:d2=-d2:fi
  z << xx(n1,d1,n2,d2):fi:p=n1*n2:o=d1*d2:res
end
def zz(a,b,c,d)=a+"/"+b+if(c<0,c,"+"+c)+"/"+d
sub addF(k)
  local x="",m="",n="":dim z,y
  if k="-":m="-(":n=")":n2=-n2:fi
  z << f1+if(left(f2)="-",m+f2+n,k+f2)
  x=zz(n1,d1,n2,d2):if !(x in z):z << x:fi
  if d1=d2:o=d1
  else
    l=lcm(pfact(d1),pfact(d2)):o=1:for k in l:o*=k:next
    z << " {lcm["+d1+","+d2+"]="+o+"}"
    z << " {fct["+o/d1+","+o/d2+"]}"
    n1=n1*o/d1:n2=n2*o/d2
  fi
  p=n1+n2:x=zz(n1,o,n2,o):if !(x in z):z << x:fi
  z << "("+n1+if(n2<0,n2,"+"+n2)+")/"+o
  res
end
sub res
  x=p+"/"+o:if !(x in z):z << x:fi:e=abs(p)
  g=gcd(e,o)
    if g>1:z << " {gcd["+e+","+o+"]="+g+"}"
    p\=g:o\=g:e\=g:x=p+"/"+o:z << x:fi
  if p=p/o:x=p:if !(x in z):z << x:fi
  else:if e>o:x=p\o+" "+e%o+"/"+o:else:x=p+"/"+o:fi
    if !(x in z):z << x:fi:z << p/o:fi
  f.refresh(1):f.inputs(i_r).label=x
  f.inputs(i_o).label=f.value:f.refresh(0)
end
sub chkF(j,i)
  local k=0
  ww=["Operand missing:","Please use integers"]
  ww << "For integers use 'N/1'","Zero value:"
  j=trim(j):t=0
  if j="":w.alert(ww(0)+i):t=1:exit sub:fi
  c=j:if !("/" in j):w.alert(ww(2)):t=1:exit sub:fi
  if " " in j
    k=val(leftof(j," ")):j=rightoflast(j," ")
    c=translate(enclose(c,"()"),"(-","-(")
  fi
  a=val(leftof(j,"/")):b=val(rightof(j,"/"))
  if k!=0:a=if(k>0,k*b+a,k*b-a):fi
  if !(a*b):t=1:w.alert(ww(3)+i):exit sub:fi
  if k!=k\1 or a!=a\1 or b!=b\1:t=1:w.alert(ww(1)):fi
end
sub upd_ed
  f.refresh(1)
  j=f.inputs(i_1).value:chkF(j,1):n1=a:d1=b:f1=c
  j=f.inputs(i_2).value:chkF(j,2):n2=a:d2=b:f2=c
end
sub clr
  f.refresh(1):f.inputs(i_r).label=""
  f.inputs(i_1).value="":f.inputs(i_2).value=""
  f.inputs(i_o).label="":f.refresh(0)
end
sub useF
    x=f.inputs(i_r).label
    if x!="" && x!=0:if !("/" in x):x=x+"/1":fi:clr
    f.refresh(1):f.inputs(i_1).value=x:f.refresh(0):fi
end
w=window():w.showKeypad():mk_ui
while 1
  f.refresh(1)
  f.doEvents()
  select case f.value
  case "use"
    useF
  case "vie"
    viewLog
  case "clr"
    clr
  case "+","-"
    upd_ed:if !t:addF(f.value):fi
  case "x","/"
    upd_ed:if !t:mulF(f.value):fi
  case "ext"
    cls:exit loop
  end select
  f.refresh(0)
  f.value=""
wend
