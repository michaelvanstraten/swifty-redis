//
//  {{ filename }}
//  
//
//  Created by Autogen on {{ creation_date }}.
//

import XCTest
@testable import SwiftyRedis

final class {{test_name}}: XCTestCase {
    let client = RedisClient.LOCAL

    {% for command in commands %}
        {{ command.test() }}
    {% endfor %}
}