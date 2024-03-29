from typing import List

from utils import kebab_case, sanitize, snake_case

from parsing_types.argument import Argument, parse_args
from templates import render


class Command(object):
    def __init__(self, name, desc, is_subcommand: bool = False):
        self.desc = desc
        self.is_subcommand = is_subcommand
        self.name: str = sanitize(name.upper())
        self.container_name = desc.get("container")
        self.args: List[Argument] = parse_args(
            self.desc.get("arguments", []), self.fullname()
        )

    def func(self, pipeline: bool = False, void: bool = False) -> str:
        return render(
            "command.swift",
            func_name=self.func_name(),
            void=void,
            pipeline=pipeline,
            name=self.name,
            container_name=self.container_name,
            args=self.args,
            summary=self.desc.get("summary"),
            since=self.desc.get("since"),
            time_complexity=self.desc.get("complexity"),
            history=self.desc.get("history"),
            docs_name=self.fullname(),
            docs_link_name=kebab_case(self.fullname()),
        )

    def test(self) -> str:
        return render("command_test.swift", func_name=self.func_name(), args=self.args)

    def func_name(self):
        return snake_case(self.fullname())

    def fullname(self):
        if self.is_subcommand:
            return f"{self.container_name} {self.name}"
        else:
            return self.name
