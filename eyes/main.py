import numpy as np
import cv2
from matplotlib import pyplot as plt

cap = cv2.VideoCapture(0)
plt.ion()
plt.show()
i = 0

ret, img = cap.read()
past_img = 0
past_past_img = 0
print(type(img))

fgbg = cv2.createBackgroundSubtractorMOG2()
while(True):
    #plt.hist([1,2,3,i])
    i += 1
    # Capture frame-by-frame
    ret, img = cap.read()

    # Display the resulting frame
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


    original = cv2.medianBlur(img,3)
    img = fgbg.apply(original)
    if type(past_img) == int:
        past_img = img
        img = img
    elif type(past_past_img) == int:
        past_img = img
        img = img & past_img
    else:
        past_past_img = past_img
        past_img = img
        img = img & past_img & past_past_img
    #img = cv2.Sobel(img, 0, 1, 2)

    M = cv2.moments(img)
    cx = int(M['m10']/M['m00'])
    cy = int(M['m01']/M['m00'])

    cv2.circle(original, (cx, cy), 6, (255,255,255), -1)

    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break


    #ret,th1 = cv2.threshold(img,127,255,cv2.THRESH_BINARY)
    #th2 = cv2.adaptiveThreshold(img,255,cv2.ADAPTIVE_THRESH_MEAN_C,\
                #cv2.THRESH_BINARY,11,2)
    #th3 = cv2.adaptiveThreshold(img,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
                #cv2.THRESH_BINARY,11,2)

    titles = ['Original Image', 'Forground detection']
    images = [original, img]

    cv2.imshow("Original Image", img)
    cv2.imshow("Forgorund detection", original)

cap.release()
