from os.path import abspath
from jinja2 import Template
from parsing_types.complex_argument import ComplexArgument

from utils import camel_case, THIS_DIR
from parsing_types.argument import parse_args

with open(abspath(THIS_DIR + "/templates/struct.swift")) as file:
    struct_template = Template(
        file.read(),
    )

with open(abspath(THIS_DIR + "/templates/options.swift")) as file:
    options_template = Template(file.read())

class StructArgument(ComplexArgument):
    def __init__(self, parent_name, desc, is_sub_arg=False):
        super().__init__(parent_name, desc, is_sub_arg)
        self.args = parse_args(desc.get("arguments", []), self.fullname(), are_sub_args=True)

    def custom_type(self):
        return struct_template.render(
            struct_name=self.type,
            args=self.args,
            camel_case=camel_case
        )