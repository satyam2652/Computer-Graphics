import numpy as np
import cv2 as cv

Image=np.zeros((255,255,1),np.uint8)

def Bresen(x1,y1,x2,y2):
    dy=abs(y2-y1)
    dx=abs(x2-x1)
    dx2=dx*2
    dy2=dy*2
    xk=x1
    yk=y1
    Image[xk,yk]=255
    if(dy<dx):
        Pk=dy2-dx               
        print("Pk=======Xk======Yk    Positive slope < 1")
        print(Pk,"\t",xk,"\t",yk)
        while (xk!=x2 or yk!=y2):
              xk=xk+1  
              if Pk<0:
                 yk=yk
                 Pk=Pk+dy2
              else:
                   yk=yk+1
                   Pk=Pk+dy2-dx2
              Image[xk,yk]=255
              print(Pk,"\t",xk,"\t",yk)
    else:                      
        Pk=dx2-dy
        print("Pk_______Xk______Yk    Negative slope > 1")
        print(Pk,"\t",xk,"\t",yk)
        while (xk!=x2 or yk!=y2):
              yk=yk-1  
              if Pk<0:
                 xk=xk
                 Pk=Pk+dx2
              else:
                   xk=xk+1
                   Pk=Pk+dx2-dy2
              Image[xk,yk]=255
              print(Pk,"\t",xk,"\t",yk)
    return Image

Image=Bresen(10,50,15,40)
Image=Bresen(80,80,100,90)
cv.imshow("output Image",Image)

cv.waitKey(0)
cv.destroyAllWindows()
