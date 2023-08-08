from typing import List
import glob
import json

from os.path import abspath
from typing import Dict
from parsing_types.command import Command
from utils import THIS_DIR

try:
    with open(abspath(THIS_DIR + "/config/commands_to_ignore.json")) as f:
        commands_to_ignore: List[str] = json.load(f)
except:
    commands_to_ignore: List[str] = []

subcommands: Dict[str, List[Command]] = {}
commands: List[Command] = []


def create_command(name, desc):
    if desc.get("container"):
        cmd = Command(name, desc, True)
        if not cmd.func_name() in commands_to_ignore:
            if subcommands.get(desc["container"]):
                cmds = subcommands[desc["container"]]
                cmds.append(cmd)
            else:
                cmds = [cmd]
                subcommands[desc["container"]] = cmds
    else:
        cmd = Command(name, desc)
        if not cmd.func_name() in commands_to_ignore:
            commands.append(cmd)


def process_json_files(src_dir):
    print("Processing json files...")
    for filename in glob.glob(f"{src_dir}/commands/*.json"):
        with open(filename) as f:
            try:
                d = json.load(f)
                for name, desc in d.items():
                    create_command(name, desc)
            except json.decoder.JSONDecodeError as err:
                print(f"Error processing {filename}: {err}")
                exit(1)

    return commands, subcommands
