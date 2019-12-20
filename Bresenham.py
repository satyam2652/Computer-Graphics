import numpy as np
import cv2 as cv

x1=10
y1=50
x2=15
y2=40

dy=abs(y2-y1)
dx=abs(x2-x1)
dx2=dx*2
dy2=dy*2

image=np.zeros((255,255,1),np.uint8)
opImage=np.zeros((255,255,1),np.uint8)

cv.imshow("blank image", image)
image[x1,y1]=255

def Bresen(xk,yk):
    if(x2>x1):
        if(y2>y1):
            Pk=dy2-dx
            print("Pk\tXk\tYk")
            print(Pk,"\t",xk,"\t",yk)
            while (xk!=x2 or yk!=y2):
                  xk=xk+1  
                  if Pk<0:
                     yk=yk
                     Pk=Pk+dy2
                  else:
                       yk=yk+1
                       Pk=Pk+dy2-dx2
                  image[xk,yk]=255
                  print(Pk,"\t",xk,"\t",yk)
        if(y2<y1):
            if(dy>dx):
                Pk=dx2-dy
                print("Pk\tXk\tYk")
                print(Pk,"\t",xk,"\t",yk)
                while (xk!=x2 or yk!=y2):
                      yk=yk-1  
                      if Pk<0:
                         xk=xk
                         Pk=Pk+dx2
                      else:
                           xk=xk+1
                           Pk=Pk+dx2-dy2
                      image[xk,yk]=255
                      print(Pk,"\t",xk,"\t",yk)
    return image

opImage=Bresen(x1,y1)
cv.imshow("output Image",opImage)

cv.waitKey(0)
cv.destroyAllWindows()
