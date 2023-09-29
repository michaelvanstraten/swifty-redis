//
//  Client.swift
//
//
//  Created by Michael Van straten on 11.07.22.
//

@_spi(AsyncChannel) import NIOCore
@_spi(AsyncChannel) import NIOPosix

/**
 The `RedisClient` acts as connector to the redis server. By itself it does not
 do much other than providing a convenient way to fetch a connection from it.

 ## Example

 ```swift
 let client = RedisClient(.init("localhost"))
 let connection = try await client.get_connection()
 ```
 */
public class RedisClient {
    /// As RedisClient initialized to connect to localhost:6379 without using TLS. This can be used for easier development.
    public static let LOCAL = RedisClient(.init("localhost"))

    let host: String
    let port: Int
    // let tlsConfiguration: TLSConfiguration?
    let database: UInt
    let username: String?
    let password: String?

    /**
     Initialize the RedisClient struct without connecting to the underling endpoint.
     Use the ``get_connection()`` method to connect to the endpoint.

     - Parameters:
        - host: The name or address that identifies the Redis server endpoint.
        - port: The port number on which to connect to the Redis server.
        - params: The parameters used if the connection needs to be established over TLS or some other protocol.
        - database: If this is not equal to zero, the client will switch to the specified database using the ``select(_:)-4cj39`` method before the connection is returned.
        - username: If this and the `password` are provided, the client will try to authenticate with the Redis server using the ``auth(_:_:)-1wjfv`` method before the connection is returned.
        - password: The password to use when authenticating.
     */
    public init(
        _ host: String,
        port: Int = 6379,
        // tlsConfiguration: TLSConfiguration? = .clientDefault,
        database: UInt = 0,
        username: String? = nil,
        password: String? = nil
    ) {
        self.host = host
        self.port = port
        // self.tlsConfiguration = tlsConfiguration
        self.database = database
        self.username = username
        self.password = password
    }

    /**
     Establishes a connection to Redis and returns a ``RedisConnection`` object.

     - Returns: A connection object that can be used to send commands to the Redis server.
     - Throws: An error if the connection cannot be established.
     */
    public func get_connection(group: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)) async throws -> RedisConnection {
        let clientChannel = try await ClientBootstrap(group: group)
            .connect(host: host, port: port) { channel in
                channel.eventLoop.makeSucceededFuture(try! NIOAsyncChannel<ByteBuffer, ByteBuffer>(synchronouslyWrapping: channel))
            }

        let redis_connection = RedisConnection(clientChannel)
        
        if database != 0 {
            try await redis_connection.select(Int(database))
        }
        if let username = username, let password = password {
            try await redis_connection.auth(username, password)
        }
        return redis_connection
    }

    /**
     Establishes a connection to Redis and returns a ``PubSubConnection`` object.

     - Returns: A connection object that can be used to subscribe to channels and receive messages.
     - Throws: An error if the connection cannot be established.
     */
    public func get_pub_sub_connection(group: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)) async throws -> PubSubConnection {
        let redis_connection = try await get_connection(group: group)
        return PubSubConnection(con: redis_connection)
    }
}
