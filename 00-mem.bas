
sub settings
  local b,m,n,i,j,k,f
  n=["From","Step","Cols","Rows","Size"," Gap"," BgC"]
  m=txth("Q"):at 160,m:?"S e t t i n g s:":at 0,14*m
  ?"F:2,S:3 => E:2-4, M:5-7, H:8-10, etc blocks"
  ?"If Levels[From>2|Step>3], increase [Cols|Rows]!"
  ?"If [Col>6|Rows>6], decrease [Size|Gap]!"
  b.y=6*m:b.nofocus=1:b.backgroundcolor=1
  b.width=txtw("QQQQ"):b.type="list":b.x=20
  b.height=3*m+6:j=lev(0):b.selectedIndex=j-2
  b.value="  2|  3|  4":f.inputs << b
  b.height=5*m+6:b.x=-30:b.selectedIndex=lev(1)-j-1
  b.value="  1|  2|  3|  4|  5":f.inputs << b
  b.selectedIndex=cl-5
  b.value="  5|  6|  7|  8|  9":f.inputs << b
  b.selectedIndex=rw-5
  b.value="  5|  6|  7|  8|  9":f.inputs << b
  b.selectedIndex=sz\5-7
  b.value=" 35| 40| 45| 50| 55":f.inputs << b
  b.selectedIndex=gp\5-1
  b.value="  5| 10| 15| 20| 25":f.inputs << b
  b.selectedIndex=bc\2
  b.height=7*m+10
  b.value="  0|  2|  4|  6|  8| 10| 12":f.inputs << b
  b.x=20:b.y=4*m:b.type="label"
  for i=0 to 6
    b.label=n(i):if i:b.x=-30:fi:f.inputs << b
  next
  b.width=-1:b.x=40:b.y=3*m:b.label="Levels"
  f.inputs << b
  b.x=150:b.y=18*m:b.height=-1:b.type="image"
  b.value="ok":b.label="  OK  ":f.inputs << b
  b.x=-20:b.value="bck":b.label=" Back ":f.inputs << b
  f=form(f)
  while 1
    while 1
      f.doevents()
      if f.value="ok"
        exit loop
      elif f.value="bck"
        f.close():cls
        exit sub
      fi
    wend
    cl=f.inputs(2).selectedindex+5
    rw=f.inputs(3).selectedindex+5
    sz=(f.inputs(4).selectedindex+7)*5
    gp=(f.inputs(5).selectedindex+1)*5
    bc=f.inputs(6).selectedindex*2\1
    j=f.inputs(0).selectedindex+2
    k=f.inputs(1).selectedindex+1
    dim lev:for i=0 to 4:lev << j+i*k:next
    f.close():cls
    exit sub
  wend
end

sub txt
w.textScreen():color 14,1:cls
?"Objective:"
?" To view a pattern and reproduce
?" it from memory."
?"Instructions:"
?"1. Choose a difficulty-level from
?"   the menu."
?"2. Click on Generate to generate
?"   a random pattern. If not happy
?"   with result, click it again."
?"3. Click on Start to hide the"
?"   pattern, then start rebuilding"
?"   the pattern by clicking on the"
?"   blocks"
?"4. Click Check to check the results,"
?"   and to unhide  the original"
?"   pattern so you can check your guess"
w.graphicsscreen1()
end

sub mk_grid
  local b,i,j,m,n
  m=2*gp:n=sz+gp:dim f:b.backgroundcolor=bc:b.label=""
  b.type="image":b.width=sz:b.height=sz
  for j=0 to rw-1:for i=0 to cl-1
    b.x=m+n*i:b.y=m+n*j:b.value=str(j*cl+i)
    f.inputs << b
  next:next
end

sub init_btn
  local b,h,m,n,w
  w=txtw(" Medium "):h=txth("Q"):m=2*gp:n=gp+sz
  mk_grid:
  b.x=m:b.y=rw*n+m:b.nofocus=1
  b.width=w:b.height=4*h+6
  b.selectedIndex=lv:b.backgroundcolor=1:b.type="list"
  b.value="  Easy| Medium|  Hard| Extra":f.inputs << b
  b.x=-gp:b.y=rw*n+m:b.width=-1:b.height=-1
  b.type="image"
  b.value="gen":b.label="Generate":f.inputs << b
  b.value="gam":b.label="Start":f.inputs << b
  b.value="hlp":b.label="Help":f.inputs << b
  b.x=w+m+gp:b.y=rw*n+m+3*h
  b.value="set":b.label="Settings":f.inputs << b
  b.x=-gp:b.value="end":b.label=" End ":f.inputs << b
end

sub mk_task(lv)
  local i,j,k,m,b
  j=rw*cl:dim p(j-1):u=p:b=seq(0,j-1,j)
  for i=0 to j-1:f.inputs(i).backgroundcolor=bc:next
  k=rnd*(lev(lv+1)-lev(lv))\1+lev(lv)
  while k
    i=rnd*j\1:m=b(i):p(m)=1:j--:b(i)=b(j):k--
    f.inputs(m).backgroundcolor=bc+1
  wend
end

sub gm_btn(x)
  local b
  mk_grid:b.nofocus=1:b.backgroundcolor=1:b.height=-1
  b.type="image":b.width=-1:b.y=rw*(gp+sz)+2*gp
  b.x=cl*sz\2:b.label=if(x,"Check","Back")
  b.value=if(x,"chk","bck"):f.inputs << b
end

sub game
  cls:gm_btn(1):f=form(f)
  while 1
    f.doEvents()
    g=f.value
    if g<>""
      if g="chk"
        f.close()
        if p=u
          w.alert("Solved! Well done!")
        else
          chk_sol
        fi
        dim p,u
        exit sub
      else
        h=val(g):x=f.inputs(h).backgroundcolor
        x=x xor 1:f.inputs(h).backgroundcolor=x
        u(h)=x band 1
      fi
    fi
    f.refresh(0)
  wend
end

sub chk_sol
  local m,n,i,j
  gm_btn(0):j=rw*cl-1
  for i=0 to j
    if p(i):n++:fi
    if u(i) && u(i)=p(i):m++:fi
    if u(i)!=p(i) && u(i)
      f.inputs(i).backgroundcolor=bc+2
    elif u(i)=p(i) && u(i)
      f.inputs(i).backgroundcolor=bc+4
    elif p(i)
      f.inputs(i).backgroundcolor=bc+1
    fi
  next
  f=form(f)
  w.alert("Error! Guessed "+m+" out of "+n+"!")
  while 1
    f.doEvents()
    f.close()
    exit sub
  wend
end

sub main
  w=window()
  txt
  while 1
    init_btn
    f=form(f)
    while 1
      f.doEvents()
      if f.value="end"
        f.close():stop
      elif f.value="hlp"
        w.insetTextScreen(10,10,75,65):pause
        w.graphicsscreen1()
      elif f.value="gam"&& u<>p
        f.close():game:exit loop
      elif f.value="set"
        f.close()
        settings
        exit loop
      elif f.value="gen"
        lv=f.inputs(rw*cl).selectedIndex:mk_task(lv)
      fi
      f.value=""
      f.refresh(0)
    wend
  wend
end

cl=5:rw=5:sz=50:gp=10:bc=2:lev=[2,5,8,11,14]'Init.val.
main