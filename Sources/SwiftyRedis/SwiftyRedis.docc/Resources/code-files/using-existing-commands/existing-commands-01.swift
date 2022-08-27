/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Using existing commands
*/

import Foundation
import SwiftyRedis

let con = try await RedisClient.LOCAL.get_connection()
