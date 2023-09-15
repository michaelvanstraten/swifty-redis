# CodeGen

This directory houses a Python package designed to streamline the process of generating Swift code for Redis's extensive repertoire of over 240 commands. We accomplish this by extracting command information directly from the [Redis GitHub repository](https://github.com/redis/redis), specifically by parsing JSON files located within the `src/commands` directory.

## Getting Started

To get started with this package and commence Swift function generation, simply follow these straightforward steps:

1. Ensure that you are currently in the appropriate directory:

   ```shell
   cd Sources/CodeGen
   ```

2. Proceed to install the required dependencies using Poetry:

   ```shell
   poetry install
   ```

## Generating Swift Functions

To regenerate Swift functions corresponding to Redis commands, execute the following command:

```shell
poetry run python generate.py commands
```

The resulting Swift files will be automatically deposited into the `Sources/SwiftyRedis/CodeGen/Commands` directory.

## Configuration

Our package provides the flexibility to customize its behavior through the `config.json` file located in this directory. Here, we outline key configuration options:

### Ignoring Commands

Should you encounter any issues during command generation, it's possible to specify Redis commands to be excluded from the code generation process. This can be achieved by adding them to the `commandsToIgnore` array. At present, the following commands are excluded since they are manually implemented:

```json
{
  "commandsToIgnore": [
    "subscribe",
    "psubscribe",
    "ssubscribe",
    "unsubscribe",
    "punsubscribe",
    "sunsubscribe"
  ]
}
```

**Note**: Please utilize the generated function names instead of the command names themselves. This simplifies development by eliminating the necessity to look up the actual command names.

### Formatting Configuration

Under the `formatingConfig` section, you will find settings for code formatting, which are applied using [swift-format](https://github.com/apple/swift-format).

### Name Substitution

Redis may employ argument names that are not valid as Swift function arguments. In such cases, utilize the `namesToSubstitute` section to redefine these names. Currently, the following names are replaced:

```json
{
  "namesToSubstitute": {
    "operator": "rOperator",
    "where": "rWhere"
  }
}
```

### Token Substitution

Redis occasionally defines tokens that do not comply with Swift naming conventions when representing enum variants. This option empowers you to replace these variant names with Swift-compliant alternatives. Presently, the following tokens are substituted:

```json
{
  "tokensToSubstitute": {
    "*": "AUTO_ID",
    "=": "EQUAL",
    "~": "APPROXIMATELY",
    "$": "NEW_ID",
    "\"\"": "EMPTY_STRING"
  }
}
```
