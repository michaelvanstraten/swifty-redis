/// {{ summary }}
{% if since %}
/// ## Available since 
/// {{ since }}
{% endif %}
{% if time_complexity %}
/// ## Time complexity
/// {{ time_complexity }}
{% endif %}
{% if history %}
/// ## History
{% for entry in history %}
/// - {{ "{}, {}".format(entry[0], entry[1]) }}
{% endfor %}
{% endif %}
/// ## Documentation
/// view the docs for [{{ docs_name }}](https://redis.io/commands/{{ docs_link_name }})
func {{ func_name }}{{ "<T: FromRedisValue>" if not void and not pipeline }}({% for arg in args %}{{ arg.parameter() }}{{ ", " if not loop.last }}{% endfor %}){{ "async throws" if not pipeline }} {{ "->" if not void }} {% if pipeline %}Self{% elif not void%}T{% endif %} {
    {% if container_name %}
    let cmd = Cmd("{{ container_name }}")
        .arg("{{ name }}")
    {% else %}
    let cmd = Cmd("{{ name }}")
    {% endif %}
    {% for arg in args %}
        {% if arg.token %}
            {% if arg.is_variadic %}
                .arg((!{{ arg.name }}.isEmpty) ? "{{arg.token}}" : nil)
            {% elif arg.is_optional %}
                .arg(({{ arg.name }} != nil) ? "{{arg.token}}" : nil)
            {% else %}
                .arg("{{arg.token}}")
            {% endif %}
        {% endif %}
        .arg({{ arg.name }})
    {% endfor %}
    {% if pipeline %}
    return self.add_command(cmd)
    {% elif void %}
    try await cmd.exec(self)
    {% else %}
    return try await cmd.query(self)
    {% endif %}
}
