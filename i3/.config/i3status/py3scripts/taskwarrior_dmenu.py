#!/usr/bin/env python

import subprocess
import json

def exec_dmenu(input):
    p = subprocess.Popen(["dmenu"], stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
    return p.communicate(input=input.encode('utf-8'))[0].decode('utf-8').rstrip()

cmd = "task status:pending export"
json_out = json.loads(subprocess.check_output(cmd.split()))
task_str = "\n".join([str(obj['id']) + " - " + obj['description'] for obj in json_out])

output = exec_dmenu(task_str)

if output and not output.isspace():
    id, desc = output.split(" - ", 1)
    print(id)
    confirm_str = f"Y : Confirm to mark task {id} as done"
    confirm_str += "\n"
    confirm_str += "N : Cancel action"

    output = exec_dmenu(confirm_str)

    if output and not output.isspace():
        choice, _ = output.split(" : ", 1)
        if choice == "Y":
            task_done_cmd = f"task {id} done"
            task_done_out = subprocess.check_output(task_done_cmd.split())
            print(task_done_out)
