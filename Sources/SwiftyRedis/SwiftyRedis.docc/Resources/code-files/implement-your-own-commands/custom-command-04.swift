/*
 
See LICENSE folder for this sample’s licensing information.
 
Abstract:
Implement your own commands
*/

import Foundation
import SwiftyRedis

func sadd(_ key: String, members: String...) -> Cmd {
    Cmd("sadd")
        .arg(key)
        .arg(members)
}
