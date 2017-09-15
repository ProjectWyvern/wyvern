#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/wyvern.ico

convert ../../src/qt/res/icons/wyvern-16.png ../../src/qt/res/icons/wyvern-32.png ../../src/qt/res/icons/wyvern-48.png ${ICON_DST}
