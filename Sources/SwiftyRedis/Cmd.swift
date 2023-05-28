//
//  Cmd.swift
//
//
//  Created by Michael Van straten on 05.07.22.
//

import Foundation

/**
 A command acts as a builder interface for creating encoded Redis requests. It allows you to easily assemble a packed command by chaining arguments together.

 For more information on implementing your own commands, refer to <doc:ImplementYourOwnCommands>.
 */
public class Cmd {
    private var args: [Data] = Array()

    /**
     Initializes a new `Cmd` instance.

     - Parameter name: An optional name to be included as the first argument of the command.
     */
    public init(_ name: String? = nil) {
        if let name = name {
            arg(name)
        }
    }

    /**
     Appends an argument to the command.

     - Parameter arg: The argument to be appended. It must conform to the ``ToRedisArgs`` protocol. Most primitive types conform to it.
     - Returns: The current `Cmd` instance.
     */
    @discardableResult
    public func arg<T: ToRedisArgs>(_ arg: T) -> Self {
        arg.write_redis_args(out: &args)
        return self
    }

    /**
     Sends the command as a query to the Redis connection and converts the result to the target type.

     - Parameter con: The ``RedisConnection`` to which the command is sent.
     - Returns: The result of the query, converted to the specified ``FromRedisValue`` type.
     - Throws: An error if the query fails.
     */
    public func query<T: FromRedisValue>(_ con: RedisConnection) async throws -> T {
        let value = try await con.request_packed_cmd(pack_command())
        return try T(value)
    }

    /**
     Executes the command as a query to the Redis connection and dosn't return a value.

     This is a shortcut to ``query(_:)`` that does not return a ``RedisValue``.

     - Parameter con: The ``RedisConnection`` to which the command is sent.
     - Throws: An error if the query fails.
     */
    public func exec(_ con: RedisConnection) async throws {
        let _: RedisValue = try await query(con)
    }

    /**
     Packs the command into a `Data` object for transmission.

     - Returns: The packed command as `Data`.
     */
    internal func pack_command() -> Data {
        var packed_cmd = Data()

        packed_cmd.append(contentsOf: [RedisRESP.Array])
        packed_cmd.append(contentsOf: String(args.count).data(using: .utf8)!)
        packed_cmd.append(contentsOf: RedisRESP.CRLF)

        for arg in args {
            packed_cmd.append(contentsOf: [RedisRESP.BulkString])
            packed_cmd.append(contentsOf: String(arg.count).data(using: .utf8)!)
            packed_cmd.append(contentsOf: RedisRESP.CRLF)

            packed_cmd.append(contentsOf: arg)
            packed_cmd.append(contentsOf: RedisRESP.CRLF)
        }

        return packed_cmd
    }
}
