from typing import List, Dict
import glob
import json
import os

from parsing_types.command import Command
from config import commands_to_ignore

subcommands: Dict[str, List[Command]] = {}
commands: List[Command] = []


def create_command(name, desc):
    container = desc.get("container")
    cmd = Command(name, desc, container is not None)
    if cmd.func_name() not in commands_to_ignore:
        if container:
            subcommands.setdefault(container, []).append(cmd)
        else:
            commands.append(cmd)


def process_json_files(src_dir):
    print("Processing JSON files...")
    for filename in glob.glob(os.path.join(src_dir, "commands", "*.json")):
        with open(filename) as f:
            try:
                data = json.load(f)
                for name, desc in data.items():
                    create_command(name, desc)
            except json.JSONDecodeError as err:
                print(f"Error processing {filename}: {err}")
                exit(1)

    return commands, subcommands
