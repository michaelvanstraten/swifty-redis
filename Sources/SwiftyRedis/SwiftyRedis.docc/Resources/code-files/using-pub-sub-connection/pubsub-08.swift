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

// Start listening for messages
let messageStream = await pubSubConnection.messages()
handleMessageStream(stream: messageStream)

// Initialize RedisConnection instance
let con = try await client.get_connection()

// Publish a message to the subscribed channel
con.publish("channel1", "Hello, Redis!")

// Wait for some time to receive messages
await Task.sleep(3 * 1_000_000_000)
