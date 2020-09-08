import numpy as np
import cv2
import matplotlib.pyplot as plt

img = cv2.imread('pepper256.bmp')

hist = cv2.calcHist([img], [0], None, [256], [0, 256])
plt.plot(hist)
plt.show()