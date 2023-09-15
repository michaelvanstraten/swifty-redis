from collections import Counter
from typing import List, Dict

from templates import render
from utils import camel_case, snake_case
from config import names_to_substitute, token_to_substitute, arguments_to_ignore

ARG_TYPES = {
    "string": "String",
    "integer": "Int",
    "double": "Double",
    "key": "String",
    "pattern": "String",
    "unix-time": "Int64",
    "pure-token": "token",
    "oneof": "oneof",
    "block": "block",
}

TEST_VALUES = {
    "String": '"TestString"',
    "Int": "123",
    "Double": "123.0",
    "Int64": "123",
}


class Argument:
    def __init__(self, desc: Dict):
        self.name = names_to_substitute.get(
            camel_case(desc["name"]), camel_case(desc["name"])
        )
        self.type = ARG_TYPES.get(desc["type"], "unsupported type")
        self.token = desc.get("token")
        self.backup_token = desc["name"]
        self.sanitized_token = snake_case(
            token_to_substitute.get(self.token, self.token)
            if self.token
            else self.backup_token
        ).upper()
        self.is_optional = desc.get("optional", False)
        self.is_variadic = desc.get("multiple", False)
        self.must_have_label = False
        if self.token:
            self.token = self.token.replace('"', '\\"')

    def use_token_as_name(self):
        self.name = self.sanitized_token

    def parameter(self):
        return render(
            "parameter.swift",
            parameter_name=self.name,
            parameter_type=self.type,
            is_optional=self.is_optional,
            is_variadic=self.is_variadic,
            must_have_label=self.must_have_label,
        )

    def test_parameter(self):
        return render(
            "test_parameter.swift",
            parameter_name=self.name,
            parameter_value=self.test_value(),
        )

    def test_value(self):
        return TEST_VALUES.get(self.type)

    def is_option(self):
        return self.type == "token"


def parse_args(
    args: List[Dict], parent_name: str, make_options_arg=True, are_sub_args=False
):
    parsed_args = []
    optional_args = []
    arg_names_counter = Counter()

    for arg in args:
        if arg["type"] == "oneof":
            from parsing_types.enum_argument import EnumArgument

            new_arg = EnumArgument(parent_name, arg, are_sub_args)
        elif arg["type"] == "block":
            from parsing_types.struct_argument import StructArgument

            new_arg = StructArgument(parent_name, arg, are_sub_args)
        else:
            new_arg = Argument(arg)

        if arg_names_counter[new_arg.name] > 0:
            new_arg.use_token_as_name()
        else:
            arg_names_counter[new_arg.name] += 1

        if new_arg.name not in arguments_to_ignore:
            if new_arg.is_option() and make_options_arg:
                optional_args.append(new_arg)
            else:
                parsed_args.append(new_arg)

    if len(optional_args) > 0:
        from parsing_types.options_argument import OptionsArgument

        parsed_args.append(OptionsArgument(parent_name, optional_args, are_sub_args))

    if len(parsed_args) > 1:
        for index in range(len(parsed_args)):
            if index > 0 and parsed_args[index - 1].is_variadic:
                parsed_args[index].must_have_label = True

    return parsed_args
