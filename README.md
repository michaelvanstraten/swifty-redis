# SwiftyRedis 

SwiftyRedis is a powerful asynchronous Redis library for Swift that simplifies interaction with Redis databases. Drawing inspiration from the [redis-rs](https://github.com/redis-rs/redis-rs) Rust crate, SwiftyRedis offers a high-level interface to Redis functionality, while also allowing for low-level flexibility. It's designed to enhance your development experience by providing customizable type conversions and leveraging modern async-await patterns.

## Basic Usage

```swift
import SwiftyRedis

let client = RedisClient(.init("localhost"))
let connection = try await client.getConnection()

let value: String = try await connection.hget("myhash", "field1")
```

## Features and Enhancements

- [x] Implementation of over 240 Redis commands
- [x] Seamless type conversion protocol for user-friendly results
- [x] Utilization of modern and intuitive async-await design
- [x] Simplified builder interface for constructing custom commands
- [x] Built-in Pub/Sub support
- [ ] Upcoming: Cluster support
- [ ] Upcoming: RedisJSON implementation
- [ ] Upcoming: RedisTimeSeries implementation

## Documentation

Comprehensive documentation is available [here](https://michaelvanstraten.github.io/swifty-redis/documentation/swiftyredis/), or you can access it via the link in the "About" section on the right.

## Development Environment

While I personally use Xcode and neovim for this project, you can choose any IDE of your preference as long as you have the [Swift compiler](https://www.swift.org/getting-started/) installed.

### Auto-Generation

Given Redis offers an extensive set of 240+ commands, I've developed a Python script for auto-generating corresponding Swift functions. This script extracts the latest command information from the [Redis GitHub repository](https://github.com/redis/redis), parsing JSON files located under `src/commands`. To rerun this auto-generation process, execute the `generate-commands.py` script found in the `Sources/Autogen` directory. The resulting Swift files will be placed in the `Sources/SwiftyRedis/Autogen/Commands` directory. This mechanism ensures that new commands introduced by Redis will be automatically supported.

In case of any issues during command implementation, you can specify function names in the `commands_to_ignore.json` file situated in the `Sources/Autogen/config` directory. It's worth noting that you should use the function names that would be generated, not the command names themselves. This approach simplifies development by obviating the need to look up actual command names.

Furthermore, a `formatting_config.json` file in the `Sources/Autogen/config` directory stores a configuration utilized by [swift-format](https://github.com/apple/swift-format), responsible for formatting generated Swift files.

Feel free to contribute to the project and enhance this library's functionality!

**Note:** The information provided in this readme reflects the state as of August 2023.
