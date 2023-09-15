import json
from typing import Dict, List, Any

config_file_path = "config.json"

# Load the JSON configuration from the file
with open(config_file_path, "r") as config_file:
    config: Dict[str, Any] = json.load(config_file)

commands_to_ignore: List[Any] = config.get("commandsToIgnore", [])
arguments_to_ignore: List[Any] = config.get("argumentsToIgnore", [])
formating_config: Dict[str, Any] = config.get("formatingConfig", {})
names_to_substitute: Dict[str, Any] = config.get("namesToSubstitute", {})
tokens_to_substitute: Dict[str, Any] = config.get("tokensToSubstitute", {})
