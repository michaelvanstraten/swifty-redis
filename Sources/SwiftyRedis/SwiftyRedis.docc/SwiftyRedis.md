# ``SwiftyRedis``

A high level async redis library for Swift.

## Overview

SwiftyRedis is partially rewritten and heavily inspired by the [redis-rs](https://github.com/redis-rs/redis-rs) rust crate.
It provides convenient access to all Redis functionality through a very flexible but low-level API. 

It has a customizable type conversion protocol ``SwiftyRedis/FromRedisValue`` so that any operation can return results in just the type you are expecting. 
This makes for a very pleasant development experience.

## Topics

### Essentials

- <doc:/tutorials/SwiftyRedis>
- ``RedisClient``
- ``RedisConnection``
- ``RedisPipeline``
- ``Cmd``

### Type Conversion Protocols 

- ``FromRedisValue``
- ``ToRedisArgs``

### Helper Types

- ``JSONValue``
- ``RedisStream``
- ``RedisStreamElement``
- ``XreadResponse``
- ``XrangeResponse``
