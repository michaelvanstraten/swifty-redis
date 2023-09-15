[![Redis Version](https://img.shields.io/badge/Redis_Version-7.2.1-green?color=white&logo=redis&logoColor=white&labelColor=d82c20)](https://github.com/redis/redis/releases/tag/7.2.1)
[![Integration Tests](https://github.com/michaelvanstraten/swifty-redis/actions/workflows/integration-tests.yml/badge.svg)](https://github.com/michaelvanstraten/swifty-redis/actions/workflows/integration-tests.yml)
[![Build DocC](https://github.com/michaelvanstraten/swifty-redis/actions/workflows/build-docc.yml/badge.svg)](https://github.com/michaelvanstraten/swifty-redis/actions/workflows/build-docc.yml)

# SwiftyRedis

SwiftyRedis is an asynchronous Redis library for Swift, designed to streamline your interactions with Redis databases. Drawing inspiration from the [redis-rs](https://github.com/redis-rs/redis-rs) Rust crate, SwiftyRedis offers a high-level interface to Redis functionality while preserving low-level flexibility. It is tailored to enhance your development experience by providing a very flexible type conversion protocol as well as modern async-await patterns.

## Getting Started

To integrate SwiftyRedis into your project, you can use the Swift Package Manager. Simply add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/michaelvanstraten/swifty-redis.git", from: "0.1.2")
```

Then, in your target's dependencies array, add `"SwiftyRedis"` as a dependency:

```swift
.target(
    name: "YourApp",
    dependencies: ["SwiftyRedis"]),
```

Once you've added the dependency, import SwiftyRedis and begin using it in your code:

```swift
import SwiftyRedis

let client = RedisClient(.init("localhost"))
let connection = try await client.getConnection()

let value: String = try await connection.hget("myhash", "field1")
```

## Features and Enhancements

- [x] Implementation of over 240 Redis commands
- [x] Seamless type conversion protocol for intuitive results
- [x] Utilization of modern and intuitive async-await design patterns
- [x] Simplified builder interface for creating custom commands
- [x] Built-in Pub/Sub support
- [ ] Upcoming: Cluster support
- [ ] Upcoming: RedisJSON implementation
- [ ] Upcoming: RedisTimeSeries implementation
- [ ] Upcoming: SwiftNIO networking backend

## Documentation

Comprehensive documentation is available [here](https://michaelvanstraten.github.io/swifty-redis/documentation/swiftyredis/), or you can conveniently access it through the link in the "About" section on the right.

## Contributing

We greatly appreciate your interest in contributing to SwiftyRedis! To get started, we recommend exploring the documentation provided above. While the documentation might not cover every detail, it contains valuable insights. Here are some areas where your contributions can make a meaningful impact:

- **Enhance Test Coverage:** Improve the project's reliability by creating additional tests or enhancing existing ones.
- **Refine Documentation Structure:** Enhance the clarity and organization of our documentation. Your contributions can help users navigate information more effectively.
- **Enrich Tutorials:** Consider adding new tutorials or refining existing ones in the documentation. This can significantly assist users in effectively utilizing SwiftyRedis.

To start contributing, run the following command to clone the repository:

```bash
git clone --recurse-submodules https://github.com/michaelvanstraten/swifty-redis.git
```

If you are interested in the automatic code generation package we developed to stay up to date with the latest Redis versions, navigate to the [`Sources/CodeGen`](Sources/CodeGen) directory.

We invite you to contribute to the project and enhance the library's functionality!

**Please Note:** The information in this readme is accurate as of September 2023.
