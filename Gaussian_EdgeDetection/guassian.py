import numpy as np
import cv2
a = cv2.imread("pepper256.bmp")
blur = cv2.GaussianBlur(a, (3, 3), 0)
cv2.imshow("Gaussian" , blur)
cv2.waitKey(0)