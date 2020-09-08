import numpy as np
import cv2
a = cv2.imread("baboon256.bmp")
b = cv2.Sobel(a,cv2.CV_16S,1,0)
c = cv2.convertScaleAbs(b)
cv2.imshow("normal" , a)
cv2.waitKey(0)