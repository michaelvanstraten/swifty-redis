from parsing_types.complex_argument import ComplexArgument

from utils import camel_case
from parsing_types.argument import parse_args
from templates import render


class StructArgument(ComplexArgument):
    def __init__(self, parent_name, desc, is_sub_arg=False):
        super().__init__(parent_name, desc, is_sub_arg)
        self.args = parse_args(
            desc.get("arguments", []), self.fullname(), are_sub_args=True
        )

    def custom_type(self):
        return render(
            "struct.swift", struct_name=self.type, args=self.args, camel_case=camel_case
        )
