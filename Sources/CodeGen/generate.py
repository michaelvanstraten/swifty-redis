import click
import os
import glob

from datetime import date
from typing import List

from parse import process_json_files
from parsing_types.command import Command
from utils import THIS_DIR
from swift_format import format_files
from templates import render

SRC_DIR = os.path.abspath(THIS_DIR + "/redis/src")
OUT_DIR = os.path.abspath(THIS_DIR + "/../SwiftyRedis/CodeGen/Commands")


def clean_out_directory():
    click.echo("Cleaning out directory...")
    os.makedirs(OUT_DIR, exist_ok=True)
    for file_path in glob.glob(os.path.join(OUT_DIR, "*")):
        os.remove(file_path)


def write_extensions_file(commands: List[Command], file_name: str):
    with open(f"{OUT_DIR}/{file_name}", "x") as file:
        file.write(
            render(
                "extension.swift",
                filename=file_name,
                creation_date=date.today().strftime("%d.%m.%y"),
                commands=commands,
            )
        )


@click.group()
def cli():
    pass


@cli.command()
def commands():
    commands, subcommands = process_json_files(SRC_DIR)
    commands.sort(key=lambda command: command.fullname())

    clean_out_directory()

    to_format_files = []

    click.echo("Creating swift files...")

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
