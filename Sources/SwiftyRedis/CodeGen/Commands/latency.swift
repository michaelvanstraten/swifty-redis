//
//  latency.swift
//
//
//  Created by CodeGen on 14.09.23.
//
import Foundation
extension RedisConnection {
    /// Show helpful text about the different subcommands.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HELP](https://redis.io/commands/latency-help)
    public func latency_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("LATENCY").arg("HELP")
        return try await cmd.query(self)
    }
    /// Show helpful text about the different subcommands.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HELP](https://redis.io/commands/latency-help)
    public func latency_help() async throws {
        let cmd = Cmd("LATENCY").arg("HELP")
        try await cmd.exec(self)
    }
    /// Return a latency graph for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY GRAPH](https://redis.io/commands/latency-graph)
    public func latency_graph<T: FromRedisValue>(_ event: String) async throws -> T {
        let cmd = Cmd("LATENCY").arg("GRAPH").arg(event)
        return try await cmd.query(self)
    }
    /// Return a latency graph for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY GRAPH](https://redis.io/commands/latency-graph)
    public func latency_graph(_ event: String) async throws {
        let cmd = Cmd("LATENCY").arg("GRAPH").arg(event)
        try await cmd.exec(self)
    }
    /// Return timestamp-latency samples for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HISTORY](https://redis.io/commands/latency-history)
    public func latency_history<T: FromRedisValue>(_ event: String) async throws -> T {
        let cmd = Cmd("LATENCY").arg("HISTORY").arg(event)
        return try await cmd.query(self)
    }
    /// Return timestamp-latency samples for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HISTORY](https://redis.io/commands/latency-history)
    public func latency_history(_ event: String) async throws {
        let cmd = Cmd("LATENCY").arg("HISTORY").arg(event)
        try await cmd.exec(self)
    }
    /// Return the latest latency samples for all events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY LATEST](https://redis.io/commands/latency-latest)
    public func latency_latest<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("LATENCY").arg("LATEST")
        return try await cmd.query(self)
    }
    /// Return the latest latency samples for all events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY LATEST](https://redis.io/commands/latency-latest)
    public func latency_latest() async throws {
        let cmd = Cmd("LATENCY").arg("LATEST")
        try await cmd.exec(self)
    }
    /// Return the cumulative distribution of latencies of a subset of commands or all.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands with latency information being retrieved.
    /// ## Documentation
    /// view the docs for [LATENCY HISTOGRAM](https://redis.io/commands/latency-histogram)
    public func latency_histogram<T: FromRedisValue>(_ command: String...) async throws -> T {
        let cmd = Cmd("LATENCY").arg("HISTOGRAM").arg(command)
        return try await cmd.query(self)
    }
    /// Return the cumulative distribution of latencies of a subset of commands or all.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands with latency information being retrieved.
    /// ## Documentation
    /// view the docs for [LATENCY HISTOGRAM](https://redis.io/commands/latency-histogram)
    public func latency_histogram(_ command: String...) async throws {
        let cmd = Cmd("LATENCY").arg("HISTOGRAM").arg(command)
        try await cmd.exec(self)
    }
    /// Reset latency data for one or more events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY RESET](https://redis.io/commands/latency-reset)
    public func latency_reset<T: FromRedisValue>(_ event: String...) async throws -> T {
        let cmd = Cmd("LATENCY").arg("RESET").arg(event)
        return try await cmd.query(self)
    }
    /// Reset latency data for one or more events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY RESET](https://redis.io/commands/latency-reset)
    public func latency_reset(_ event: String...) async throws {
        let cmd = Cmd("LATENCY").arg("RESET").arg(event)
        try await cmd.exec(self)
    }
    /// Return a human readable latency analysis report.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY DOCTOR](https://redis.io/commands/latency-doctor)
    public func latency_doctor<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("LATENCY").arg("DOCTOR")
        return try await cmd.query(self)
    }
    /// Return a human readable latency analysis report.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY DOCTOR](https://redis.io/commands/latency-doctor)
    public func latency_doctor() async throws {
        let cmd = Cmd("LATENCY").arg("DOCTOR")
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Show helpful text about the different subcommands.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HELP](https://redis.io/commands/latency-help)
    public func latency_help() -> Self {
        let cmd = Cmd("LATENCY").arg("HELP")
        return self.add_command(cmd)
    }
    /// Return a latency graph for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY GRAPH](https://redis.io/commands/latency-graph)
    public func latency_graph(_ event: String) -> Self {
        let cmd = Cmd("LATENCY").arg("GRAPH").arg(event)
        return self.add_command(cmd)
    }
    /// Return timestamp-latency samples for the event.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY HISTORY](https://redis.io/commands/latency-history)
    public func latency_history(_ event: String) -> Self {
        let cmd = Cmd("LATENCY").arg("HISTORY").arg(event)
        return self.add_command(cmd)
    }
    /// Return the latest latency samples for all events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY LATEST](https://redis.io/commands/latency-latest)
    public func latency_latest() -> Self {
        let cmd = Cmd("LATENCY").arg("LATEST")
        return self.add_command(cmd)
    }
    /// Return the cumulative distribution of latencies of a subset of commands or all.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of commands with latency information being retrieved.
    /// ## Documentation
    /// view the docs for [LATENCY HISTOGRAM](https://redis.io/commands/latency-histogram)
    public func latency_histogram(_ command: String...) -> Self {
        let cmd = Cmd("LATENCY").arg("HISTOGRAM").arg(command)
        return self.add_command(cmd)
    }
    /// Reset latency data for one or more events.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY RESET](https://redis.io/commands/latency-reset)
    public func latency_reset(_ event: String...) -> Self {
        let cmd = Cmd("LATENCY").arg("RESET").arg(event)
        return self.add_command(cmd)
    }
    /// Return a human readable latency analysis report.
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LATENCY DOCTOR](https://redis.io/commands/latency-doctor)
    public func latency_doctor() -> Self {
        let cmd = Cmd("LATENCY").arg("DOCTOR")
        return self.add_command(cmd)
    }
}
