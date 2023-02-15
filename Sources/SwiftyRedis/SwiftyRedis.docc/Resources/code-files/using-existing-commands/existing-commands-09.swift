/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Using existing commands
*/

import Foundation
import SwiftyRedis

let con = try await RedisClient.LOCAL.get_connection()

let result: RedisValue = try await con.geosearch(
    key: "Sicily",
    from: .FROMLONLAT(
        .init(
            longitude: 15,
            latitude: 37
        )
    ),
    by: .BOX(
        .init(
            width: 400,
            height: 400,
            unit: .km
        )
    ),
    order: .ASC,
    options: [.WITHCOORD, .WITHDIST]
)
