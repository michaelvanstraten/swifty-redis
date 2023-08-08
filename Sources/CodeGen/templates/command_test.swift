func test_{{func_name}}() async throws {
    let connection = try await client.get_connection()
    try await connection.{{func_name}}({% for arg in args %}{{ arg.test_parameter() }}{{ ", " if not loop.last }}{% endfor %}).exec()
}