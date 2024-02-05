import os

import cv2


def crop_image(path: str, extra: int):
    """
    Given the path to a directory, returns the images and their filenames
    """

    image = cv2.imread(path)
    size = image.shape[:2]
    midpoint = [int(dim / 2) for dim in size]
    start = midpoint[1] - int(0.5 * size[0]) + extra
    end = midpoint[1] + int(0.5 * size[0]) + extra
    image = image[:, start:end]

    return image


extra = -50

crop = crop_image(os.getcwd() + "/bob_katter_sexy.jpg", extra)
cv2.imwrite("bkatter_sexy.png", crop)
