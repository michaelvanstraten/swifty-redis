/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Using existing commands
*/

import Foundation
import SwiftyRedis

let con = try await RedisClient.LOCAL.get_connection()

con.geosearch(
    key: "Sicily",
    from: .FROMLONLAT(
        .init(
            longitude: 15,
            latitude: 37
        )
    )
).query()
