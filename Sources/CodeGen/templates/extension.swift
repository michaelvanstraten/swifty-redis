//
//  {{ filename }}
//  
//
//  Created by Autogen on {{ creation_date }}.
//

import Foundation

public extension RedisConnection {
{% for command in commands %}
    {{ command.func() }}
    {{ command.func(void=True) }}
{% endfor %}
}

public extension RedisPipeline {
{% for command in commands %}
    {{ command.func(pipeline=True) }}
{% endfor %}
}

{% for command in commands %}
    {% for arg in command.args %}
    {{ arg.custom_type() if arg.custom_type is defined }}
    {% endfor %}
{% endfor %}
