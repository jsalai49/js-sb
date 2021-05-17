color 15,0:x0=200:y0=100:ff=100
h=[0,0,5.9,0,5.9,3.9,0,3.9,0,0]
?h:coor:poli:pause:end
sub poli
  drawpoly h,x0,y0,ff
  line x0+h(0)*ff,y0+h(1)*ff,x0+h(2)*ff,y0+h(3)*ff,12
  line x0+h(2)*ff,y0+h(3)*ff,x0+h(4)*ff,y0+h(5)*ff,12
  line x0+h(4)*ff,y0+h(5)*ff,x0+h(6)*ff,y0+h(7)*ff,12
  line x0+h(6)*ff,y0+h(7)*ff,x0+h(0)*ff,y0+h(1)*ff,12
  line x0+h(0)*ff,y0+h(1)*ff,x0+h(4)*ff,y0+h(5)*ff,12
  line x0+h(2)*ff,y0+h(3)*ff,x0+h(6)*ff,y0+h(7)*ff,12
  drawpoly h,x0,y0,ff
  z1=(h(0)+h(4))/2:z2=(h(1)+h(5))/2
  cent(z1,z2,3)
end sub
sub cent(x,y,z)
  circle x0+x*ff,y0+y*ff,z:?x,y
end sub
sub coor
  line 0,y0,xmax,y0:line x0,0,x0,ymax
  z1=int(x0/ff):z2=int((xmax-x0)/ff)
  for ii=-z1 to z2
    line x0+ff*ii,y0-3,x0+ff*ii,y0+3
  next
  z1=int(y0/ff):z2=int((ymax-y0)/ff)
  for ii=-z1 to z2
    line x0-3,y0+ff*ii,x0+3,y0+ff*ii
  next
end sub