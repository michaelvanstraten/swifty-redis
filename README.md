# SwiftyRedis 

SwiftyRedis is a powerful and flexible asynchronous Redis library for Swift, designed to streamline your interaction with Redis databases. Drawing inspiration from the [redis-rs](https://github.com/redis-rs/redis-rs) Rust crate, SwiftyRedis offers a high-level interface to Redis functionality while preserving low-level flexibility. It is tailored to enhance your development experience by providing customizable type conversions and harnessing modern async-await patterns.

## Getting Started

To integrate SwiftyRedis into your project, you can use Swift Package Manager. Simply add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/michaelvanstraten/swifty-redis.git", from: "0.1.2")
```

Then, in your target's dependencies array, add `"SwiftyRedis"` as a dependency:

```swift
.target(
    name: "YourApp",
    dependencies: ["SwiftyRedis"]),
```

After adding the dependency, you can import SwiftyRedis and start using it in your code:

```swift
import SwiftyRedis

let client = RedisClient(.init("localhost"))
let connection = try await client.getConnection()

let value: String = try await connection.hget("myhash", "field1")
```

## Features and Enhancements

- [x] Implementation of over 240 Redis commands
- [x] Seamless type conversion protocol for intuitive results
- [x] Leveraging modern and intuitive async-await design patterns
- [x] Simplified builder interface for crafting custom commands
- [x] Built-in Pub/Sub support
- [ ] Upcoming: Cluster support
- [ ] Upcoming: RedisJSON implementation
- [ ] Upcoming: RedisTimeSeries implementation

## Documentation

Comprehensive documentation is available [here](https://michaelvanstraten.github.io/swifty-redis/documentation/swiftyredis/), or you can conveniently access it via the link in the "About" section on the right.

## Contributing

We deeply appreciate your interest in contributing to SwiftyRedis! To get started, we recommend exploring the documentation through the provided link above. While the documentation might not be fully exhaustive, it's packed with valuable insights. Here are some areas where you can make a meaningful impact:

- **Enhance Test Coverage:** Elevate the project's reliability by crafting additional tests or enhancing the existing ones.
- **Refine Documentation Structure:** Enhance the clarity and organization of our documentation. Your contributions can help users navigate information more effectively.
- **Enrich Tutorials:** Consider introducing new tutorials or refining existing ones in the documentation. This can significantly aid users in effectively utilizing SwiftyRedis.

### Automated Code Generation

To facilitate the support of Redis's extensive set of 240+ commands, I've developed a Python script that automatically generates corresponding Swift functions. This script extracts command information from the [Redis GitHub repository](https://github.com/redis/redis), parsing JSON files under `src/commands`. To re-run this auto-generation process, execute the `generate-commands.py` script found in the `Sources/CodeGen` directory. The generated Swift files will be placed in the `Sources/SwiftyRedis/CodeGen/Commands` directory. This ensures automatic support for new Redis commands.

If you encounter issues during command implementation, you can specify function names in the `commands_to_ignore.json` file located in the `Sources/CodeGen/config` directory. It's important to use the function names that will be generated, not the command names themselves. This simplifies development by eliminating the need to look up actual command names.

Additionally, the `formatting_config.json` file in the `Sources/CodeGen/config` directory contains configuration settings used by [swift-format](https://github.com/apple/swift-format) for formatting generated Swift files.

We encourage you to contribute to the project and enhance the library's functionality!

**Please Note:** The information provided in this readme is accurate as of August 2023.

