#!/usr/bin/env python3
# encoding: utf-8
#Author: Zhilei Han <hzl17@mails.tsinghua.edu.cn> 

import requests, base64, json, time, random
import sys, os

def file_name(path):
    salt=random.randint(1, 9999)
    sp=os.path.splitext(path)
    if len(sp) == 2:
        ext = sp[1]
    else:
        ext = ""
    fn=time.strftime("%Y-%m-%d-%H-%M-%S-", time.localtime())+str(salt)+ext
    return fn

def get_base64(fn):
    with open(fn, 'rb') as f:
        return base64.b64encode(f.read()).decode('utf-8')

if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("No file provided")
        exit(2)
    else:
        path = sys.argv[1]
        tokens = "486afc5a5a14a7ff23cdf72c579db515cd507898"
        headers = {"Authorization": 'token '+tokens}

        fn = file_name(path)
        url = "https://api.github.com/repos/linusboyle/imgupload/contents/upload/"+ fn
        payload = {
        "message": "upload via cmd",
        "content": get_base64(path)
        }

        r = requests.put(url=url,data=json.dumps(payload), headers=headers)
        if r.status_code == 201:
            print('https://cdn.jsdelivr.net/gh/linusboyle/imgupload/upload/'+fn, end='')
