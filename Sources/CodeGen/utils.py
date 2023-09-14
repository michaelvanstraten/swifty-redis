import os
import glob
import re
from datetime import date
import click
from git.repo import Repo
from git import RemoteProgress
from tqdm import tqdm

# Get the current directory of the script
THIS_DIR = os.path.dirname(os.path.abspath(__file__))


class ProgressHandler(RemoteProgress):
    def __init__(self, desc):
        super().__init__()
        self.pbar = tqdm()
        self.pbar.set_description_str(desc)

    def update(self, _, cur_count, max_count=None):
        self.pbar.total = max_count
        self.pbar.n = cur_count
        self.pbar.refresh()


def make_sure_remote_repo_is_downloaded(
    name: str, remote_url: str, branch: str = "main"
) -> Repo:
    repo_path = os.path.join(THIS_DIR, name)
    repo = Repo.init(repo_path, mkdir=True)
    try:
        remote = repo.remote(name)
    except:
        remote = repo.create_remote(name, remote_url)
    remote.pull(
        branch, progress=ProgressHandler(desc=f"Downloading {name} ({remote_url})")
    )
    return repo


def get_optional_desc_string(desc, field, force_uppercase=False):
    value = desc.get(field, None)
    if value and force_uppercase:
        value = value.upper()
    return f'"{value}"' if value else "NULL"


def camel_case(s):
    return pascal_case(s)[0].lower() + pascal_case(s)[1:]


def pascal_case(s):
    s = re.sub(r"[\_\-\/\.\:]", " ", s)
    return "".join(s.title().split())


def snake_case(s):
    s = re.sub(r"[\_\-\/\.\:]", " ", s)
    return "_".join(s.split()).lower()


def kebab_case(s):
    s = re.sub(r"[\_\-\/\.\:]", " ", s)
    return "-".join(s.split()).lower()


def sanitize(s):
    return s.replace("-", "_").replace(":", "")


def clean_out_directory(out_dir):
    click.echo("Cleaning out directory...")
    os.makedirs(out_dir, exist_ok=True)
    for file_path in glob.glob(os.path.join(out_dir, "*")):
        os.remove(file_path)


def get_todays_date():
    return date.today().strftime("%d.%m.%y")
