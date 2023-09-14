import click

from os.path import abspath
from typing import List

from parse import process_json_files
from parsing_types.command import Command
from utils import (
    make_sure_remote_repo_is_downloaded,
    clean_out_directory,
    get_todays_date,
    THIS_DIR,
)
from swift_format import format_files
from templates import render

SRC_DIR = abspath(THIS_DIR + "/redis/src")
OUT_DIR = abspath(THIS_DIR + "/../SwiftyRedis/CodeGen/Commands")


def write_extensions_file(commands: List[Command], file_name: str):
    with open(f"{OUT_DIR}/{file_name}", "x") as file:
        file.write(
            render(
                "extension.swift",
                filename=file_name,
                creation_date=get_todays_date(),
                commands=commands,
            )
        )


@click.group()
def cli():
    pass


@cli.command()
def commands():
    make_sure_remote_repo_is_downloaded(
        "redis", "https://github.com/redis/redis.git", branch="7.0"
    )

    commands, subcommands = process_json_files(SRC_DIR)
    commands.sort(key=lambda command: command.fullname())

    clean_out_directory(OUT_DIR)

    to_format_files = []

    print("Creating swift files...")

    if len(commands) > 0:
        write_extensions_file(commands, "containerless.swift")
        to_format_files.append(f"{OUT_DIR}/containerless.swift")

    for container_name, commands in subcommands.items():
        container_name = container_name.lower()
        write_extensions_file(commands, f"{container_name}.swift")
        to_format_files.append(f"{OUT_DIR}/{container_name}.swift")

    if len(to_format_files) > 0:
        format_files(*to_format_files)


if __name__ == "__main__":
    cli()
