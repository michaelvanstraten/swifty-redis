import os
from jinja2 import Environment, FileSystemLoader

# Get the directory containing this script
current_dir = os.path.dirname(os.path.abspath(__file__))
template_dir = os.path.join(current_dir, "templates")

# Create a Jinja2 environment
env = Environment(loader=FileSystemLoader(template_dir))


def render(template_name: str, *args, **kwargs) -> str:
    """
    Render a Jinja2 template with the given arguments.

    :param template_name: The name of the template file.
    :param args: Positional arguments to pass to the template.
    :param kwargs: Keyword arguments to pass to the template.
    :return: The rendered template as a string.
    """
    template = env.get_template(template_name)
    return template.render(*args, **kwargs)
