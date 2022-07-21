//
//  File.swift
//  
//
//  Created by Michael Van straten on 21.07.22.
//

import Foundation

public protocol RedisCommands {
    func process_command(_ cmd: Cmd) -> Self
}
