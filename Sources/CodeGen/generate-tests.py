#!/usr/bin/env python3

import json
from os.path import abspath
from typing import List

from jinja2 import Template
from parse import process_json_files

from parsing_types.command import Command
from git_utils import make_sure_remote_repo_is_downloaded
from utils import clean_out_directory, get_todays_date, THIS_DIR
from swift_format import format_files

SRC_DIR = abspath(THIS_DIR + "/redis/src")
OUT_DIR = abspath(THIS_DIR + "/../../Tests/SwiftyRedisTests/Autogen/Commands")

def write_tests_file(commands: List[Command], test_name: str):
    with open(f"{OUT_DIR}/{test_name}.swift", 'x') as file:
        file.write(test_template.render(
            filename=f"{test_name}.swift",
            test_name=test_name,
            creation_date=get_todays_date(),
            commands=commands
        ))

if __name__ == "__main__":
    try:
        with open(abspath(THIS_DIR + "/config/commands_to_ignore.json")) as f:
            commands_to_ignore: List[str] = json.load(f)
    except:
        commands_to_ignore: List[str] = []

    with open(THIS_DIR + "/templates/test.swift") as file:
        test_template = Template(file.read())

    make_sure_remote_repo_is_downloaded(
        "redis", 
        "https://github.com/redis/redis.git", 
        branch="7.0"
    )   

    commands, subcommands = process_json_files(SRC_DIR)
    commands.sort(key=lambda command: command.fullname())

    clean_out_directory(OUT_DIR)

    to_format_files = []

    print("Creating swift files...")
    
    if len(commands) > 0:
        test_name = "containerlessTests"
        write_tests_file(commands, test_name)
        to_format_files.append(f"{OUT_DIR}/{test_name}.swift")

    for container_name, commands in subcommands.items():
        test_name = f"{container_name.lower()}Tests"
        write_tests_file(
            commands,
            test_name
        )
        to_format_files.append(
            f"{OUT_DIR}/{test_name}.swift"
        )

    if len(to_format_files) > 0:
        format_files(*to_format_files)