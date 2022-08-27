//
//  File.swift
//  
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

/**
 The protocol on which every redis command is implemented.
 
 ## Overview
 It provides convenient access to processing redis commands on one of the types that implements the required protocol stubs.
 Both ``RedisConnection`` and ``RedisPipeline`` conform to it.
 */

public protocol RedisCommands {
    func process_command(_ cmd: Cmd) -> Self
}
