#!/usr/bin/env python

import sys
import json
import subprocess
import time

def ws_info():
    return json.loads(subprocess.check_output("i3-msg -t get_workspaces".split()))

def find_output_by_name(name: str) -> str:
    ws_parsed = ws_info()
    try:
        return next(ws_entry["output"] for ws_entry in ws_parsed if ws_entry["name"] == name)
    except StopIteration:
        return None

def name_output_for_foc() -> (str,str):
    ws_parsed = ws_info()
    try:
        return next((ws_entry["name"], ws_entry["output"]) for ws_entry in ws_parsed if ws_entry["focused"])
    except StopIteration:
        return None

def move_swap(name: str):
    # currently focused
    src_name,src_output = name_output_for_foc()

    dst_name = name
    dst_output = find_output_by_name(name)

    print(src_name)
    print(src_output)
    print(dst_name)
    print(dst_output)

    # if workspace doesn't exist yet, create it by moving to it
    if not dst_output:
        subprocess.run(f"i3-msg \"workspace {dst_name}\"", shell=True)
    # if src and dst outputs are the same, then just move to that workspace
    elif src_output == dst_output:
        subprocess.run(f"i3-msg \"workspace {dst_name}\"", shell=True)
    # ugly hack when moving to DP2-2 (main monitor), for some reason focus goes to other monitor
    elif dst_output == "DP2-2":
        subprocess.run(f"i3-msg \"move workspace to output {dst_output}; workspace {dst_name}; move workspace to output {src_output}\"", shell=True)
        time.sleep(0.1)
        subprocess.run(f"i3-msg \"workspace {dst_name}\"", shell=True)
    else:
        subprocess.run(f"i3-msg \"move workspace to output {dst_output}; workspace {dst_name}; move workspace to output {src_output}\"", shell=True)

if __name__ == "__main__":
    move_swap(sys.argv[1])
