#!/usr/bin/env python3
# encoding: utf-8
# author: Zhilei Han <hzl17@mails.tsinghua.edu.cn>
# Last Modified: 2021-03-19 09:28:00

import csv
import sys

lines = []
with open(sys.argv[1], 'r') as f:
    reader = csv.DictReader(f, delimiter=",")
    for row in reader:
        lines.append("> " + row['quote'] + " [原文](" + row['direct link'] + ")\n")
        if len(row['text']) != 0:
            lines.append(row['text'])

txt = "\n".join(lines)
print(txt)
