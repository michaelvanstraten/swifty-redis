//
//  Using a PubSubConnection
//

import Foundation

// Create a Redis client
let client = RedisClient(
    .init("redis.mydomain.example"),
    port: .init(integerLiteral: 1234),
    params: .tcp
)

// Create a PubSubConnection instance
let pubSubConnection = try await client.get_pub_sub_connection()


// Define a message stream handler
func handleMessageStream(stream: PubSubConnection.MessageStream) {
    Task {
        do {
            async for result in stream {
                switch result {
                case .success(let message):
                    print("Received message: \(message)")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        } catch {
            print("Error while handling message stream: \(error)")
        }
    }
}

// Subscribe to a channel
try await pubSubConnection.subscribe("channel1")
