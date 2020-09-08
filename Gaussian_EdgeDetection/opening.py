import numpy as np
import cv2
a = cv2.imread("baboon256.bmp")
b = cv2.Sobel(a,cv2.CV_16S,1,0)
c = cv2.convertScaleAbs(b)
kernel = np.ones((3,3),np.uint8)
opening = cv2.morphologyEx(c, cv2.MORPH_OPEN , kernel)
cv2.imshow("opening" , opening)
cv2.waitKey(0)