#!/usr/bin/env python3

import os
import csv
import argparse
from PIL import Image
import numpy as np
import cv2

# (X, Y, W, H)
TITLE_LOC = ( 60,  300, 635, 55)
BOX1_LOC  = (560,  654, 175, 23)
BOX2_LOC  = (560,  764, 175, 33)
BOX3_LOC  = (560,  874, 175, 33)
BOX4_LOC  = (560,  984, 175, 33)
BOX5_LOC  = (560, 1094, 175, 33)
COST_LOC  = (370, 1426, 165, 41)
LEVEL_LOC = (544, 1409, 198, 33)

# Location is (slice, fn)
def get_locations():
    return [
            ((slice(300, 300+55),   slice(60, 60+635), slice(None)), do_title),
            ((slice(658, 658+28),   slice(560, 560+175), slice(None)), do_box1_value),
            #(slice(764, 764+33),   slice(560, 560+175), slice(None)),
            #(slice(874, 874+33),   slice(560, 560+175), slice(None)),
            #(slice(984, 984+33),   slice(560, 560+175), slice(None)),
            #(slice(1094, 1094+33), slice(560, 560+175), slice(None)),
            ((slice(1426, 1426+41), slice(370, 370+160), slice(None)), do_cost), # 530 is the first pixel of the green button
            #(slice(1409, 1409+33), slice(544, 544+198), slice(None)),
            ]

class Character:
    def __init__(self, c, filename=None, is_yellow=False, threshold=0.9):
        self.c = str(c)
        if not filename:
            self.filename = self.c
        else:
            self.filename = str(filename)
        self.is_yellow = is_yellow
        self.threshold = threshold
        self.image = cv2.imread(f'assets/{self.filename}.png')

    def __str__(self):
        return self.c

TITLE_ASSETS = [
        Character('Mine Shaft ', 'title_ms'),
        Character('Elevator ', 'title_el'),
        Character(' Level ', 'title_level'),
        Character('0', 'title_0'),
        Character('1', 'title_1', False, 0.85),
        Character('2', 'title_2'),
        Character('4', 'title_4'),
        Character('5', 'title_5'),
        Character('7', 'title_7'),
        Character('9', 'title_9'),
        ]

BOX_ASSETS = [
        Character(0, 'box_0', False, 0.88),
        Character(1, 'box_1', False, 0.85),
        Character(2, 'box_2'),
        Character(3, 'box_3'),
        Character(4, 'box_4'),
        Character(5, 'box_5'),
        Character(6, 'box_6'),
        Character(7, 'box_7'),
        Character(8, 'box_8'),
        Character(9, 'box_9'),
        Character('K', 'box_upper_k'),
        Character('M', 'box_upper_m'),
        Character('B', 'box_upper_b'),
        Character('T', 'box_upper_t'),
        Character('a', 'box_a'),
        Character('b', 'box_b'),
        Character('c', 'box_c'),
        Character('d', 'box_d'),
        Character('e', 'box_e'),
        Character('f', 'box_f'),
        Character('g', 'box_g'),
        Character('h', 'box_h'),
        Character('i', 'box_i'),
        Character('j', 'box_j'),
        Character('k', 'box_k'),
        Character('l', 'box_l', True),
        Character('m', 'box_m', True),
        Character('n', 'box_n', True),
        Character('o', 'box_o', True),
        Character('p', 'box_p', True),
        Character('q', 'box_q', True),
        Character('r', 'box_r', True),
        Character('s', 'box_s'),
        Character('t', 'box_t', True, 0.88),
        Character('u', 'box_u', True),
        Character('v', 'box_v', True),
        Character('w', 'box_w', True),
        Character('x', 'box_x', True),
        Character('y', 'box_y', True),
        Character('z', 'box_z', True),
        Character('.', 'box_dot', False, 0.88),
        Character('/', 'box_slash'),
        ]

COST_ASSETS = [
        Character('0', 'cost_0'),
        Character('1', 'cost_1', False, 0.85),
        Character('2', 'cost_2'),
        Character('3', 'cost_3'),
        Character('4', 'cost_4'),
        Character('5', 'cost_5'),
        Character('6', 'cost_6'),
        Character('7', 'cost_7'),
        Character('8', 'cost_8'),
        Character('9', 'cost_9'),
        Character('a', 'cost_a'),
        Character('.', 'cost_dot'),
        ]

COST_END_ASSETS = [
        Character('0', 'cost_end_0'),
        Character('1', 'cost_end_1'),
        Character('2', 'cost_end_2'),
        Character('4', 'cost_end_4'),
        Character('5', 'cost_end_5'),
        Character('6', 'cost_end_6'),
        Character('8', 'cost_end_8'),
        Character('K', 'cost_end_upper_k'),
        Character('B', 'cost_end_upper_b'),
        Character('M', 'cost_end_upper_m'),
        Character('T', 'cost_end_upper_t'),
        Character('a', 'cost_end_a'),
        Character('b', 'cost_end_b'),
        Character('c', 'cost_end_c'),
        Character('d', 'cost_end_d'),
        Character('e', 'cost_end_e'),
        Character('f', 'cost_end_f'),
        Character('g', 'cost_end_g'),
        Character('h', 'cost_end_h'),
        Character('i', 'cost_end_i'),
        Character('j', 'cost_end_j'),
        Character('k', 'cost_end_k'),
        Character('l', 'cost_end_l'),
        Character('m', 'cost_end_m'),
        Character('n', 'cost_end_n'),
        Character('o', 'cost_end_o'),
        Character('p', 'cost_end_p'),
        Character('q', 'cost_end_q'),
        Character('r', 'cost_end_r'),
        Character('s', 'cost_end_s'),
        Character('t', 'cost_end_t'),
        Character('u', 'cost_end_u'),
        Character('v', 'cost_end_v'),
        Character('w', 'cost_end_w'),
        Character('x', 'cost_end_x'),
        Character('y', 'cost_end_y'),
        Character('z', 'cost_end_z'),
        ]

def smooth_locations(ys):
    distance_threshold = 5
    buckets = []
    for y in ys:
        added = False
        for b in buckets:
            assert len(b) == 2
            low = b[0]
            high = b[1]
            if (y <= b[1] and y > b[1] - distance_threshold) or (y >= b[0] and y < b[0] + distance_threshold):
                # In bucket
                if y < b[0]:
                    b[0] = y
                elif y > b[1]:
                    b[1] = y
                added = True
                break

        if not added:
            # New bucket
            buckets.append([y, y])

    return [np.mean(b) for b in buckets]

def generic_extract(img, assets):
    corrected_img = colour_correct(img)
    letters = []
    for ch in assets:
        res = cv2.matchTemplate(
                img if ch.is_yellow else corrected_img,
                ch.image,
                cv2.TM_CCOEFF_NORMED)
        loc = np.where(res > ch.threshold)
        if len(loc[1]) >= 1:
            ys = smooth_locations(loc[1])
            for y in ys:
                letters.append((str(ch), y))
    letters = sorted(letters, key=lambda x: x[1])
    letters = [l for l, _ in letters]
    output = ''.join(letters)
    return output

def last_extract(img, assets):
    corrected_img = colour_correct(img)
    last_loc = -1
    last_ch = None
    for ch in assets:
        res = cv2.matchTemplate(
                (img if ch.is_yellow else corrected_img)[:,-ch.image.shape[1]:],
                ch.image,
                cv2.TM_CCOEFF_NORMED)
        loc = np.where(res > ch.threshold)
        if len(loc[1]) >= 1:
            ys = smooth_locations(loc[1])
            y = max(ys)
            if y > last_loc:
                last_loc = y
                last_ch = ch
    return last_ch

def do_title(img, result):
    output = generic_extract(img, TITLE_ASSETS)
    #print(f"Title: {output}")
    result['location'] = output

def do_box1_value(img, result):
    output = generic_extract(img, BOX_ASSETS)
    #print(f"Box1: {output}")
    result['box1'] = output

# Returns the last letter and its pixel width
def do_cost_end(img):
    ch = last_extract(img, COST_END_ASSETS)
    if ch:
        return ch.c, ch.image.shape[1]
    else:
        return '', 0

def colour_correct(img):
    # Color correct any yellows to white
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    lower = np.array([20, 0, 128])
    upper = np.array([60, 255, 255])
    mask = cv2.inRange(hsv, lower, upper)
    img[mask>0]=(255, 255, 255)
    return img

def do_cost(img, result):
    last_letter, last_width = do_cost_end(img)

    if last_width > 0:
        img = img[:,:-last_width]
    output = generic_extract(img, COST_ASSETS) + last_letter
    #print(f"Cost: {output}")
    result['cost'] = output

def extract_one(d, f):
    filename = os.path.join(d, f)
    print(filename)
    result = {'frame' : filename}

    img = cv2.imread(filename)

    for l, fn in get_locations():
        crop_img = img.__getitem__(l)
        fn(crop_img, result)

    return result

def extract(d):
    frames = os.listdir(d)
    frames = [f for f in frames if f[-4:] == '.png']
    frames = sorted(frames)

    fields = ["frame", "location", "box1", "cost"]
    with open(os.path.join(d, 'raw.csv'), 'w') as outfile:
        csv_writer = csv.DictWriter(outfile, fields)
        csv_writer.writeheader()
        for f in frames:
            #if f != "00001725.png":
            #    continue
            csv_writer.writerow(extract_one(d, f))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dir')
    args = parser.parse_args()

    extract(args.dir)

if __name__=='__main__':
    main()
