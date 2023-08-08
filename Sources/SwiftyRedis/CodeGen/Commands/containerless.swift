//
//  containerless.swift
//
//
//  Created by Autogen on 19.05.23.
//
import Foundation
extension RedisConnection {
    /// A container for Access List Control commands
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [ACL](https://redis.io/commands/acl)
    public func acl<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ACL")
        return try await cmd.query(self)
    }
    /// A container for Access List Control commands
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [ACL](https://redis.io/commands/acl)
    public func acl() async throws {
        let cmd = Cmd("ACL")
        try await cmd.exec(self)
    }
    /// Append a value to a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1). The amortized time complexity is O(1) assuming the appended value is small and the already present value is of any size, since the dynamic string library used by Redis will double the free space available on every reallocation.
    /// ## Documentation
    /// view the docs for [APPEND](https://redis.io/commands/append)
    public func append<T: FromRedisValue>(_ key: String, _ value: String) async throws -> T {
        let cmd = Cmd("APPEND").arg(key).arg(value)
        return try await cmd.query(self)
    }
    /// Append a value to a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1). The amortized time complexity is O(1) assuming the appended value is small and the already present value is of any size, since the dynamic string library used by Redis will double the free space available on every reallocation.
    /// ## Documentation
    /// view the docs for [APPEND](https://redis.io/commands/append)
    public func append(_ key: String, _ value: String) async throws {
        let cmd = Cmd("APPEND").arg(key).arg(value)
        try await cmd.exec(self)
    }
    /// Sent by cluster clients after an -ASK redirect
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ASKING](https://redis.io/commands/asking)
    public func asking<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ASKING")
        return try await cmd.query(self)
    }
    /// Sent by cluster clients after an -ASK redirect
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ASKING](https://redis.io/commands/asking)
    public func asking() async throws {
        let cmd = Cmd("ASKING")
        try await cmd.exec(self)
    }
    /// Authenticate to the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of passwords defined for the user
    /// ## History
    /// - 6.0.0, Added ACL style (username and password).
    /// ## Documentation
    /// view the docs for [AUTH](https://redis.io/commands/auth)
    public func auth<T: FromRedisValue>(_ username: String? = nil, _ password: String) async throws -> T {
        let cmd = Cmd("AUTH").arg(username).arg(password)
        return try await cmd.query(self)
    }
    /// Authenticate to the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of passwords defined for the user
    /// ## History
    /// - 6.0.0, Added ACL style (username and password).
    /// ## Documentation
    /// view the docs for [AUTH](https://redis.io/commands/auth)
    public func auth(_ username: String? = nil, _ password: String) async throws {
        let cmd = Cmd("AUTH").arg(username).arg(password)
        try await cmd.exec(self)
    }
    /// Asynchronously rewrite the append-only file
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BGREWRITEAOF](https://redis.io/commands/bgrewriteaof)
    public func bgrewriteaof<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("BGREWRITEAOF")
        return try await cmd.query(self)
    }
    /// Asynchronously rewrite the append-only file
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BGREWRITEAOF](https://redis.io/commands/bgrewriteaof)
    public func bgrewriteaof() async throws {
        let cmd = Cmd("BGREWRITEAOF")
        try await cmd.exec(self)
    }
    /// Asynchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.2, Added the `SCHEDULE` option.
    /// ## Documentation
    /// view the docs for [BGSAVE](https://redis.io/commands/bgsave)
    public func bgsave<T: FromRedisValue>(_ options: BgsaveOptions? = nil) async throws -> T {
        let cmd = Cmd("BGSAVE").arg(options)
        return try await cmd.query(self)
    }
    /// Asynchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.2, Added the `SCHEDULE` option.
    /// ## Documentation
    /// view the docs for [BGSAVE](https://redis.io/commands/bgsave)
    public func bgsave(_ options: BgsaveOptions? = nil) async throws {
        let cmd = Cmd("BGSAVE").arg(options)
        try await cmd.exec(self)
    }
    /// Count set bits in a string
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITCOUNT](https://redis.io/commands/bitcount)
    public func bitcount<T: FromRedisValue>(_ key: String, _ index: BitcountIndex? = nil) async throws -> T {
        let cmd = Cmd("BITCOUNT").arg(key).arg(index)
        return try await cmd.query(self)
    }
    /// Count set bits in a string
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITCOUNT](https://redis.io/commands/bitcount)
    public func bitcount(_ key: String, _ index: BitcountIndex? = nil) async throws {
        let cmd = Cmd("BITCOUNT").arg(key).arg(index)
        try await cmd.exec(self)
    }
    /// Perform arbitrary bitfield integer operations on strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD](https://redis.io/commands/bitfield)
    public func bitfield<T: FromRedisValue>(_ key: String, _ operation: BitfieldOperation...) async throws -> T {
        let cmd = Cmd("BITFIELD").arg(key).arg(operation)
        return try await cmd.query(self)
    }
    /// Perform arbitrary bitfield integer operations on strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD](https://redis.io/commands/bitfield)
    public func bitfield(_ key: String, _ operation: BitfieldOperation...) async throws {
        let cmd = Cmd("BITFIELD").arg(key).arg(operation)
        try await cmd.exec(self)
    }
    /// Perform arbitrary bitfield integer operations on strings. Read-only variant of BITFIELD
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD_RO](https://redis.io/commands/bitfield-ro)
    public func bitfield_ro<T: FromRedisValue>(_ key: String, _ encodingOffset: BitfieldRoEncodingoffset...)
        async throws -> T
    {
        let cmd = Cmd("BITFIELD_RO").arg(key).arg((!encodingOffset.isEmpty) ? "GET" : nil).arg(encodingOffset)
        return try await cmd.query(self)
    }
    /// Perform arbitrary bitfield integer operations on strings. Read-only variant of BITFIELD
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD_RO](https://redis.io/commands/bitfield-ro)
    public func bitfield_ro(_ key: String, _ encodingOffset: BitfieldRoEncodingoffset...) async throws {
        let cmd = Cmd("BITFIELD_RO").arg(key).arg((!encodingOffset.isEmpty) ? "GET" : nil).arg(encodingOffset)
        try await cmd.exec(self)
    }
    /// Perform bitwise operations between strings
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## Documentation
    /// view the docs for [BITOP](https://redis.io/commands/bitop)
    public func bitop<T: FromRedisValue>(_ operation: String, _ destkey: String, _ key: String...) async throws -> T {
        let cmd = Cmd("BITOP").arg(operation).arg(destkey).arg(key)
        return try await cmd.query(self)
    }
    /// Perform bitwise operations between strings
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## Documentation
    /// view the docs for [BITOP](https://redis.io/commands/bitop)
    public func bitop(_ operation: String, _ destkey: String, _ key: String...) async throws {
        let cmd = Cmd("BITOP").arg(operation).arg(destkey).arg(key)
        try await cmd.exec(self)
    }
    /// Find first bit set or clear in a string
    /// ## Available since
    /// 2.8.7
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITPOS](https://redis.io/commands/bitpos)
    public func bitpos<T: FromRedisValue>(_ key: String, _ bit: Int, _ index: BitposIndex? = nil) async throws -> T {
        let cmd = Cmd("BITPOS").arg(key).arg(bit).arg(index)
        return try await cmd.query(self)
    }
    /// Find first bit set or clear in a string
    /// ## Available since
    /// 2.8.7
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITPOS](https://redis.io/commands/bitpos)
    public func bitpos(_ key: String, _ bit: Int, _ index: BitposIndex? = nil) async throws {
        let cmd = Cmd("BITPOS").arg(key).arg(bit).arg(index)
        try await cmd.exec(self)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BLMOVE](https://redis.io/commands/blmove)
    public func blmove<T: FromRedisValue>(
        _ source: String, _ destination: String, _ wherefrom: BlmoveWherefrom, _ whereto: BlmoveWhereto,
        _ timeout: Double
    ) async throws -> T {
        let cmd = Cmd("BLMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto).arg(timeout)
        return try await cmd.query(self)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BLMOVE](https://redis.io/commands/blmove)
    public func blmove(
        _ source: String, _ destination: String, _ wherefrom: BlmoveWherefrom, _ whereto: BlmoveWhereto,
        _ timeout: Double
    ) async throws {
        let cmd = Cmd("BLMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto).arg(timeout)
        try await cmd.exec(self)
    }
    /// Pop elements from a list, or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [BLMPOP](https://redis.io/commands/blmpop)
    public func blmpop<T: FromRedisValue>(
        _ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BlmpopRwhere, _ count: Int? = nil
    ) async throws -> T {
        let cmd = Cmd("BLMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        return try await cmd.query(self)
    }
    /// Pop elements from a list, or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [BLMPOP](https://redis.io/commands/blmpop)
    public func blmpop(_ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BlmpopRwhere, _ count: Int? = nil)
        async throws
    {
        let cmd = Cmd("BLMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        try await cmd.exec(self)
    }
    /// Remove and get the first element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BLPOP](https://redis.io/commands/blpop)
    public func blpop<T: FromRedisValue>(_ key: String..., timeout: Double) async throws -> T {
        let cmd = Cmd("BLPOP").arg(key).arg(timeout)
        return try await cmd.query(self)
    }
    /// Remove and get the first element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BLPOP](https://redis.io/commands/blpop)
    public func blpop(_ key: String..., timeout: Double) async throws {
        let cmd = Cmd("BLPOP").arg(key).arg(timeout)
        try await cmd.exec(self)
    }
    /// Remove and get the last element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOP](https://redis.io/commands/brpop)
    public func brpop<T: FromRedisValue>(_ key: String..., timeout: Double) async throws -> T {
        let cmd = Cmd("BRPOP").arg(key).arg(timeout)
        return try await cmd.query(self)
    }
    /// Remove and get the last element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOP](https://redis.io/commands/brpop)
    public func brpop(_ key: String..., timeout: Double) async throws {
        let cmd = Cmd("BRPOP").arg(key).arg(timeout)
        try await cmd.exec(self)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOPLPUSH](https://redis.io/commands/brpoplpush)
    public func brpoplpush<T: FromRedisValue>(_ source: String, _ destination: String, _ timeout: Double) async throws
        -> T
    {
        let cmd = Cmd("BRPOPLPUSH").arg(source).arg(destination).arg(timeout)
        return try await cmd.query(self)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOPLPUSH](https://redis.io/commands/brpoplpush)
    public func brpoplpush(_ source: String, _ destination: String, _ timeout: Double) async throws {
        let cmd = Cmd("BRPOPLPUSH").arg(source).arg(destination).arg(timeout)
        try await cmd.exec(self)
    }
    /// Remove and return members with scores in a sorted set or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [BZMPOP](https://redis.io/commands/bzmpop)
    public func bzmpop<T: FromRedisValue>(
        _ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BzmpopRwhere, _ count: Int? = nil
    ) async throws -> T {
        let cmd = Cmd("BZMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        return try await cmd.query(self)
    }
    /// Remove and return members with scores in a sorted set or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [BZMPOP](https://redis.io/commands/bzmpop)
    public func bzmpop(_ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BzmpopRwhere, _ count: Int? = nil)
        async throws
    {
        let cmd = Cmd("BZMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        try await cmd.exec(self)
    }
    /// Remove and return the member with the highest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMAX](https://redis.io/commands/bzpopmax)
    public func bzpopmax<T: FromRedisValue>(_ key: String..., timeout: Double) async throws -> T {
        let cmd = Cmd("BZPOPMAX").arg(key).arg(timeout)
        return try await cmd.query(self)
    }
    /// Remove and return the member with the highest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMAX](https://redis.io/commands/bzpopmax)
    public func bzpopmax(_ key: String..., timeout: Double) async throws {
        let cmd = Cmd("BZPOPMAX").arg(key).arg(timeout)
        try await cmd.exec(self)
    }
    /// Remove and return the member with the lowest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMIN](https://redis.io/commands/bzpopmin)
    public func bzpopmin<T: FromRedisValue>(_ key: String..., timeout: Double) async throws -> T {
        let cmd = Cmd("BZPOPMIN").arg(key).arg(timeout)
        return try await cmd.query(self)
    }
    /// Remove and return the member with the lowest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMIN](https://redis.io/commands/bzpopmin)
    public func bzpopmin(_ key: String..., timeout: Double) async throws {
        let cmd = Cmd("BZPOPMIN").arg(key).arg(timeout)
        try await cmd.exec(self)
    }
    /// A container for client connection commands
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLIENT](https://redis.io/commands/client)
    public func client<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLIENT")
        return try await cmd.query(self)
    }
    /// A container for client connection commands
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLIENT](https://redis.io/commands/client)
    public func client() async throws {
        let cmd = Cmd("CLIENT")
        try await cmd.exec(self)
    }
    /// A container for cluster commands
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLUSTER](https://redis.io/commands/cluster)
    public func cluster<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CLUSTER")
        return try await cmd.query(self)
    }
    /// A container for cluster commands
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLUSTER](https://redis.io/commands/cluster)
    public func cluster() async throws {
        let cmd = Cmd("CLUSTER")
        try await cmd.exec(self)
    }
    /// Get array of Redis command details
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND](https://redis.io/commands/command)
    public func command<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("COMMAND")
        return try await cmd.query(self)
    }
    /// Get array of Redis command details
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND](https://redis.io/commands/command)
    public func command() async throws {
        let cmd = Cmd("COMMAND")
        try await cmd.exec(self)
    }
    /// A container for server configuration commands
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CONFIG](https://redis.io/commands/config)
    public func config<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("CONFIG")
        return try await cmd.query(self)
    }
    /// A container for server configuration commands
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CONFIG](https://redis.io/commands/config)
    public func config() async throws {
        let cmd = Cmd("CONFIG")
        try await cmd.exec(self)
    }
    /// Copy a key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) worst case for collections, where N is the number of nested items. O(1) for string values.
    /// ## Documentation
    /// view the docs for [COPY](https://redis.io/commands/copy)
    public func copy<T: FromRedisValue>(
        _ source: String, _ destination: String, _ destinationDb: Int? = nil, _ options: CopyOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("COPY").arg(source).arg(destination).arg((destinationDb != nil) ? "DB" : nil).arg(destinationDb)
            .arg(options)
        return try await cmd.query(self)
    }
    /// Copy a key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) worst case for collections, where N is the number of nested items. O(1) for string values.
    /// ## Documentation
    /// view the docs for [COPY](https://redis.io/commands/copy)
    public func copy(
        _ source: String, _ destination: String, _ destinationDb: Int? = nil, _ options: CopyOptions? = nil
    ) async throws {
        let cmd = Cmd("COPY").arg(source).arg(destination).arg((destinationDb != nil) ? "DB" : nil).arg(destinationDb)
            .arg(options)
        try await cmd.exec(self)
    }
    /// Return the number of keys in the selected database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DBSIZE](https://redis.io/commands/dbsize)
    public func dbsize<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("DBSIZE")
        return try await cmd.query(self)
    }
    /// Return the number of keys in the selected database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DBSIZE](https://redis.io/commands/dbsize)
    public func dbsize() async throws {
        let cmd = Cmd("DBSIZE")
        try await cmd.exec(self)
    }
    /// A container for debugging commands
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [DEBUG](https://redis.io/commands/debug)
    public func debug<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("DEBUG")
        return try await cmd.query(self)
    }
    /// A container for debugging commands
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [DEBUG](https://redis.io/commands/debug)
    public func debug() async throws {
        let cmd = Cmd("DEBUG")
        try await cmd.exec(self)
    }
    /// Decrement the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECR](https://redis.io/commands/decr)
    public func decr<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("DECR").arg(key)
        return try await cmd.query(self)
    }
    /// Decrement the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECR](https://redis.io/commands/decr)
    public func decr(_ key: String) async throws {
        let cmd = Cmd("DECR").arg(key)
        try await cmd.exec(self)
    }
    /// Decrement the integer value of a key by the given number
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECRBY](https://redis.io/commands/decrby)
    public func decrby<T: FromRedisValue>(_ key: String, _ decrement: Int) async throws -> T {
        let cmd = Cmd("DECRBY").arg(key).arg(decrement)
        return try await cmd.query(self)
    }
    /// Decrement the integer value of a key by the given number
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECRBY](https://redis.io/commands/decrby)
    public func decrby(_ key: String, _ decrement: Int) async throws {
        let cmd = Cmd("DECRBY").arg(key).arg(decrement)
        try await cmd.exec(self)
    }
    /// Delete a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be removed. When a key to remove holds a value other than a string, the individual complexity for this key is O(M) where M is the number of elements in the list, set, sorted set or hash. Removing a single key that holds a string value is O(1).
    /// ## Documentation
    /// view the docs for [DEL](https://redis.io/commands/del)
    public func del<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("DEL").arg(key)
        return try await cmd.query(self)
    }
    /// Delete a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be removed. When a key to remove holds a value other than a string, the individual complexity for this key is O(M) where M is the number of elements in the list, set, sorted set or hash. Removing a single key that holds a string value is O(1).
    /// ## Documentation
    /// view the docs for [DEL](https://redis.io/commands/del)
    public func del(_ key: String...) async throws {
        let cmd = Cmd("DEL").arg(key)
        try await cmd.exec(self)
    }
    /// Discard all commands issued after MULTI
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N), when N is the number of queued commands
    /// ## Documentation
    /// view the docs for [DISCARD](https://redis.io/commands/discard)
    public func discard<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("DISCARD")
        return try await cmd.query(self)
    }
    /// Discard all commands issued after MULTI
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N), when N is the number of queued commands
    /// ## Documentation
    /// view the docs for [DISCARD](https://redis.io/commands/discard)
    public func discard() async throws {
        let cmd = Cmd("DISCARD")
        try await cmd.exec(self)
    }
    /// Return a serialized version of the value stored at the specified key.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to access the key and additional O(N*M) to serialize it, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1).
    /// ## Documentation
    /// view the docs for [DUMP](https://redis.io/commands/dump)
    public func dump<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("DUMP").arg(key)
        return try await cmd.query(self)
    }
    /// Return a serialized version of the value stored at the specified key.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to access the key and additional O(N*M) to serialize it, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1).
    /// ## Documentation
    /// view the docs for [DUMP](https://redis.io/commands/dump)
    public func dump(_ key: String) async throws {
        let cmd = Cmd("DUMP").arg(key)
        try await cmd.exec(self)
    }
    /// Echo the given string
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ECHO](https://redis.io/commands/echo)
    public func echo<T: FromRedisValue>(_ message: String) async throws -> T {
        let cmd = Cmd("ECHO").arg(message)
        return try await cmd.query(self)
    }
    /// Echo the given string
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ECHO](https://redis.io/commands/echo)
    public func echo(_ message: String) async throws {
        let cmd = Cmd("ECHO").arg(message)
        try await cmd.exec(self)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL](https://redis.io/commands/eval)
    public func eval<T: FromRedisValue>(_ script: String, _ numkeys: Int, _ key: String..., arg: String...) async throws
        -> T
    {
        let cmd = Cmd("EVAL").arg(script).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL](https://redis.io/commands/eval)
    public func eval(_ script: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("EVAL").arg(script).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA](https://redis.io/commands/evalsha)
    public func evalsha<T: FromRedisValue>(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...)
        async throws -> T
    {
        let cmd = Cmd("EVALSHA").arg(sha1).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA](https://redis.io/commands/evalsha)
    public func evalsha(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("EVALSHA").arg(sha1).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA_RO](https://redis.io/commands/evalsha-ro)
    public func evalsha_ro<T: FromRedisValue>(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...)
        async throws -> T
    {
        let cmd = Cmd("EVALSHA_RO").arg(sha1).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA_RO](https://redis.io/commands/evalsha-ro)
    public func evalsha_ro(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("EVALSHA_RO").arg(sha1).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL_RO](https://redis.io/commands/eval-ro)
    public func eval_ro<T: FromRedisValue>(_ script: String, _ numkeys: Int, _ key: String..., arg: String...)
        async throws -> T
    {
        let cmd = Cmd("EVAL_RO").arg(script).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL_RO](https://redis.io/commands/eval-ro)
    public func eval_ro(_ script: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("EVAL_RO").arg(script).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Execute all commands issued after MULTI
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// Depends on commands in the transaction
    /// ## Documentation
    /// view the docs for [EXEC](https://redis.io/commands/exec)
    public func exec<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("EXEC")
        return try await cmd.query(self)
    }
    /// Execute all commands issued after MULTI
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// Depends on commands in the transaction
    /// ## Documentation
    /// view the docs for [EXEC](https://redis.io/commands/exec)
    public func exec() async throws {
        let cmd = Cmd("EXEC")
        try await cmd.exec(self)
    }
    /// Determine if a key exists
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to check.
    /// ## History
    /// - 3.0.3, Accepts multiple `key` arguments.
    /// ## Documentation
    /// view the docs for [EXISTS](https://redis.io/commands/exists)
    public func exists<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("EXISTS").arg(key)
        return try await cmd.query(self)
    }
    /// Determine if a key exists
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to check.
    /// ## History
    /// - 3.0.3, Accepts multiple `key` arguments.
    /// ## Documentation
    /// view the docs for [EXISTS](https://redis.io/commands/exists)
    public func exists(_ key: String...) async throws {
        let cmd = Cmd("EXISTS").arg(key)
        try await cmd.exec(self)
    }
    /// Set a key's time to live in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIRE](https://redis.io/commands/expire)
    public func expire<T: FromRedisValue>(_ key: String, _ seconds: Int, _ condition: ExpireCondition? = nil)
        async throws -> T
    {
        let cmd = Cmd("EXPIRE").arg(key).arg(seconds).arg(condition)
        return try await cmd.query(self)
    }
    /// Set a key's time to live in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIRE](https://redis.io/commands/expire)
    public func expire(_ key: String, _ seconds: Int, _ condition: ExpireCondition? = nil) async throws {
        let cmd = Cmd("EXPIRE").arg(key).arg(seconds).arg(condition)
        try await cmd.exec(self)
    }
    /// Set the expiration for a key as a UNIX timestamp
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIREAT](https://redis.io/commands/expireat)
    public func expireat<T: FromRedisValue>(
        _ key: String, _ unixTimeSeconds: Int64, _ condition: ExpireatCondition? = nil
    ) async throws -> T {
        let cmd = Cmd("EXPIREAT").arg(key).arg(unixTimeSeconds).arg(condition)
        return try await cmd.query(self)
    }
    /// Set the expiration for a key as a UNIX timestamp
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIREAT](https://redis.io/commands/expireat)
    public func expireat(_ key: String, _ unixTimeSeconds: Int64, _ condition: ExpireatCondition? = nil) async throws {
        let cmd = Cmd("EXPIREAT").arg(key).arg(unixTimeSeconds).arg(condition)
        try await cmd.exec(self)
    }
    /// Get the expiration Unix timestamp for a key
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [EXPIRETIME](https://redis.io/commands/expiretime)
    public func expiretime<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("EXPIRETIME").arg(key)
        return try await cmd.query(self)
    }
    /// Get the expiration Unix timestamp for a key
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [EXPIRETIME](https://redis.io/commands/expiretime)
    public func expiretime(_ key: String) async throws {
        let cmd = Cmd("EXPIRETIME").arg(key)
        try await cmd.exec(self)
    }
    /// Start a coordinated failover between this server and one of its replicas.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FAILOVER](https://redis.io/commands/failover)
    public func failover<T: FromRedisValue>(
        _ target: FailoverTarget? = nil, _ milliseconds: Int? = nil, _ options: FailoverOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("FAILOVER").arg((target != nil) ? "TO" : nil).arg(target).arg(
            (milliseconds != nil) ? "TIMEOUT" : nil
        ).arg(milliseconds).arg(options)
        return try await cmd.query(self)
    }
    /// Start a coordinated failover between this server and one of its replicas.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FAILOVER](https://redis.io/commands/failover)
    public func failover(_ target: FailoverTarget? = nil, _ milliseconds: Int? = nil, _ options: FailoverOptions? = nil)
        async throws
    {
        let cmd = Cmd("FAILOVER").arg((target != nil) ? "TO" : nil).arg(target).arg(
            (milliseconds != nil) ? "TIMEOUT" : nil
        ).arg(milliseconds).arg(options)
        try await cmd.exec(self)
    }
    /// Invoke a function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL](https://redis.io/commands/fcall)
    public func fcall<T: FromRedisValue>(_ function: String, _ numkeys: Int, _ key: String..., arg: String...)
        async throws -> T
    {
        let cmd = Cmd("FCALL").arg(function).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Invoke a function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL](https://redis.io/commands/fcall)
    public func fcall(_ function: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("FCALL").arg(function).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Invoke a read-only function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL_RO](https://redis.io/commands/fcall-ro)
    public func fcall_ro<T: FromRedisValue>(_ function: String, _ numkeys: Int, _ key: String..., arg: String...)
        async throws -> T
    {
        let cmd = Cmd("FCALL_RO").arg(function).arg(numkeys).arg(key).arg(arg)
        return try await cmd.query(self)
    }
    /// Invoke a read-only function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL_RO](https://redis.io/commands/fcall-ro)
    public func fcall_ro(_ function: String, _ numkeys: Int, _ key: String..., arg: String...) async throws {
        let cmd = Cmd("FCALL_RO").arg(function).arg(numkeys).arg(key).arg(arg)
        try await cmd.exec(self)
    }
    /// Remove all keys from all databases
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHALL](https://redis.io/commands/flushall)
    public func flushall<T: FromRedisValue>(_ async: FlushallAsync? = nil) async throws -> T {
        let cmd = Cmd("FLUSHALL").arg(async)
        return try await cmd.query(self)
    }
    /// Remove all keys from all databases
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHALL](https://redis.io/commands/flushall)
    public func flushall(_ async: FlushallAsync? = nil) async throws {
        let cmd = Cmd("FLUSHALL").arg(async)
        try await cmd.exec(self)
    }
    /// Remove all keys from the current database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys in the selected database
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHDB](https://redis.io/commands/flushdb)
    public func flushdb<T: FromRedisValue>(_ async: FlushdbAsync? = nil) async throws -> T {
        let cmd = Cmd("FLUSHDB").arg(async)
        return try await cmd.query(self)
    }
    /// Remove all keys from the current database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys in the selected database
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHDB](https://redis.io/commands/flushdb)
    public func flushdb(_ async: FlushdbAsync? = nil) async throws {
        let cmd = Cmd("FLUSHDB").arg(async)
        try await cmd.exec(self)
    }
    /// A container for function commands
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [FUNCTION](https://redis.io/commands/function)
    public func function<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("FUNCTION")
        return try await cmd.query(self)
    }
    /// A container for function commands
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [FUNCTION](https://redis.io/commands/function)
    public func function() async throws {
        let cmd = Cmd("FUNCTION")
        try await cmd.exec(self)
    }
    /// Add one or more geospatial items in the geospatial index represented using a sorted set
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 6.2.0, Added the `CH`, `NX` and `XX` options.
    /// ## Documentation
    /// view the docs for [GEOADD](https://redis.io/commands/geoadd)
    public func geoadd<T: FromRedisValue>(
        _ key: String, _ condition: GeoaddCondition? = nil, _ longitudeLatitudeMember: GeoaddLongitudelatitudemember...,
        options: GeoaddOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEOADD").arg(key).arg(condition).arg(longitudeLatitudeMember).arg(options)
        return try await cmd.query(self)
    }
    /// Add one or more geospatial items in the geospatial index represented using a sorted set
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 6.2.0, Added the `CH`, `NX` and `XX` options.
    /// ## Documentation
    /// view the docs for [GEOADD](https://redis.io/commands/geoadd)
    public func geoadd(
        _ key: String, _ condition: GeoaddCondition? = nil, _ longitudeLatitudeMember: GeoaddLongitudelatitudemember...,
        options: GeoaddOptions? = nil
    ) async throws {
        let cmd = Cmd("GEOADD").arg(key).arg(condition).arg(longitudeLatitudeMember).arg(options)
        try await cmd.exec(self)
    }
    /// Returns the distance between two members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [GEODIST](https://redis.io/commands/geodist)
    public func geodist<T: FromRedisValue>(
        _ key: String, _ member1: String, _ member2: String, _ unit: GeodistUnit? = nil
    ) async throws -> T {
        let cmd = Cmd("GEODIST").arg(key).arg(member1).arg(member2).arg(unit)
        return try await cmd.query(self)
    }
    /// Returns the distance between two members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [GEODIST](https://redis.io/commands/geodist)
    public func geodist(_ key: String, _ member1: String, _ member2: String, _ unit: GeodistUnit? = nil) async throws {
        let cmd = Cmd("GEODIST").arg(key).arg(member1).arg(member2).arg(unit)
        try await cmd.exec(self)
    }
    /// Returns members of a geospatial index as standard geohash strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each member requested, where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [GEOHASH](https://redis.io/commands/geohash)
    public func geohash<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("GEOHASH").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Returns members of a geospatial index as standard geohash strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each member requested, where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [GEOHASH](https://redis.io/commands/geohash)
    public func geohash(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("GEOHASH").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Returns longitude and latitude of members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members requested.
    /// ## Documentation
    /// view the docs for [GEOPOS](https://redis.io/commands/geopos)
    public func geopos<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("GEOPOS").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Returns longitude and latitude of members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members requested.
    /// ## Documentation
    /// view the docs for [GEOPOS](https://redis.io/commands/geopos)
    public func geopos(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("GEOPOS").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a point
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUS](https://redis.io/commands/georadius)
    public func georadius<T: FromRedisValue>(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusUnit,
        _ count: GeoradiusCount? = nil, _ order: GeoradiusOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEORADIUS").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg((STORE != nil) ? "STORE" : nil).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST)
            .arg(options)
        return try await cmd.query(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a point
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUS](https://redis.io/commands/georadius)
    public func georadius(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusUnit,
        _ count: GeoradiusCount? = nil, _ order: GeoradiusOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusOptions? = nil
    ) async throws {
        let cmd = Cmd("GEORADIUS").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg((STORE != nil) ? "STORE" : nil).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST)
            .arg(options)
        try await cmd.exec(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a member
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER](https://redis.io/commands/georadiusbymember)
    public func georadiusbymember<T: FromRedisValue>(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberUnit,
        _ count: GeoradiusbymemberCount? = nil, _ order: GeoradiusbymemberOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusbymemberOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEORADIUSBYMEMBER").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            (STORE != nil) ? "STORE" : nil
        ).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST).arg(options)
        return try await cmd.query(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a member
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER](https://redis.io/commands/georadiusbymember)
    public func georadiusbymember(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberUnit,
        _ count: GeoradiusbymemberCount? = nil, _ order: GeoradiusbymemberOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusbymemberOptions? = nil
    ) async throws {
        let cmd = Cmd("GEORADIUSBYMEMBER").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            (STORE != nil) ? "STORE" : nil
        ).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST).arg(options)
        try await cmd.exec(self)
    }
    /// A read-only variant for GEORADIUSBYMEMBER
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER_RO](https://redis.io/commands/georadiusbymember-ro)
    public func georadiusbymember_ro<T: FromRedisValue>(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberRoUnit,
        _ count: GeoradiusbymemberRoCount? = nil, _ order: GeoradiusbymemberRoOrder? = nil,
        _ options: GeoradiusbymemberRoOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEORADIUSBYMEMBER_RO").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            options)
        return try await cmd.query(self)
    }
    /// A read-only variant for GEORADIUSBYMEMBER
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER_RO](https://redis.io/commands/georadiusbymember-ro)
    public func georadiusbymember_ro(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberRoUnit,
        _ count: GeoradiusbymemberRoCount? = nil, _ order: GeoradiusbymemberRoOrder? = nil,
        _ options: GeoradiusbymemberRoOptions? = nil
    ) async throws {
        let cmd = Cmd("GEORADIUSBYMEMBER_RO").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            options)
        try await cmd.exec(self)
    }
    /// A read-only variant for GEORADIUS
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// ## Documentation
    /// view the docs for [GEORADIUS_RO](https://redis.io/commands/georadius-ro)
    public func georadius_ro<T: FromRedisValue>(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusRoUnit,
        _ count: GeoradiusRoCount? = nil, _ order: GeoradiusRoOrder? = nil, _ options: GeoradiusRoOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEORADIUS_RO").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg(options)
        return try await cmd.query(self)
    }
    /// A read-only variant for GEORADIUS
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// ## Documentation
    /// view the docs for [GEORADIUS_RO](https://redis.io/commands/georadius-ro)
    public func georadius_ro(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusRoUnit,
        _ count: GeoradiusRoCount? = nil, _ order: GeoradiusRoOrder? = nil, _ options: GeoradiusRoOptions? = nil
    ) async throws {
        let cmd = Cmd("GEORADIUS_RO").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg(options)
        try await cmd.exec(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCH](https://redis.io/commands/geosearch)
    public func geosearch<T: FromRedisValue>(
        _ key: String, _ from: GeosearchFrom, _ by: GeosearchBy, _ order: GeosearchOrder? = nil,
        _ count: GeosearchCount? = nil, _ options: GeosearchOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEOSEARCH").arg(key).arg(from).arg(by).arg(order).arg(count).arg(options)
        return try await cmd.query(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCH](https://redis.io/commands/geosearch)
    public func geosearch(
        _ key: String, _ from: GeosearchFrom, _ by: GeosearchBy, _ order: GeosearchOrder? = nil,
        _ count: GeosearchCount? = nil, _ options: GeosearchOptions? = nil
    ) async throws {
        let cmd = Cmd("GEOSEARCH").arg(key).arg(from).arg(by).arg(order).arg(count).arg(options)
        try await cmd.exec(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle, and store the result in another key.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCHSTORE](https://redis.io/commands/geosearchstore)
    public func geosearchstore<T: FromRedisValue>(
        _ destination: String, _ source: String, _ from: GeosearchstoreFrom, _ by: GeosearchstoreBy,
        _ order: GeosearchstoreOrder? = nil, _ count: GeosearchstoreCount? = nil,
        _ options: GeosearchstoreOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("GEOSEARCHSTORE").arg(destination).arg(source).arg(from).arg(by).arg(order).arg(count).arg(
            options)
        return try await cmd.query(self)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle, and store the result in another key.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCHSTORE](https://redis.io/commands/geosearchstore)
    public func geosearchstore(
        _ destination: String, _ source: String, _ from: GeosearchstoreFrom, _ by: GeosearchstoreBy,
        _ order: GeosearchstoreOrder? = nil, _ count: GeosearchstoreCount? = nil,
        _ options: GeosearchstoreOptions? = nil
    ) async throws {
        let cmd = Cmd("GEOSEARCHSTORE").arg(destination).arg(source).arg(from).arg(by).arg(order).arg(count).arg(
            options)
        try await cmd.exec(self)
    }
    /// Get the value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GET](https://redis.io/commands/get)
    public func get<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("GET").arg(key)
        return try await cmd.query(self)
    }
    /// Get the value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GET](https://redis.io/commands/get)
    public func get(_ key: String) async throws {
        let cmd = Cmd("GET").arg(key)
        try await cmd.exec(self)
    }
    /// Returns the bit value at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETBIT](https://redis.io/commands/getbit)
    public func getbit<T: FromRedisValue>(_ key: String, _ offset: Int) async throws -> T {
        let cmd = Cmd("GETBIT").arg(key).arg(offset)
        return try await cmd.query(self)
    }
    /// Returns the bit value at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETBIT](https://redis.io/commands/getbit)
    public func getbit(_ key: String, _ offset: Int) async throws {
        let cmd = Cmd("GETBIT").arg(key).arg(offset)
        try await cmd.exec(self)
    }
    /// Get the value of a key and delete the key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETDEL](https://redis.io/commands/getdel)
    public func getdel<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("GETDEL").arg(key)
        return try await cmd.query(self)
    }
    /// Get the value of a key and delete the key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETDEL](https://redis.io/commands/getdel)
    public func getdel(_ key: String) async throws {
        let cmd = Cmd("GETDEL").arg(key)
        try await cmd.exec(self)
    }
    /// Get the value of a key and optionally set its expiration
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETEX](https://redis.io/commands/getex)
    public func getex<T: FromRedisValue>(_ key: String, _ expiration: GetexExpiration? = nil) async throws -> T {
        let cmd = Cmd("GETEX").arg(key).arg(expiration)
        return try await cmd.query(self)
    }
    /// Get the value of a key and optionally set its expiration
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETEX](https://redis.io/commands/getex)
    public func getex(_ key: String, _ expiration: GetexExpiration? = nil) async throws {
        let cmd = Cmd("GETEX").arg(key).arg(expiration)
        try await cmd.exec(self)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [GETRANGE](https://redis.io/commands/getrange)
    public func getrange<T: FromRedisValue>(_ key: String, _ start: Int, _ end: Int) async throws -> T {
        let cmd = Cmd("GETRANGE").arg(key).arg(start).arg(end)
        return try await cmd.query(self)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [GETRANGE](https://redis.io/commands/getrange)
    public func getrange(_ key: String, _ start: Int, _ end: Int) async throws {
        let cmd = Cmd("GETRANGE").arg(key).arg(start).arg(end)
        try await cmd.exec(self)
    }
    /// Set the string value of a key and return its old value
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETSET](https://redis.io/commands/getset)
    public func getset<T: FromRedisValue>(_ key: String, _ value: String) async throws -> T {
        let cmd = Cmd("GETSET").arg(key).arg(value)
        return try await cmd.query(self)
    }
    /// Set the string value of a key and return its old value
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETSET](https://redis.io/commands/getset)
    public func getset(_ key: String, _ value: String) async throws {
        let cmd = Cmd("GETSET").arg(key).arg(value)
        try await cmd.exec(self)
    }
    /// Delete one or more hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `field` arguments.
    /// ## Documentation
    /// view the docs for [HDEL](https://redis.io/commands/hdel)
    public func hdel<T: FromRedisValue>(_ key: String, _ field: String...) async throws -> T {
        let cmd = Cmd("HDEL").arg(key).arg(field)
        return try await cmd.query(self)
    }
    /// Delete one or more hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `field` arguments.
    /// ## Documentation
    /// view the docs for [HDEL](https://redis.io/commands/hdel)
    public func hdel(_ key: String, _ field: String...) async throws {
        let cmd = Cmd("HDEL").arg(key).arg(field)
        try await cmd.exec(self)
    }
    /// Handshake with Redis
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `protover` made optional; when called without arguments the command reports the current connection's context.
    /// ## Documentation
    /// view the docs for [HELLO](https://redis.io/commands/hello)
    public func hello<T: FromRedisValue>(_ arguments: HelloArguments? = nil) async throws -> T {
        let cmd = Cmd("HELLO").arg(arguments)
        return try await cmd.query(self)
    }
    /// Handshake with Redis
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `protover` made optional; when called without arguments the command reports the current connection's context.
    /// ## Documentation
    /// view the docs for [HELLO](https://redis.io/commands/hello)
    public func hello(_ arguments: HelloArguments? = nil) async throws {
        let cmd = Cmd("HELLO").arg(arguments)
        try await cmd.exec(self)
    }
    /// Determine if a hash field exists
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HEXISTS](https://redis.io/commands/hexists)
    public func hexists<T: FromRedisValue>(_ key: String, _ field: String) async throws -> T {
        let cmd = Cmd("HEXISTS").arg(key).arg(field)
        return try await cmd.query(self)
    }
    /// Determine if a hash field exists
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HEXISTS](https://redis.io/commands/hexists)
    public func hexists(_ key: String, _ field: String) async throws {
        let cmd = Cmd("HEXISTS").arg(key).arg(field)
        try await cmd.exec(self)
    }
    /// Get the value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HGET](https://redis.io/commands/hget)
    public func hget<T: FromRedisValue>(_ key: String, _ field: String) async throws -> T {
        let cmd = Cmd("HGET").arg(key).arg(field)
        return try await cmd.query(self)
    }
    /// Get the value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HGET](https://redis.io/commands/hget)
    public func hget(_ key: String, _ field: String) async throws {
        let cmd = Cmd("HGET").arg(key).arg(field)
        try await cmd.exec(self)
    }
    /// Get all the fields and values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HGETALL](https://redis.io/commands/hgetall)
    public func hgetall<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("HGETALL").arg(key)
        return try await cmd.query(self)
    }
    /// Get all the fields and values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HGETALL](https://redis.io/commands/hgetall)
    public func hgetall(_ key: String) async throws {
        let cmd = Cmd("HGETALL").arg(key)
        try await cmd.exec(self)
    }
    /// Increment the integer value of a hash field by the given number
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBY](https://redis.io/commands/hincrby)
    public func hincrby<T: FromRedisValue>(_ key: String, _ field: String, _ increment: Int) async throws -> T {
        let cmd = Cmd("HINCRBY").arg(key).arg(field).arg(increment)
        return try await cmd.query(self)
    }
    /// Increment the integer value of a hash field by the given number
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBY](https://redis.io/commands/hincrby)
    public func hincrby(_ key: String, _ field: String, _ increment: Int) async throws {
        let cmd = Cmd("HINCRBY").arg(key).arg(field).arg(increment)
        try await cmd.exec(self)
    }
    /// Increment the float value of a hash field by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBYFLOAT](https://redis.io/commands/hincrbyfloat)
    public func hincrbyfloat<T: FromRedisValue>(_ key: String, _ field: String, _ increment: Double) async throws -> T {
        let cmd = Cmd("HINCRBYFLOAT").arg(key).arg(field).arg(increment)
        return try await cmd.query(self)
    }
    /// Increment the float value of a hash field by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBYFLOAT](https://redis.io/commands/hincrbyfloat)
    public func hincrbyfloat(_ key: String, _ field: String, _ increment: Double) async throws {
        let cmd = Cmd("HINCRBYFLOAT").arg(key).arg(field).arg(increment)
        try await cmd.exec(self)
    }
    /// Get all the fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HKEYS](https://redis.io/commands/hkeys)
    public func hkeys<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("HKEYS").arg(key)
        return try await cmd.query(self)
    }
    /// Get all the fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HKEYS](https://redis.io/commands/hkeys)
    public func hkeys(_ key: String) async throws {
        let cmd = Cmd("HKEYS").arg(key)
        try await cmd.exec(self)
    }
    /// Get the number of fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HLEN](https://redis.io/commands/hlen)
    public func hlen<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("HLEN").arg(key)
        return try await cmd.query(self)
    }
    /// Get the number of fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HLEN](https://redis.io/commands/hlen)
    public func hlen(_ key: String) async throws {
        let cmd = Cmd("HLEN").arg(key)
        try await cmd.exec(self)
    }
    /// Get the values of all the given hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being requested.
    /// ## Documentation
    /// view the docs for [HMGET](https://redis.io/commands/hmget)
    public func hmget<T: FromRedisValue>(_ key: String, _ field: String...) async throws -> T {
        let cmd = Cmd("HMGET").arg(key).arg(field)
        return try await cmd.query(self)
    }
    /// Get the values of all the given hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being requested.
    /// ## Documentation
    /// view the docs for [HMGET](https://redis.io/commands/hmget)
    public func hmget(_ key: String, _ field: String...) async throws {
        let cmd = Cmd("HMGET").arg(key).arg(field)
        try await cmd.exec(self)
    }
    /// Set multiple hash fields to multiple values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being set.
    /// ## Documentation
    /// view the docs for [HMSET](https://redis.io/commands/hmset)
    public func hmset<T: FromRedisValue>(_ key: String, _ fieldValue: HmsetFieldvalue...) async throws -> T {
        let cmd = Cmd("HMSET").arg(key).arg(fieldValue)
        return try await cmd.query(self)
    }
    /// Set multiple hash fields to multiple values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being set.
    /// ## Documentation
    /// view the docs for [HMSET](https://redis.io/commands/hmset)
    public func hmset(_ key: String, _ fieldValue: HmsetFieldvalue...) async throws {
        let cmd = Cmd("HMSET").arg(key).arg(fieldValue)
        try await cmd.exec(self)
    }
    /// Get one or multiple random fields from a hash
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of fields returned
    /// ## Documentation
    /// view the docs for [HRANDFIELD](https://redis.io/commands/hrandfield)
    public func hrandfield<T: FromRedisValue>(_ key: String, _ options: HrandfieldOptions? = nil) async throws -> T {
        let cmd = Cmd("HRANDFIELD").arg(key).arg(options)
        return try await cmd.query(self)
    }
    /// Get one or multiple random fields from a hash
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of fields returned
    /// ## Documentation
    /// view the docs for [HRANDFIELD](https://redis.io/commands/hrandfield)
    public func hrandfield(_ key: String, _ options: HrandfieldOptions? = nil) async throws {
        let cmd = Cmd("HRANDFIELD").arg(key).arg(options)
        try await cmd.exec(self)
    }
    /// Incrementally iterate hash fields and associated values
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [HSCAN](https://redis.io/commands/hscan)
    public func hscan<T: FromRedisValue>(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("HSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return try await cmd.query(self)
    }
    /// Incrementally iterate hash fields and associated values
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [HSCAN](https://redis.io/commands/hscan)
    public func hscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) async throws {
        let cmd = Cmd("HSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        try await cmd.exec(self)
    }
    /// Set the string value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1) for each field/value pair added, so O(N) to add N field/value pairs when the command is called with multiple field/value pairs.
    /// ## History
    /// - 4.0.0, Accepts multiple `field` and `value` arguments.
    /// ## Documentation
    /// view the docs for [HSET](https://redis.io/commands/hset)
    public func hset<T: FromRedisValue>(_ key: String, _ fieldValue: HsetFieldvalue...) async throws -> T {
        let cmd = Cmd("HSET").arg(key).arg(fieldValue)
        return try await cmd.query(self)
    }
    /// Set the string value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1) for each field/value pair added, so O(N) to add N field/value pairs when the command is called with multiple field/value pairs.
    /// ## History
    /// - 4.0.0, Accepts multiple `field` and `value` arguments.
    /// ## Documentation
    /// view the docs for [HSET](https://redis.io/commands/hset)
    public func hset(_ key: String, _ fieldValue: HsetFieldvalue...) async throws {
        let cmd = Cmd("HSET").arg(key).arg(fieldValue)
        try await cmd.exec(self)
    }
    /// Set the value of a hash field, only if the field does not exist
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSETNX](https://redis.io/commands/hsetnx)
    public func hsetnx<T: FromRedisValue>(_ key: String, _ field: String, _ value: String) async throws -> T {
        let cmd = Cmd("HSETNX").arg(key).arg(field).arg(value)
        return try await cmd.query(self)
    }
    /// Set the value of a hash field, only if the field does not exist
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSETNX](https://redis.io/commands/hsetnx)
    public func hsetnx(_ key: String, _ field: String, _ value: String) async throws {
        let cmd = Cmd("HSETNX").arg(key).arg(field).arg(value)
        try await cmd.exec(self)
    }
    /// Get the length of the value of a hash field
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSTRLEN](https://redis.io/commands/hstrlen)
    public func hstrlen<T: FromRedisValue>(_ key: String, _ field: String) async throws -> T {
        let cmd = Cmd("HSTRLEN").arg(key).arg(field)
        return try await cmd.query(self)
    }
    /// Get the length of the value of a hash field
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSTRLEN](https://redis.io/commands/hstrlen)
    public func hstrlen(_ key: String, _ field: String) async throws {
        let cmd = Cmd("HSTRLEN").arg(key).arg(field)
        try await cmd.exec(self)
    }
    /// Get all the values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HVALS](https://redis.io/commands/hvals)
    public func hvals<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("HVALS").arg(key)
        return try await cmd.query(self)
    }
    /// Get all the values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HVALS](https://redis.io/commands/hvals)
    public func hvals(_ key: String) async throws {
        let cmd = Cmd("HVALS").arg(key)
        try await cmd.exec(self)
    }
    /// Increment the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCR](https://redis.io/commands/incr)
    public func incr<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("INCR").arg(key)
        return try await cmd.query(self)
    }
    /// Increment the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCR](https://redis.io/commands/incr)
    public func incr(_ key: String) async throws {
        let cmd = Cmd("INCR").arg(key)
        try await cmd.exec(self)
    }
    /// Increment the integer value of a key by the given amount
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBY](https://redis.io/commands/incrby)
    public func incrby<T: FromRedisValue>(_ key: String, _ increment: Int) async throws -> T {
        let cmd = Cmd("INCRBY").arg(key).arg(increment)
        return try await cmd.query(self)
    }
    /// Increment the integer value of a key by the given amount
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBY](https://redis.io/commands/incrby)
    public func incrby(_ key: String, _ increment: Int) async throws {
        let cmd = Cmd("INCRBY").arg(key).arg(increment)
        try await cmd.exec(self)
    }
    /// Increment the float value of a key by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBYFLOAT](https://redis.io/commands/incrbyfloat)
    public func incrbyfloat<T: FromRedisValue>(_ key: String, _ increment: Double) async throws -> T {
        let cmd = Cmd("INCRBYFLOAT").arg(key).arg(increment)
        return try await cmd.query(self)
    }
    /// Increment the float value of a key by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBYFLOAT](https://redis.io/commands/incrbyfloat)
    public func incrbyfloat(_ key: String, _ increment: Double) async throws {
        let cmd = Cmd("INCRBYFLOAT").arg(key).arg(increment)
        try await cmd.exec(self)
    }
    /// Get information and statistics about the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added support for taking multiple section arguments.
    /// ## Documentation
    /// view the docs for [INFO](https://redis.io/commands/info)
    public func info<T: FromRedisValue>(_ section: String...) async throws -> T {
        let cmd = Cmd("INFO").arg(section)
        return try await cmd.query(self)
    }
    /// Get information and statistics about the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added support for taking multiple section arguments.
    /// ## Documentation
    /// view the docs for [INFO](https://redis.io/commands/info)
    public func info(_ section: String...) async throws {
        let cmd = Cmd("INFO").arg(section)
        try await cmd.exec(self)
    }
    /// Find all keys matching the given pattern
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) with N being the number of keys in the database, under the assumption that the key names in the database and the given pattern have limited length.
    /// ## Documentation
    /// view the docs for [KEYS](https://redis.io/commands/keys)
    public func keys<T: FromRedisValue>(_ pattern: String) async throws -> T {
        let cmd = Cmd("KEYS").arg(pattern)
        return try await cmd.query(self)
    }
    /// Find all keys matching the given pattern
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) with N being the number of keys in the database, under the assumption that the key names in the database and the given pattern have limited length.
    /// ## Documentation
    /// view the docs for [KEYS](https://redis.io/commands/keys)
    public func keys(_ pattern: String) async throws {
        let cmd = Cmd("KEYS").arg(pattern)
        try await cmd.exec(self)
    }
    /// Get the UNIX time stamp of the last successful save to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LASTSAVE](https://redis.io/commands/lastsave)
    public func lastsave<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("LASTSAVE")
        return try await cmd.query(self)
    }
    /// Get the UNIX time stamp of the last successful save to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LASTSAVE](https://redis.io/commands/lastsave)
    public func lastsave() async throws {
        let cmd = Cmd("LASTSAVE")
        try await cmd.exec(self)
    }
    /// A container for latency diagnostics commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [LATENCY](https://redis.io/commands/latency)
    public func latency<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("LATENCY")
        return try await cmd.query(self)
    }
    /// A container for latency diagnostics commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [LATENCY](https://redis.io/commands/latency)
    public func latency() async throws {
        let cmd = Cmd("LATENCY")
        try await cmd.exec(self)
    }
    /// Find longest common substring
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) where N and M are the lengths of s1 and s2, respectively
    /// ## Documentation
    /// view the docs for [LCS](https://redis.io/commands/lcs)
    public func lcs<T: FromRedisValue>(
        _ key1: String, _ key2: String, _ MINMATCHLEN: Int? = nil, _ options: LcsOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("LCS").arg(key1).arg(key2).arg((MINMATCHLEN != nil) ? "MINMATCHLEN" : nil).arg(MINMATCHLEN).arg(
            options)
        return try await cmd.query(self)
    }
    /// Find longest common substring
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) where N and M are the lengths of s1 and s2, respectively
    /// ## Documentation
    /// view the docs for [LCS](https://redis.io/commands/lcs)
    public func lcs(_ key1: String, _ key2: String, _ MINMATCHLEN: Int? = nil, _ options: LcsOptions? = nil)
        async throws
    {
        let cmd = Cmd("LCS").arg(key1).arg(key2).arg((MINMATCHLEN != nil) ? "MINMATCHLEN" : nil).arg(MINMATCHLEN).arg(
            options)
        try await cmd.exec(self)
    }
    /// Get an element from a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse to get to the element at index. This makes asking for the first or the last element of the list O(1).
    /// ## Documentation
    /// view the docs for [LINDEX](https://redis.io/commands/lindex)
    public func lindex<T: FromRedisValue>(_ key: String, _ index: Int) async throws -> T {
        let cmd = Cmd("LINDEX").arg(key).arg(index)
        return try await cmd.query(self)
    }
    /// Get an element from a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse to get to the element at index. This makes asking for the first or the last element of the list O(1).
    /// ## Documentation
    /// view the docs for [LINDEX](https://redis.io/commands/lindex)
    public func lindex(_ key: String, _ index: Int) async throws {
        let cmd = Cmd("LINDEX").arg(key).arg(index)
        try await cmd.exec(self)
    }
    /// Insert an element before or after another element in a list
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse before seeing the value pivot. This means that inserting somewhere on the left end on the list (head) can be considered O(1) and inserting somewhere on the right end (tail) is O(N).
    /// ## Documentation
    /// view the docs for [LINSERT](https://redis.io/commands/linsert)
    public func linsert<T: FromRedisValue>(_ key: String, _ rWhere: LinsertRwhere, _ pivot: String, _ element: String)
        async throws -> T
    {
        let cmd = Cmd("LINSERT").arg(key).arg(rWhere).arg(pivot).arg(element)
        return try await cmd.query(self)
    }
    /// Insert an element before or after another element in a list
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse before seeing the value pivot. This means that inserting somewhere on the left end on the list (head) can be considered O(1) and inserting somewhere on the right end (tail) is O(N).
    /// ## Documentation
    /// view the docs for [LINSERT](https://redis.io/commands/linsert)
    public func linsert(_ key: String, _ rWhere: LinsertRwhere, _ pivot: String, _ element: String) async throws {
        let cmd = Cmd("LINSERT").arg(key).arg(rWhere).arg(pivot).arg(element)
        try await cmd.exec(self)
    }
    /// Get the length of a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LLEN](https://redis.io/commands/llen)
    public func llen<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("LLEN").arg(key)
        return try await cmd.query(self)
    }
    /// Get the length of a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LLEN](https://redis.io/commands/llen)
    public func llen(_ key: String) async throws {
        let cmd = Cmd("LLEN").arg(key)
        try await cmd.exec(self)
    }
    /// Pop an element from a list, push it to another list and return it
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LMOVE](https://redis.io/commands/lmove)
    public func lmove<T: FromRedisValue>(
        _ source: String, _ destination: String, _ wherefrom: LmoveWherefrom, _ whereto: LmoveWhereto
    ) async throws -> T {
        let cmd = Cmd("LMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto)
        return try await cmd.query(self)
    }
    /// Pop an element from a list, push it to another list and return it
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LMOVE](https://redis.io/commands/lmove)
    public func lmove(_ source: String, _ destination: String, _ wherefrom: LmoveWherefrom, _ whereto: LmoveWhereto)
        async throws
    {
        let cmd = Cmd("LMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto)
        try await cmd.exec(self)
    }
    /// Pop elements from a list
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [LMPOP](https://redis.io/commands/lmpop)
    public func lmpop<T: FromRedisValue>(_ numkeys: Int, _ key: String..., rWhere: LmpopRwhere, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("LMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        return try await cmd.query(self)
    }
    /// Pop elements from a list
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [LMPOP](https://redis.io/commands/lmpop)
    public func lmpop(_ numkeys: Int, _ key: String..., rWhere: LmpopRwhere, _ count: Int? = nil) async throws {
        let cmd = Cmd("LMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        try await cmd.exec(self)
    }
    /// Display some computer art and the Redis version
    /// ## Available since
    /// 5.0.0
    /// ## Documentation
    /// view the docs for [LOLWUT](https://redis.io/commands/lolwut)
    public func lolwut<T: FromRedisValue>(_ version: Int? = nil) async throws -> T {
        let cmd = Cmd("LOLWUT").arg((version != nil) ? "VERSION" : nil).arg(version)
        return try await cmd.query(self)
    }
    /// Display some computer art and the Redis version
    /// ## Available since
    /// 5.0.0
    /// ## Documentation
    /// view the docs for [LOLWUT](https://redis.io/commands/lolwut)
    public func lolwut(_ version: Int? = nil) async throws {
        let cmd = Cmd("LOLWUT").arg((version != nil) ? "VERSION" : nil).arg(version)
        try await cmd.exec(self)
    }
    /// Remove and get the first elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [LPOP](https://redis.io/commands/lpop)
    public func lpop<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("LPOP").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and get the first elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [LPOP](https://redis.io/commands/lpop)
    public func lpop(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("LPOP").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Return the index of matching elements on a list
    /// ## Available since
    /// 6.0.6
    /// ## Time complexity
    /// O(N) where N is the number of elements in the list, for the average case. When searching for elements near the head or the tail of the list, or when the MAXLEN option is provided, the command may run in constant time.
    /// ## Documentation
    /// view the docs for [LPOS](https://redis.io/commands/lpos)
    public func lpos<T: FromRedisValue>(
        _ key: String, _ element: String, _ rank: Int? = nil, _ numMatches: Int? = nil, _ len: Int? = nil
    ) async throws -> T {
        let cmd = Cmd("LPOS").arg(key).arg(element).arg((rank != nil) ? "RANK" : nil).arg(rank).arg(
            (numMatches != nil) ? "COUNT" : nil
        ).arg(numMatches).arg((len != nil) ? "MAXLEN" : nil).arg(len)
        return try await cmd.query(self)
    }
    /// Return the index of matching elements on a list
    /// ## Available since
    /// 6.0.6
    /// ## Time complexity
    /// O(N) where N is the number of elements in the list, for the average case. When searching for elements near the head or the tail of the list, or when the MAXLEN option is provided, the command may run in constant time.
    /// ## Documentation
    /// view the docs for [LPOS](https://redis.io/commands/lpos)
    public func lpos(_ key: String, _ element: String, _ rank: Int? = nil, _ numMatches: Int? = nil, _ len: Int? = nil)
        async throws
    {
        let cmd = Cmd("LPOS").arg(key).arg(element).arg((rank != nil) ? "RANK" : nil).arg(rank).arg(
            (numMatches != nil) ? "COUNT" : nil
        ).arg(numMatches).arg((len != nil) ? "MAXLEN" : nil).arg(len)
        try await cmd.exec(self)
    }
    /// Prepend one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSH](https://redis.io/commands/lpush)
    public func lpush<T: FromRedisValue>(_ key: String, _ element: String...) async throws -> T {
        let cmd = Cmd("LPUSH").arg(key).arg(element)
        return try await cmd.query(self)
    }
    /// Prepend one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSH](https://redis.io/commands/lpush)
    public func lpush(_ key: String, _ element: String...) async throws {
        let cmd = Cmd("LPUSH").arg(key).arg(element)
        try await cmd.exec(self)
    }
    /// Prepend an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSHX](https://redis.io/commands/lpushx)
    public func lpushx<T: FromRedisValue>(_ key: String, _ element: String...) async throws -> T {
        let cmd = Cmd("LPUSHX").arg(key).arg(element)
        return try await cmd.query(self)
    }
    /// Prepend an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSHX](https://redis.io/commands/lpushx)
    public func lpushx(_ key: String, _ element: String...) async throws {
        let cmd = Cmd("LPUSHX").arg(key).arg(element)
        try await cmd.exec(self)
    }
    /// Get a range of elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(S+N) where S is the distance of start offset from HEAD for small lists, from nearest end (HEAD or TAIL) for large lists; and N is the number of elements in the specified range.
    /// ## Documentation
    /// view the docs for [LRANGE](https://redis.io/commands/lrange)
    public func lrange<T: FromRedisValue>(_ key: String, _ start: Int, _ stop: Int) async throws -> T {
        let cmd = Cmd("LRANGE").arg(key).arg(start).arg(stop)
        return try await cmd.query(self)
    }
    /// Get a range of elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(S+N) where S is the distance of start offset from HEAD for small lists, from nearest end (HEAD or TAIL) for large lists; and N is the number of elements in the specified range.
    /// ## Documentation
    /// view the docs for [LRANGE](https://redis.io/commands/lrange)
    public func lrange(_ key: String, _ start: Int, _ stop: Int) async throws {
        let cmd = Cmd("LRANGE").arg(key).arg(start).arg(stop)
        try await cmd.exec(self)
    }
    /// Remove elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M) where N is the length of the list and M is the number of elements removed.
    /// ## Documentation
    /// view the docs for [LREM](https://redis.io/commands/lrem)
    public func lrem<T: FromRedisValue>(_ key: String, _ count: Int, _ element: String) async throws -> T {
        let cmd = Cmd("LREM").arg(key).arg(count).arg(element)
        return try await cmd.query(self)
    }
    /// Remove elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M) where N is the length of the list and M is the number of elements removed.
    /// ## Documentation
    /// view the docs for [LREM](https://redis.io/commands/lrem)
    public func lrem(_ key: String, _ count: Int, _ element: String) async throws {
        let cmd = Cmd("LREM").arg(key).arg(count).arg(element)
        try await cmd.exec(self)
    }
    /// Set the value of an element in a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the list. Setting either the first or the last element of the list is O(1).
    /// ## Documentation
    /// view the docs for [LSET](https://redis.io/commands/lset)
    public func lset<T: FromRedisValue>(_ key: String, _ index: Int, _ element: String) async throws -> T {
        let cmd = Cmd("LSET").arg(key).arg(index).arg(element)
        return try await cmd.query(self)
    }
    /// Set the value of an element in a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the list. Setting either the first or the last element of the list is O(1).
    /// ## Documentation
    /// view the docs for [LSET](https://redis.io/commands/lset)
    public func lset(_ key: String, _ index: Int, _ element: String) async throws {
        let cmd = Cmd("LSET").arg(key).arg(index).arg(element)
        try await cmd.exec(self)
    }
    /// Trim a list to the specified range
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to be removed by the operation.
    /// ## Documentation
    /// view the docs for [LTRIM](https://redis.io/commands/ltrim)
    public func ltrim<T: FromRedisValue>(_ key: String, _ start: Int, _ stop: Int) async throws -> T {
        let cmd = Cmd("LTRIM").arg(key).arg(start).arg(stop)
        return try await cmd.query(self)
    }
    /// Trim a list to the specified range
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to be removed by the operation.
    /// ## Documentation
    /// view the docs for [LTRIM](https://redis.io/commands/ltrim)
    public func ltrim(_ key: String, _ start: Int, _ stop: Int) async throws {
        let cmd = Cmd("LTRIM").arg(key).arg(start).arg(stop)
        try await cmd.exec(self)
    }
    /// A container for memory diagnostics commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MEMORY](https://redis.io/commands/memory)
    public func memory<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MEMORY")
        return try await cmd.query(self)
    }
    /// A container for memory diagnostics commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MEMORY](https://redis.io/commands/memory)
    public func memory() async throws {
        let cmd = Cmd("MEMORY")
        try await cmd.exec(self)
    }
    /// Get the values of all the given keys
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to retrieve.
    /// ## Documentation
    /// view the docs for [MGET](https://redis.io/commands/mget)
    public func mget<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("MGET").arg(key)
        return try await cmd.query(self)
    }
    /// Get the values of all the given keys
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to retrieve.
    /// ## Documentation
    /// view the docs for [MGET](https://redis.io/commands/mget)
    public func mget(_ key: String...) async throws {
        let cmd = Cmd("MGET").arg(key)
        try await cmd.exec(self)
    }
    /// Atomically transfer a key from a Redis instance to another one.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// This command actually executes a DUMP+DEL in the source instance, and a RESTORE in the target instance. See the pages of these commands for time complexity. Also an O(N) data transfer between the two instances is performed.
    /// ## History
    /// - 3.0.0, Added the `COPY` and `REPLACE` options.
    /// - 3.0.6, Added the `KEYS` option.
    /// - 4.0.7, Added the `AUTH` option.
    /// - 6.0.0, Added the `AUTH2` option.
    /// ## Documentation
    /// view the docs for [MIGRATE](https://redis.io/commands/migrate)
    public func migrate<T: FromRedisValue>(
        _ host: String, _ port: Int, _ keyOrEmptyString: MigrateKeyoremptystring, _ destinationDb: Int, _ timeout: Int,
        _ authentication: MigrateAuthentication? = nil, _ key: String..., options: MigrateOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("MIGRATE").arg(host).arg(port).arg(keyOrEmptyString).arg(destinationDb).arg(timeout).arg(
            authentication
        ).arg((!key.isEmpty) ? "KEYS" : nil).arg(key).arg(options)
        return try await cmd.query(self)
    }
    /// Atomically transfer a key from a Redis instance to another one.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// This command actually executes a DUMP+DEL in the source instance, and a RESTORE in the target instance. See the pages of these commands for time complexity. Also an O(N) data transfer between the two instances is performed.
    /// ## History
    /// - 3.0.0, Added the `COPY` and `REPLACE` options.
    /// - 3.0.6, Added the `KEYS` option.
    /// - 4.0.7, Added the `AUTH` option.
    /// - 6.0.0, Added the `AUTH2` option.
    /// ## Documentation
    /// view the docs for [MIGRATE](https://redis.io/commands/migrate)
    public func migrate(
        _ host: String, _ port: Int, _ keyOrEmptyString: MigrateKeyoremptystring, _ destinationDb: Int, _ timeout: Int,
        _ authentication: MigrateAuthentication? = nil, _ key: String..., options: MigrateOptions? = nil
    ) async throws {
        let cmd = Cmd("MIGRATE").arg(host).arg(port).arg(keyOrEmptyString).arg(destinationDb).arg(timeout).arg(
            authentication
        ).arg((!key.isEmpty) ? "KEYS" : nil).arg(key).arg(options)
        try await cmd.exec(self)
    }
    /// A container for module commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MODULE](https://redis.io/commands/module)
    public func module<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MODULE")
        return try await cmd.query(self)
    }
    /// A container for module commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MODULE](https://redis.io/commands/module)
    public func module() async throws {
        let cmd = Cmd("MODULE")
        try await cmd.exec(self)
    }
    /// Listen for all requests received by the server in real time
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [MONITOR](https://redis.io/commands/monitor)
    public func monitor<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MONITOR")
        return try await cmd.query(self)
    }
    /// Listen for all requests received by the server in real time
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [MONITOR](https://redis.io/commands/monitor)
    public func monitor() async throws {
        let cmd = Cmd("MONITOR")
        try await cmd.exec(self)
    }
    /// Move a key to another database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MOVE](https://redis.io/commands/move)
    public func move<T: FromRedisValue>(_ key: String, _ db: Int) async throws -> T {
        let cmd = Cmd("MOVE").arg(key).arg(db)
        return try await cmd.query(self)
    }
    /// Move a key to another database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MOVE](https://redis.io/commands/move)
    public func move(_ key: String, _ db: Int) async throws {
        let cmd = Cmd("MOVE").arg(key).arg(db)
        try await cmd.exec(self)
    }
    /// Set multiple keys to multiple values
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSET](https://redis.io/commands/mset)
    public func mset<T: FromRedisValue>(_ keyValue: MsetKeyvalue...) async throws -> T {
        let cmd = Cmd("MSET").arg(keyValue)
        return try await cmd.query(self)
    }
    /// Set multiple keys to multiple values
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSET](https://redis.io/commands/mset)
    public func mset(_ keyValue: MsetKeyvalue...) async throws {
        let cmd = Cmd("MSET").arg(keyValue)
        try await cmd.exec(self)
    }
    /// Set multiple keys to multiple values, only if none of the keys exist
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSETNX](https://redis.io/commands/msetnx)
    public func msetnx<T: FromRedisValue>(_ keyValue: MsetnxKeyvalue...) async throws -> T {
        let cmd = Cmd("MSETNX").arg(keyValue)
        return try await cmd.query(self)
    }
    /// Set multiple keys to multiple values, only if none of the keys exist
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSETNX](https://redis.io/commands/msetnx)
    public func msetnx(_ keyValue: MsetnxKeyvalue...) async throws {
        let cmd = Cmd("MSETNX").arg(keyValue)
        try await cmd.exec(self)
    }
    /// Mark the start of a transaction block
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MULTI](https://redis.io/commands/multi)
    public func multi<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("MULTI")
        return try await cmd.query(self)
    }
    /// Mark the start of a transaction block
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MULTI](https://redis.io/commands/multi)
    public func multi() async throws {
        let cmd = Cmd("MULTI")
        try await cmd.exec(self)
    }
    /// A container for object introspection commands
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [OBJECT](https://redis.io/commands/object)
    public func object<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("OBJECT")
        return try await cmd.query(self)
    }
    /// A container for object introspection commands
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [OBJECT](https://redis.io/commands/object)
    public func object() async throws {
        let cmd = Cmd("OBJECT")
        try await cmd.exec(self)
    }
    /// Remove the expiration from a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PERSIST](https://redis.io/commands/persist)
    public func persist<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("PERSIST").arg(key)
        return try await cmd.query(self)
    }
    /// Remove the expiration from a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PERSIST](https://redis.io/commands/persist)
    public func persist(_ key: String) async throws {
        let cmd = Cmd("PERSIST").arg(key)
        try await cmd.exec(self)
    }
    /// Set a key's time to live in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIRE](https://redis.io/commands/pexpire)
    public func pexpire<T: FromRedisValue>(_ key: String, _ milliseconds: Int, _ condition: PexpireCondition? = nil)
        async throws -> T
    {
        let cmd = Cmd("PEXPIRE").arg(key).arg(milliseconds).arg(condition)
        return try await cmd.query(self)
    }
    /// Set a key's time to live in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIRE](https://redis.io/commands/pexpire)
    public func pexpire(_ key: String, _ milliseconds: Int, _ condition: PexpireCondition? = nil) async throws {
        let cmd = Cmd("PEXPIRE").arg(key).arg(milliseconds).arg(condition)
        try await cmd.exec(self)
    }
    /// Set the expiration for a key as a UNIX timestamp specified in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIREAT](https://redis.io/commands/pexpireat)
    public func pexpireat<T: FromRedisValue>(
        _ key: String, _ unixTimeMilliseconds: Int64, _ condition: PexpireatCondition? = nil
    ) async throws -> T {
        let cmd = Cmd("PEXPIREAT").arg(key).arg(unixTimeMilliseconds).arg(condition)
        return try await cmd.query(self)
    }
    /// Set the expiration for a key as a UNIX timestamp specified in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIREAT](https://redis.io/commands/pexpireat)
    public func pexpireat(_ key: String, _ unixTimeMilliseconds: Int64, _ condition: PexpireatCondition? = nil)
        async throws
    {
        let cmd = Cmd("PEXPIREAT").arg(key).arg(unixTimeMilliseconds).arg(condition)
        try await cmd.exec(self)
    }
    /// Get the expiration Unix timestamp for a key in milliseconds
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PEXPIRETIME](https://redis.io/commands/pexpiretime)
    public func pexpiretime<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("PEXPIRETIME").arg(key)
        return try await cmd.query(self)
    }
    /// Get the expiration Unix timestamp for a key in milliseconds
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PEXPIRETIME](https://redis.io/commands/pexpiretime)
    public func pexpiretime(_ key: String) async throws {
        let cmd = Cmd("PEXPIRETIME").arg(key)
        try await cmd.exec(self)
    }
    /// Adds the specified elements to the specified HyperLogLog.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) to add every element.
    /// ## Documentation
    /// view the docs for [PFADD](https://redis.io/commands/pfadd)
    public func pfadd<T: FromRedisValue>(_ key: String, _ element: String...) async throws -> T {
        let cmd = Cmd("PFADD").arg(key).arg(element)
        return try await cmd.query(self)
    }
    /// Adds the specified elements to the specified HyperLogLog.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) to add every element.
    /// ## Documentation
    /// view the docs for [PFADD](https://redis.io/commands/pfadd)
    public func pfadd(_ key: String, _ element: String...) async throws {
        let cmd = Cmd("PFADD").arg(key).arg(element)
        try await cmd.exec(self)
    }
    /// Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s).
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) with a very small average constant time when called with a single key. O(N) with N being the number of keys, and much bigger constant times, when called with multiple keys.
    /// ## Documentation
    /// view the docs for [PFCOUNT](https://redis.io/commands/pfcount)
    public func pfcount<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("PFCOUNT").arg(key)
        return try await cmd.query(self)
    }
    /// Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s).
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) with a very small average constant time when called with a single key. O(N) with N being the number of keys, and much bigger constant times, when called with multiple keys.
    /// ## Documentation
    /// view the docs for [PFCOUNT](https://redis.io/commands/pfcount)
    public func pfcount(_ key: String...) async throws {
        let cmd = Cmd("PFCOUNT").arg(key)
        try await cmd.exec(self)
    }
    /// Internal commands for debugging HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFDEBUG](https://redis.io/commands/pfdebug)
    public func pfdebug<T: FromRedisValue>(_ subcommand: String, _ key: String) async throws -> T {
        let cmd = Cmd("PFDEBUG").arg(subcommand).arg(key)
        return try await cmd.query(self)
    }
    /// Internal commands for debugging HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFDEBUG](https://redis.io/commands/pfdebug)
    public func pfdebug(_ subcommand: String, _ key: String) async throws {
        let cmd = Cmd("PFDEBUG").arg(subcommand).arg(key)
        try await cmd.exec(self)
    }
    /// Merge N different HyperLogLogs into a single one.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(N) to merge N HyperLogLogs, but with high constant times.
    /// ## Documentation
    /// view the docs for [PFMERGE](https://redis.io/commands/pfmerge)
    public func pfmerge<T: FromRedisValue>(_ destkey: String, _ sourcekey: String...) async throws -> T {
        let cmd = Cmd("PFMERGE").arg(destkey).arg(sourcekey)
        return try await cmd.query(self)
    }
    /// Merge N different HyperLogLogs into a single one.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(N) to merge N HyperLogLogs, but with high constant times.
    /// ## Documentation
    /// view the docs for [PFMERGE](https://redis.io/commands/pfmerge)
    public func pfmerge(_ destkey: String, _ sourcekey: String...) async throws {
        let cmd = Cmd("PFMERGE").arg(destkey).arg(sourcekey)
        try await cmd.exec(self)
    }
    /// An internal command for testing HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFSELFTEST](https://redis.io/commands/pfselftest)
    public func pfselftest<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("PFSELFTEST")
        return try await cmd.query(self)
    }
    /// An internal command for testing HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFSELFTEST](https://redis.io/commands/pfselftest)
    public func pfselftest() async throws {
        let cmd = Cmd("PFSELFTEST")
        try await cmd.exec(self)
    }
    /// Ping the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PING](https://redis.io/commands/ping)
    public func ping<T: FromRedisValue>(_ message: String? = nil) async throws -> T {
        let cmd = Cmd("PING").arg(message)
        return try await cmd.query(self)
    }
    /// Ping the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PING](https://redis.io/commands/ping)
    public func ping(_ message: String? = nil) async throws {
        let cmd = Cmd("PING").arg(message)
        try await cmd.exec(self)
    }
    /// Set the value and expiration in milliseconds of a key
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PSETEX](https://redis.io/commands/psetex)
    public func psetex<T: FromRedisValue>(_ key: String, _ milliseconds: Int, _ value: String) async throws -> T {
        let cmd = Cmd("PSETEX").arg(key).arg(milliseconds).arg(value)
        return try await cmd.query(self)
    }
    /// Set the value and expiration in milliseconds of a key
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PSETEX](https://redis.io/commands/psetex)
    public func psetex(_ key: String, _ milliseconds: Int, _ value: String) async throws {
        let cmd = Cmd("PSETEX").arg(key).arg(milliseconds).arg(value)
        try await cmd.exec(self)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 2.8.0
    /// ## Documentation
    /// view the docs for [PSYNC](https://redis.io/commands/psync)
    public func psync<T: FromRedisValue>(_ replicationid: String, _ offset: Int) async throws -> T {
        let cmd = Cmd("PSYNC").arg(replicationid).arg(offset)
        return try await cmd.query(self)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 2.8.0
    /// ## Documentation
    /// view the docs for [PSYNC](https://redis.io/commands/psync)
    public func psync(_ replicationid: String, _ offset: Int) async throws {
        let cmd = Cmd("PSYNC").arg(replicationid).arg(offset)
        try await cmd.exec(self)
    }
    /// Get the time to live for a key in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [PTTL](https://redis.io/commands/pttl)
    public func pttl<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("PTTL").arg(key)
        return try await cmd.query(self)
    }
    /// Get the time to live for a key in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [PTTL](https://redis.io/commands/pttl)
    public func pttl(_ key: String) async throws {
        let cmd = Cmd("PTTL").arg(key)
        try await cmd.exec(self)
    }
    /// Post a message to a channel
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of clients subscribed to the receiving channel and M is the total number of subscribed patterns (by any client).
    /// ## Documentation
    /// view the docs for [PUBLISH](https://redis.io/commands/publish)
    public func publish<T: FromRedisValue>(_ channel: String, _ message: String) async throws -> T {
        let cmd = Cmd("PUBLISH").arg(channel).arg(message)
        return try await cmd.query(self)
    }
    /// Post a message to a channel
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of clients subscribed to the receiving channel and M is the total number of subscribed patterns (by any client).
    /// ## Documentation
    /// view the docs for [PUBLISH](https://redis.io/commands/publish)
    public func publish(_ channel: String, _ message: String) async throws {
        let cmd = Cmd("PUBLISH").arg(channel).arg(message)
        try await cmd.exec(self)
    }
    /// A container for Pub/Sub commands
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [PUBSUB](https://redis.io/commands/pubsub)
    public func pubsub<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("PUBSUB")
        return try await cmd.query(self)
    }
    /// A container for Pub/Sub commands
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [PUBSUB](https://redis.io/commands/pubsub)
    public func pubsub() async throws {
        let cmd = Cmd("PUBSUB")
        try await cmd.exec(self)
    }
    /// Close the connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [QUIT](https://redis.io/commands/quit)
    public func quit<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("QUIT")
        return try await cmd.query(self)
    }
    /// Close the connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [QUIT](https://redis.io/commands/quit)
    public func quit() async throws {
        let cmd = Cmd("QUIT")
        try await cmd.exec(self)
    }
    /// Return a random key from the keyspace
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RANDOMKEY](https://redis.io/commands/randomkey)
    public func randomkey<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("RANDOMKEY")
        return try await cmd.query(self)
    }
    /// Return a random key from the keyspace
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RANDOMKEY](https://redis.io/commands/randomkey)
    public func randomkey() async throws {
        let cmd = Cmd("RANDOMKEY")
        try await cmd.exec(self)
    }
    /// Enables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READONLY](https://redis.io/commands/readonly)
    public func readonly<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("READONLY")
        return try await cmd.query(self)
    }
    /// Enables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READONLY](https://redis.io/commands/readonly)
    public func readonly() async throws {
        let cmd = Cmd("READONLY")
        try await cmd.exec(self)
    }
    /// Disables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READWRITE](https://redis.io/commands/readwrite)
    public func readwrite<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("READWRITE")
        return try await cmd.query(self)
    }
    /// Disables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READWRITE](https://redis.io/commands/readwrite)
    public func readwrite() async throws {
        let cmd = Cmd("READWRITE")
        try await cmd.exec(self)
    }
    /// Rename a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RENAME](https://redis.io/commands/rename)
    public func rename<T: FromRedisValue>(_ key: String, _ newkey: String) async throws -> T {
        let cmd = Cmd("RENAME").arg(key).arg(newkey)
        return try await cmd.query(self)
    }
    /// Rename a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RENAME](https://redis.io/commands/rename)
    public func rename(_ key: String, _ newkey: String) async throws {
        let cmd = Cmd("RENAME").arg(key).arg(newkey)
        try await cmd.exec(self)
    }
    /// Rename a key, only if the new key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.0, The command no longer returns an error when source and destination names are the same.
    /// ## Documentation
    /// view the docs for [RENAMENX](https://redis.io/commands/renamenx)
    public func renamenx<T: FromRedisValue>(_ key: String, _ newkey: String) async throws -> T {
        let cmd = Cmd("RENAMENX").arg(key).arg(newkey)
        return try await cmd.query(self)
    }
    /// Rename a key, only if the new key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.0, The command no longer returns an error when source and destination names are the same.
    /// ## Documentation
    /// view the docs for [RENAMENX](https://redis.io/commands/renamenx)
    public func renamenx(_ key: String, _ newkey: String) async throws {
        let cmd = Cmd("RENAMENX").arg(key).arg(newkey)
        try await cmd.exec(self)
    }
    /// An internal command for configuring the replication stream
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLCONF](https://redis.io/commands/replconf)
    public func replconf<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("REPLCONF")
        return try await cmd.query(self)
    }
    /// An internal command for configuring the replication stream
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLCONF](https://redis.io/commands/replconf)
    public func replconf() async throws {
        let cmd = Cmd("REPLCONF")
        try await cmd.exec(self)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLICAOF](https://redis.io/commands/replicaof)
    public func replicaof<T: FromRedisValue>(_ host: String, _ port: Int) async throws -> T {
        let cmd = Cmd("REPLICAOF").arg(host).arg(port)
        return try await cmd.query(self)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLICAOF](https://redis.io/commands/replicaof)
    public func replicaof(_ host: String, _ port: Int) async throws {
        let cmd = Cmd("REPLICAOF").arg(host).arg(port)
        try await cmd.exec(self)
    }
    /// Reset the connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RESET](https://redis.io/commands/reset)
    public func reset<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("RESET")
        return try await cmd.query(self)
    }
    /// Reset the connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RESET](https://redis.io/commands/reset)
    public func reset() async throws {
        let cmd = Cmd("RESET")
        try await cmd.exec(self)
    }
    /// Create a key using the provided serialized value, previously obtained using DUMP.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE](https://redis.io/commands/restore)
    public func restore<T: FromRedisValue>(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("RESTORE").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil).arg(
            seconds
        ).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        return try await cmd.query(self)
    }
    /// Create a key using the provided serialized value, previously obtained using DUMP.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE](https://redis.io/commands/restore)
    public func restore(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreOptions? = nil
    ) async throws {
        let cmd = Cmd("RESTORE").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil).arg(
            seconds
        ).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        try await cmd.exec(self)
    }
    /// An internal command for migrating keys in a cluster
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE_ASKING](https://redis.io/commands/restore-asking)
    public func restore_asking<T: FromRedisValue>(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreAskingOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("RESTORE_ASKING").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil)
            .arg(seconds).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        return try await cmd.query(self)
    }
    /// An internal command for migrating keys in a cluster
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE_ASKING](https://redis.io/commands/restore-asking)
    public func restore_asking(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreAskingOptions? = nil
    ) async throws {
        let cmd = Cmd("RESTORE_ASKING").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil)
            .arg(seconds).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        try await cmd.exec(self)
    }
    /// Return the role of the instance in the context of replication
    /// ## Available since
    /// 2.8.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ROLE](https://redis.io/commands/role)
    public func role<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("ROLE")
        return try await cmd.query(self)
    }
    /// Return the role of the instance in the context of replication
    /// ## Available since
    /// 2.8.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ROLE](https://redis.io/commands/role)
    public func role() async throws {
        let cmd = Cmd("ROLE")
        try await cmd.exec(self)
    }
    /// Remove and get the last elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [RPOP](https://redis.io/commands/rpop)
    public func rpop<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("RPOP").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and get the last elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [RPOP](https://redis.io/commands/rpop)
    public func rpop(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("RPOP").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Remove the last element in a list, prepend it to another list and return it
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RPOPLPUSH](https://redis.io/commands/rpoplpush)
    public func rpoplpush<T: FromRedisValue>(_ source: String, _ destination: String) async throws -> T {
        let cmd = Cmd("RPOPLPUSH").arg(source).arg(destination)
        return try await cmd.query(self)
    }
    /// Remove the last element in a list, prepend it to another list and return it
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RPOPLPUSH](https://redis.io/commands/rpoplpush)
    public func rpoplpush(_ source: String, _ destination: String) async throws {
        let cmd = Cmd("RPOPLPUSH").arg(source).arg(destination)
        try await cmd.exec(self)
    }
    /// Append one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSH](https://redis.io/commands/rpush)
    public func rpush<T: FromRedisValue>(_ key: String, _ element: String...) async throws -> T {
        let cmd = Cmd("RPUSH").arg(key).arg(element)
        return try await cmd.query(self)
    }
    /// Append one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSH](https://redis.io/commands/rpush)
    public func rpush(_ key: String, _ element: String...) async throws {
        let cmd = Cmd("RPUSH").arg(key).arg(element)
        try await cmd.exec(self)
    }
    /// Append an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSHX](https://redis.io/commands/rpushx)
    public func rpushx<T: FromRedisValue>(_ key: String, _ element: String...) async throws -> T {
        let cmd = Cmd("RPUSHX").arg(key).arg(element)
        return try await cmd.query(self)
    }
    /// Append an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSHX](https://redis.io/commands/rpushx)
    public func rpushx(_ key: String, _ element: String...) async throws {
        let cmd = Cmd("RPUSHX").arg(key).arg(element)
        try await cmd.exec(self)
    }
    /// Add one or more members to a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SADD](https://redis.io/commands/sadd)
    public func sadd<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("SADD").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Add one or more members to a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SADD](https://redis.io/commands/sadd)
    public func sadd(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("SADD").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Synchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## Documentation
    /// view the docs for [SAVE](https://redis.io/commands/save)
    public func save<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SAVE")
        return try await cmd.query(self)
    }
    /// Synchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## Documentation
    /// view the docs for [SAVE](https://redis.io/commands/save)
    public func save() async throws {
        let cmd = Cmd("SAVE")
        try await cmd.exec(self)
    }
    /// Incrementally iterate the keys space
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection.
    /// ## History
    /// - 6.0.0, Added the `TYPE` subcommand.
    /// ## Documentation
    /// view the docs for [SCAN](https://redis.io/commands/scan)
    public func scan<T: FromRedisValue>(
        _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil, _ type: String? = nil
    ) async throws -> T {
        let cmd = Cmd("SCAN").arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg((type != nil) ? "TYPE" : nil).arg(type)
        return try await cmd.query(self)
    }
    /// Incrementally iterate the keys space
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection.
    /// ## History
    /// - 6.0.0, Added the `TYPE` subcommand.
    /// ## Documentation
    /// view the docs for [SCAN](https://redis.io/commands/scan)
    public func scan(_ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil, _ type: String? = nil) async throws {
        let cmd = Cmd("SCAN").arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg((type != nil) ? "TYPE" : nil).arg(type)
        try await cmd.exec(self)
    }
    /// Get the number of members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCARD](https://redis.io/commands/scard)
    public func scard<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("SCARD").arg(key)
        return try await cmd.query(self)
    }
    /// Get the number of members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCARD](https://redis.io/commands/scard)
    public func scard(_ key: String) async throws {
        let cmd = Cmd("SCARD").arg(key)
        try await cmd.exec(self)
    }
    /// A container for Lua scripts management commands
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SCRIPT](https://redis.io/commands/script)
    public func script<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SCRIPT")
        return try await cmd.query(self)
    }
    /// A container for Lua scripts management commands
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SCRIPT](https://redis.io/commands/script)
    public func script() async throws {
        let cmd = Cmd("SCRIPT")
        try await cmd.exec(self)
    }
    /// Subtract multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFF](https://redis.io/commands/sdiff)
    public func sdiff<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("SDIFF").arg(key)
        return try await cmd.query(self)
    }
    /// Subtract multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFF](https://redis.io/commands/sdiff)
    public func sdiff(_ key: String...) async throws {
        let cmd = Cmd("SDIFF").arg(key)
        try await cmd.exec(self)
    }
    /// Subtract multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFFSTORE](https://redis.io/commands/sdiffstore)
    public func sdiffstore<T: FromRedisValue>(_ destination: String, _ key: String...) async throws -> T {
        let cmd = Cmd("SDIFFSTORE").arg(destination).arg(key)
        return try await cmd.query(self)
    }
    /// Subtract multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFFSTORE](https://redis.io/commands/sdiffstore)
    public func sdiffstore(_ destination: String, _ key: String...) async throws {
        let cmd = Cmd("SDIFFSTORE").arg(destination).arg(key)
        try await cmd.exec(self)
    }
    /// Change the selected database for the current connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SELECT](https://redis.io/commands/select)
    public func select<T: FromRedisValue>(_ index: Int) async throws -> T {
        let cmd = Cmd("SELECT").arg(index)
        return try await cmd.query(self)
    }
    /// Change the selected database for the current connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SELECT](https://redis.io/commands/select)
    public func select(_ index: Int) async throws {
        let cmd = Cmd("SELECT").arg(index)
        try await cmd.exec(self)
    }
    /// A container for Sentinel commands
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SENTINEL](https://redis.io/commands/sentinel)
    public func sentinel<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL")
        return try await cmd.query(self)
    }
    /// A container for Sentinel commands
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SENTINEL](https://redis.io/commands/sentinel)
    public func sentinel() async throws {
        let cmd = Cmd("SENTINEL")
        try await cmd.exec(self)
    }
    /// Set the string value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.6.12, Added the `EX`, `PX`, `NX` and `XX` options.
    /// - 6.0.0, Added the `KEEPTTL` option.
    /// - 6.2.0, Added the `GET`, `EXAT` and `PXAT` option.
    /// - 7.0.0, Allowed the `NX` and `GET` options to be used together.
    /// ## Documentation
    /// view the docs for [SET](https://redis.io/commands/set)
    public func set<T: FromRedisValue>(
        _ key: String, _ value: String, _ condition: SetCondition? = nil, _ expiration: SetExpiration? = nil,
        _ options: SetOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("SET").arg(key).arg(value).arg(condition).arg(expiration).arg(options)
        return try await cmd.query(self)
    }
    /// Set the string value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.6.12, Added the `EX`, `PX`, `NX` and `XX` options.
    /// - 6.0.0, Added the `KEEPTTL` option.
    /// - 6.2.0, Added the `GET`, `EXAT` and `PXAT` option.
    /// - 7.0.0, Allowed the `NX` and `GET` options to be used together.
    /// ## Documentation
    /// view the docs for [SET](https://redis.io/commands/set)
    public func set(
        _ key: String, _ value: String, _ condition: SetCondition? = nil, _ expiration: SetExpiration? = nil,
        _ options: SetOptions? = nil
    ) async throws {
        let cmd = Cmd("SET").arg(key).arg(value).arg(condition).arg(expiration).arg(options)
        try await cmd.exec(self)
    }
    /// Sets or clears the bit at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETBIT](https://redis.io/commands/setbit)
    public func setbit<T: FromRedisValue>(_ key: String, _ offset: Int, _ value: Int) async throws -> T {
        let cmd = Cmd("SETBIT").arg(key).arg(offset).arg(value)
        return try await cmd.query(self)
    }
    /// Sets or clears the bit at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETBIT](https://redis.io/commands/setbit)
    public func setbit(_ key: String, _ offset: Int, _ value: Int) async throws {
        let cmd = Cmd("SETBIT").arg(key).arg(offset).arg(value)
        try await cmd.exec(self)
    }
    /// Set the value and expiration of a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETEX](https://redis.io/commands/setex)
    public func setex<T: FromRedisValue>(_ key: String, _ seconds: Int, _ value: String) async throws -> T {
        let cmd = Cmd("SETEX").arg(key).arg(seconds).arg(value)
        return try await cmd.query(self)
    }
    /// Set the value and expiration of a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETEX](https://redis.io/commands/setex)
    public func setex(_ key: String, _ seconds: Int, _ value: String) async throws {
        let cmd = Cmd("SETEX").arg(key).arg(seconds).arg(value)
        try await cmd.exec(self)
    }
    /// Set the value of a key, only if the key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETNX](https://redis.io/commands/setnx)
    public func setnx<T: FromRedisValue>(_ key: String, _ value: String) async throws -> T {
        let cmd = Cmd("SETNX").arg(key).arg(value)
        return try await cmd.query(self)
    }
    /// Set the value of a key, only if the key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETNX](https://redis.io/commands/setnx)
    public func setnx(_ key: String, _ value: String) async throws {
        let cmd = Cmd("SETNX").arg(key).arg(value)
        try await cmd.exec(self)
    }
    /// Overwrite part of a string at key starting at the specified offset
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1), not counting the time taken to copy the new string in place. Usually, this string is very small so the amortized complexity is O(1). Otherwise, complexity is O(M) with M being the length of the value argument.
    /// ## Documentation
    /// view the docs for [SETRANGE](https://redis.io/commands/setrange)
    public func setrange<T: FromRedisValue>(_ key: String, _ offset: Int, _ value: String) async throws -> T {
        let cmd = Cmd("SETRANGE").arg(key).arg(offset).arg(value)
        return try await cmd.query(self)
    }
    /// Overwrite part of a string at key starting at the specified offset
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1), not counting the time taken to copy the new string in place. Usually, this string is very small so the amortized complexity is O(1). Otherwise, complexity is O(M) with M being the length of the value argument.
    /// ## Documentation
    /// view the docs for [SETRANGE](https://redis.io/commands/setrange)
    public func setrange(_ key: String, _ offset: Int, _ value: String) async throws {
        let cmd = Cmd("SETRANGE").arg(key).arg(offset).arg(value)
        try await cmd.exec(self)
    }
    /// Synchronously save the dataset to disk and then shut down the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) when saving, where N is the total number of keys in all databases when saving data, otherwise O(1)
    /// ## History
    /// - 7.0.0, Added the `NOW`, `FORCE` and `ABORT` modifiers.
    /// ## Documentation
    /// view the docs for [SHUTDOWN](https://redis.io/commands/shutdown)
    public func shutdown<T: FromRedisValue>(_ nosaveSave: ShutdownNosavesave? = nil, _ options: ShutdownOptions? = nil)
        async throws -> T
    {
        let cmd = Cmd("SHUTDOWN").arg(nosaveSave).arg(options)
        return try await cmd.query(self)
    }
    /// Synchronously save the dataset to disk and then shut down the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) when saving, where N is the total number of keys in all databases when saving data, otherwise O(1)
    /// ## History
    /// - 7.0.0, Added the `NOW`, `FORCE` and `ABORT` modifiers.
    /// ## Documentation
    /// view the docs for [SHUTDOWN](https://redis.io/commands/shutdown)
    public func shutdown(_ nosaveSave: ShutdownNosavesave? = nil, _ options: ShutdownOptions? = nil) async throws {
        let cmd = Cmd("SHUTDOWN").arg(nosaveSave).arg(options)
        try await cmd.exec(self)
    }
    /// Intersect multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTER](https://redis.io/commands/sinter)
    public func sinter<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("SINTER").arg(key)
        return try await cmd.query(self)
    }
    /// Intersect multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTER](https://redis.io/commands/sinter)
    public func sinter(_ key: String...) async throws {
        let cmd = Cmd("SINTER").arg(key)
        try await cmd.exec(self)
    }
    /// Intersect multiple sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERCARD](https://redis.io/commands/sintercard)
    public func sintercard<T: FromRedisValue>(_ numkeys: Int, _ key: String..., limit: Int? = nil) async throws -> T {
        let cmd = Cmd("SINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        return try await cmd.query(self)
    }
    /// Intersect multiple sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERCARD](https://redis.io/commands/sintercard)
    public func sintercard(_ numkeys: Int, _ key: String..., limit: Int? = nil) async throws {
        let cmd = Cmd("SINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        try await cmd.exec(self)
    }
    /// Intersect multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERSTORE](https://redis.io/commands/sinterstore)
    public func sinterstore<T: FromRedisValue>(_ destination: String, _ key: String...) async throws -> T {
        let cmd = Cmd("SINTERSTORE").arg(destination).arg(key)
        return try await cmd.query(self)
    }
    /// Intersect multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERSTORE](https://redis.io/commands/sinterstore)
    public func sinterstore(_ destination: String, _ key: String...) async throws {
        let cmd = Cmd("SINTERSTORE").arg(destination).arg(key)
        try await cmd.exec(self)
    }
    /// Determine if a given value is a member of a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SISMEMBER](https://redis.io/commands/sismember)
    public func sismember<T: FromRedisValue>(_ key: String, _ member: String) async throws -> T {
        let cmd = Cmd("SISMEMBER").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Determine if a given value is a member of a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SISMEMBER](https://redis.io/commands/sismember)
    public func sismember(_ key: String, _ member: String) async throws {
        let cmd = Cmd("SISMEMBER").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLAVEOF](https://redis.io/commands/slaveof)
    public func slaveof<T: FromRedisValue>(_ host: String, _ port: Int) async throws -> T {
        let cmd = Cmd("SLAVEOF").arg(host).arg(port)
        return try await cmd.query(self)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLAVEOF](https://redis.io/commands/slaveof)
    public func slaveof(_ host: String, _ port: Int) async throws {
        let cmd = Cmd("SLAVEOF").arg(host).arg(port)
        try await cmd.exec(self)
    }
    /// A container for slow log commands
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SLOWLOG](https://redis.io/commands/slowlog)
    public func slowlog<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SLOWLOG")
        return try await cmd.query(self)
    }
    /// A container for slow log commands
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SLOWLOG](https://redis.io/commands/slowlog)
    public func slowlog() async throws {
        let cmd = Cmd("SLOWLOG")
        try await cmd.exec(self)
    }
    /// Get all the members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the set cardinality.
    /// ## Documentation
    /// view the docs for [SMEMBERS](https://redis.io/commands/smembers)
    public func smembers<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("SMEMBERS").arg(key)
        return try await cmd.query(self)
    }
    /// Get all the members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the set cardinality.
    /// ## Documentation
    /// view the docs for [SMEMBERS](https://redis.io/commands/smembers)
    public func smembers(_ key: String) async throws {
        let cmd = Cmd("SMEMBERS").arg(key)
        try await cmd.exec(self)
    }
    /// Returns the membership associated with the given elements for a set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements being checked for membership
    /// ## Documentation
    /// view the docs for [SMISMEMBER](https://redis.io/commands/smismember)
    public func smismember<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("SMISMEMBER").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Returns the membership associated with the given elements for a set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements being checked for membership
    /// ## Documentation
    /// view the docs for [SMISMEMBER](https://redis.io/commands/smismember)
    public func smismember(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("SMISMEMBER").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Move a member from one set to another
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SMOVE](https://redis.io/commands/smove)
    public func smove<T: FromRedisValue>(_ source: String, _ destination: String, _ member: String) async throws -> T {
        let cmd = Cmd("SMOVE").arg(source).arg(destination).arg(member)
        return try await cmd.query(self)
    }
    /// Move a member from one set to another
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SMOVE](https://redis.io/commands/smove)
    public func smove(_ source: String, _ destination: String, _ member: String) async throws {
        let cmd = Cmd("SMOVE").arg(source).arg(destination).arg(member)
        try await cmd.exec(self)
    }
    /// Sort the elements in a list, set or sorted set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT](https://redis.io/commands/sort)
    public func sort<T: FromRedisValue>(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortOffsetcount? = nil, _ GET: String...,
        order: SortOrder? = nil, _ destination: String? = nil, _ options: SortOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("SORT").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(
            (destination != nil) ? "STORE" : nil
        ).arg(destination).arg(options)
        return try await cmd.query(self)
    }
    /// Sort the elements in a list, set or sorted set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT](https://redis.io/commands/sort)
    public func sort(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortOffsetcount? = nil, _ GET: String...,
        order: SortOrder? = nil, _ destination: String? = nil, _ options: SortOptions? = nil
    ) async throws {
        let cmd = Cmd("SORT").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(
            (destination != nil) ? "STORE" : nil
        ).arg(destination).arg(options)
        try await cmd.exec(self)
    }
    /// Sort the elements in a list, set or sorted set. Read-only variant of SORT.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT_RO](https://redis.io/commands/sort-ro)
    public func sort_ro<T: FromRedisValue>(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortRoOffsetcount? = nil, _ GET: String...,
        order: SortRoOrder? = nil, _ options: SortRoOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("SORT_RO").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(options)
        return try await cmd.query(self)
    }
    /// Sort the elements in a list, set or sorted set. Read-only variant of SORT.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT_RO](https://redis.io/commands/sort-ro)
    public func sort_ro(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortRoOffsetcount? = nil, _ GET: String...,
        order: SortRoOrder? = nil, _ options: SortRoOptions? = nil
    ) async throws {
        let cmd = Cmd("SORT_RO").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(options)
        try await cmd.exec(self)
    }
    /// Remove and return one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the value of the passed count.
    /// ## History
    /// - 3.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [SPOP](https://redis.io/commands/spop)
    public func spop<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("SPOP").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and return one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the value of the passed count.
    /// ## History
    /// - 3.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [SPOP](https://redis.io/commands/spop)
    public func spop(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("SPOP").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Post a message to a shard channel
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of clients subscribed to the receiving shard channel.
    /// ## Documentation
    /// view the docs for [SPUBLISH](https://redis.io/commands/spublish)
    public func spublish<T: FromRedisValue>(_ shardchannel: String, _ message: String) async throws -> T {
        let cmd = Cmd("SPUBLISH").arg(shardchannel).arg(message)
        return try await cmd.query(self)
    }
    /// Post a message to a shard channel
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of clients subscribed to the receiving shard channel.
    /// ## Documentation
    /// view the docs for [SPUBLISH](https://redis.io/commands/spublish)
    public func spublish(_ shardchannel: String, _ message: String) async throws {
        let cmd = Cmd("SPUBLISH").arg(shardchannel).arg(message)
        try await cmd.exec(self)
    }
    /// Get one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the absolute value of the passed count.
    /// ## History
    /// - 2.6.0, Added the optional `count` argument.
    /// ## Documentation
    /// view the docs for [SRANDMEMBER](https://redis.io/commands/srandmember)
    public func srandmember<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("SRANDMEMBER").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Get one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the absolute value of the passed count.
    /// ## History
    /// - 2.6.0, Added the optional `count` argument.
    /// ## Documentation
    /// view the docs for [SRANDMEMBER](https://redis.io/commands/srandmember)
    public func srandmember(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("SRANDMEMBER").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Remove one or more members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of members to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SREM](https://redis.io/commands/srem)
    public func srem<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("SREM").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Remove one or more members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of members to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SREM](https://redis.io/commands/srem)
    public func srem(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("SREM").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Incrementally iterate Set elements
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [SSCAN](https://redis.io/commands/sscan)
    public func sscan<T: FromRedisValue>(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("SSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return try await cmd.query(self)
    }
    /// Incrementally iterate Set elements
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [SSCAN](https://redis.io/commands/sscan)
    public func sscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) async throws {
        let cmd = Cmd("SSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        try await cmd.exec(self)
    }
    /// Get the length of the value stored in a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [STRLEN](https://redis.io/commands/strlen)
    public func strlen<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("STRLEN").arg(key)
        return try await cmd.query(self)
    }
    /// Get the length of the value stored in a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [STRLEN](https://redis.io/commands/strlen)
    public func strlen(_ key: String) async throws {
        let cmd = Cmd("STRLEN").arg(key)
        try await cmd.exec(self)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [SUBSTR](https://redis.io/commands/substr)
    public func substr<T: FromRedisValue>(_ key: String, _ start: Int, _ end: Int) async throws -> T {
        let cmd = Cmd("SUBSTR").arg(key).arg(start).arg(end)
        return try await cmd.query(self)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [SUBSTR](https://redis.io/commands/substr)
    public func substr(_ key: String, _ start: Int, _ end: Int) async throws {
        let cmd = Cmd("SUBSTR").arg(key).arg(start).arg(end)
        try await cmd.exec(self)
    }
    /// Add multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNION](https://redis.io/commands/sunion)
    public func sunion<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("SUNION").arg(key)
        return try await cmd.query(self)
    }
    /// Add multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNION](https://redis.io/commands/sunion)
    public func sunion(_ key: String...) async throws {
        let cmd = Cmd("SUNION").arg(key)
        try await cmd.exec(self)
    }
    /// Add multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNIONSTORE](https://redis.io/commands/sunionstore)
    public func sunionstore<T: FromRedisValue>(_ destination: String, _ key: String...) async throws -> T {
        let cmd = Cmd("SUNIONSTORE").arg(destination).arg(key)
        return try await cmd.query(self)
    }
    /// Add multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNIONSTORE](https://redis.io/commands/sunionstore)
    public func sunionstore(_ destination: String, _ key: String...) async throws {
        let cmd = Cmd("SUNIONSTORE").arg(destination).arg(key)
        try await cmd.exec(self)
    }
    /// Swaps two Redis databases
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the count of clients watching or blocking on keys from both databases.
    /// ## Documentation
    /// view the docs for [SWAPDB](https://redis.io/commands/swapdb)
    public func swapdb<T: FromRedisValue>(_ index1: Int, _ index2: Int) async throws -> T {
        let cmd = Cmd("SWAPDB").arg(index1).arg(index2)
        return try await cmd.query(self)
    }
    /// Swaps two Redis databases
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the count of clients watching or blocking on keys from both databases.
    /// ## Documentation
    /// view the docs for [SWAPDB](https://redis.io/commands/swapdb)
    public func swapdb(_ index1: Int, _ index2: Int) async throws {
        let cmd = Cmd("SWAPDB").arg(index1).arg(index2)
        try await cmd.exec(self)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [SYNC](https://redis.io/commands/sync)
    public func sync<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SYNC")
        return try await cmd.query(self)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [SYNC](https://redis.io/commands/sync)
    public func sync() async throws {
        let cmd = Cmd("SYNC")
        try await cmd.exec(self)
    }
    /// Return the current server time
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TIME](https://redis.io/commands/time)
    public func time<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("TIME")
        return try await cmd.query(self)
    }
    /// Return the current server time
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TIME](https://redis.io/commands/time)
    public func time() async throws {
        let cmd = Cmd("TIME")
        try await cmd.exec(self)
    }
    /// Alters the last access time of a key(s). Returns the number of existing keys specified.
    /// ## Available since
    /// 3.2.1
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be touched.
    /// ## Documentation
    /// view the docs for [TOUCH](https://redis.io/commands/touch)
    public func touch<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("TOUCH").arg(key)
        return try await cmd.query(self)
    }
    /// Alters the last access time of a key(s). Returns the number of existing keys specified.
    /// ## Available since
    /// 3.2.1
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be touched.
    /// ## Documentation
    /// view the docs for [TOUCH](https://redis.io/commands/touch)
    public func touch(_ key: String...) async throws {
        let cmd = Cmd("TOUCH").arg(key)
        try await cmd.exec(self)
    }
    /// Get the time to live for a key in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [TTL](https://redis.io/commands/ttl)
    public func ttl<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("TTL").arg(key)
        return try await cmd.query(self)
    }
    /// Get the time to live for a key in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [TTL](https://redis.io/commands/ttl)
    public func ttl(_ key: String) async throws {
        let cmd = Cmd("TTL").arg(key)
        try await cmd.exec(self)
    }
    /// Determine the type stored at key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TYPE](https://redis.io/commands/type)
    public func type<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("TYPE").arg(key)
        return try await cmd.query(self)
    }
    /// Determine the type stored at key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TYPE](https://redis.io/commands/type)
    public func type(_ key: String) async throws {
        let cmd = Cmd("TYPE").arg(key)
        try await cmd.exec(self)
    }
    /// Delete a key asynchronously in another thread. Otherwise it is just as DEL, but non blocking.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1) for each key removed regardless of its size. Then the command does O(N) work in a different thread in order to reclaim memory, where N is the number of allocations the deleted objects where composed of.
    /// ## Documentation
    /// view the docs for [UNLINK](https://redis.io/commands/unlink)
    public func unlink<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("UNLINK").arg(key)
        return try await cmd.query(self)
    }
    /// Delete a key asynchronously in another thread. Otherwise it is just as DEL, but non blocking.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1) for each key removed regardless of its size. Then the command does O(N) work in a different thread in order to reclaim memory, where N is the number of allocations the deleted objects where composed of.
    /// ## Documentation
    /// view the docs for [UNLINK](https://redis.io/commands/unlink)
    public func unlink(_ key: String...) async throws {
        let cmd = Cmd("UNLINK").arg(key)
        try await cmd.exec(self)
    }
    /// Forget about all watched keys
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [UNWATCH](https://redis.io/commands/unwatch)
    public func unwatch<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("UNWATCH")
        return try await cmd.query(self)
    }
    /// Forget about all watched keys
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [UNWATCH](https://redis.io/commands/unwatch)
    public func unwatch() async throws {
        let cmd = Cmd("UNWATCH")
        try await cmd.exec(self)
    }
    /// Wait for the synchronous replication of all the write commands sent in the context of the current connection
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [WAIT](https://redis.io/commands/wait)
    public func wait<T: FromRedisValue>(_ numreplicas: Int, _ timeout: Int) async throws -> T {
        let cmd = Cmd("WAIT").arg(numreplicas).arg(timeout)
        return try await cmd.query(self)
    }
    /// Wait for the synchronous replication of all the write commands sent in the context of the current connection
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [WAIT](https://redis.io/commands/wait)
    public func wait(_ numreplicas: Int, _ timeout: Int) async throws {
        let cmd = Cmd("WAIT").arg(numreplicas).arg(timeout)
        try await cmd.exec(self)
    }
    /// Watch the given keys to determine execution of the MULTI/EXEC block
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for every key.
    /// ## Documentation
    /// view the docs for [WATCH](https://redis.io/commands/watch)
    public func watch<T: FromRedisValue>(_ key: String...) async throws -> T {
        let cmd = Cmd("WATCH").arg(key)
        return try await cmd.query(self)
    }
    /// Watch the given keys to determine execution of the MULTI/EXEC block
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for every key.
    /// ## Documentation
    /// view the docs for [WATCH](https://redis.io/commands/watch)
    public func watch(_ key: String...) async throws {
        let cmd = Cmd("WATCH").arg(key)
        try await cmd.exec(self)
    }
    /// Marks a pending message as correctly processed, effectively removing it from the pending entries list of the consumer group. Return value of the command is the number of messages successfully acknowledged, that is, the IDs we were actually able to resolve in the PEL.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each message ID processed.
    /// ## Documentation
    /// view the docs for [XACK](https://redis.io/commands/xack)
    public func xack<T: FromRedisValue>(_ key: String, _ group: String, _ id: String...) async throws -> T {
        let cmd = Cmd("XACK").arg(key).arg(group).arg(id)
        return try await cmd.query(self)
    }
    /// Marks a pending message as correctly processed, effectively removing it from the pending entries list of the consumer group. Return value of the command is the number of messages successfully acknowledged, that is, the IDs we were actually able to resolve in the PEL.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each message ID processed.
    /// ## Documentation
    /// view the docs for [XACK](https://redis.io/commands/xack)
    public func xack(_ key: String, _ group: String, _ id: String...) async throws {
        let cmd = Cmd("XACK").arg(key).arg(group).arg(id)
        try await cmd.exec(self)
    }
    /// Appends a new entry to a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) when adding a new entry, O(N) when trimming where N being the number of entries evicted.
    /// ## History
    /// - 6.2.0, Added the `NOMKSTREAM` option, `MINID` trimming strategy and the `LIMIT` option.
    /// - 7.0.0, Added support for the `<ms>-*` explicit ID form.
    /// ## Documentation
    /// view the docs for [XADD](https://redis.io/commands/xadd)
    public func xadd<T: FromRedisValue>(
        _ key: String, _ trim: XaddTrim? = nil, _ idOrAuto: XaddIdorauto, _ fieldValue: XaddFieldvalue...,
        options: XaddOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XADD").arg(key).arg(trim).arg(idOrAuto).arg(fieldValue).arg(options)
        return try await cmd.query(self)
    }
    /// Appends a new entry to a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) when adding a new entry, O(N) when trimming where N being the number of entries evicted.
    /// ## History
    /// - 6.2.0, Added the `NOMKSTREAM` option, `MINID` trimming strategy and the `LIMIT` option.
    /// - 7.0.0, Added support for the `<ms>-*` explicit ID form.
    /// ## Documentation
    /// view the docs for [XADD](https://redis.io/commands/xadd)
    public func xadd(
        _ key: String, _ trim: XaddTrim? = nil, _ idOrAuto: XaddIdorauto, _ fieldValue: XaddFieldvalue...,
        options: XaddOptions? = nil
    ) async throws {
        let cmd = Cmd("XADD").arg(key).arg(trim).arg(idOrAuto).arg(fieldValue).arg(options)
        try await cmd.exec(self)
    }
    /// Changes (or acquires) ownership of messages in a consumer group, as if the messages were delivered to the specified consumer.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1) if COUNT is small.
    /// ## History
    /// - 7.0.0, Added an element to the reply array, containing deleted entries the command cleared from the PEL
    /// ## Documentation
    /// view the docs for [XAUTOCLAIM](https://redis.io/commands/xautoclaim)
    public func xautoclaim<T: FromRedisValue>(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ start: String, _ count: Int? = nil,
        _ options: XautoclaimOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XAUTOCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(start).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg(options)
        return try await cmd.query(self)
    }
    /// Changes (or acquires) ownership of messages in a consumer group, as if the messages were delivered to the specified consumer.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1) if COUNT is small.
    /// ## History
    /// - 7.0.0, Added an element to the reply array, containing deleted entries the command cleared from the PEL
    /// ## Documentation
    /// view the docs for [XAUTOCLAIM](https://redis.io/commands/xautoclaim)
    public func xautoclaim(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ start: String, _ count: Int? = nil,
        _ options: XautoclaimOptions? = nil
    ) async throws {
        let cmd = Cmd("XAUTOCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(start).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg(options)
        try await cmd.exec(self)
    }
    /// Changes (or acquires) ownership of a message in a consumer group, as if the message was delivered to the specified consumer.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) with N being the number of messages in the PEL of the consumer group.
    /// ## Documentation
    /// view the docs for [XCLAIM](https://redis.io/commands/xclaim)
    public func xclaim<T: FromRedisValue>(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ id: String..., ms: Int? = nil,
        _ unixTimeMilliseconds: Int64? = nil, _ count: Int? = nil, _ LASTID: String? = nil,
        _ options: XclaimOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(id).arg(
            (ms != nil) ? "IDLE" : nil
        ).arg(ms).arg((unixTimeMilliseconds != nil) ? "TIME" : nil).arg(unixTimeMilliseconds).arg(
            (count != nil) ? "RETRYCOUNT" : nil
        ).arg(count).arg((LASTID != nil) ? "LASTID" : nil).arg(LASTID).arg(options)
        return try await cmd.query(self)
    }
    /// Changes (or acquires) ownership of a message in a consumer group, as if the message was delivered to the specified consumer.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) with N being the number of messages in the PEL of the consumer group.
    /// ## Documentation
    /// view the docs for [XCLAIM](https://redis.io/commands/xclaim)
    public func xclaim(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ id: String..., ms: Int? = nil,
        _ unixTimeMilliseconds: Int64? = nil, _ count: Int? = nil, _ LASTID: String? = nil,
        _ options: XclaimOptions? = nil
    ) async throws {
        let cmd = Cmd("XCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(id).arg(
            (ms != nil) ? "IDLE" : nil
        ).arg(ms).arg((unixTimeMilliseconds != nil) ? "TIME" : nil).arg(unixTimeMilliseconds).arg(
            (count != nil) ? "RETRYCOUNT" : nil
        ).arg(count).arg((LASTID != nil) ? "LASTID" : nil).arg(LASTID).arg(options)
        try await cmd.exec(self)
    }
    /// Removes the specified entries from the stream. Returns the number of items actually deleted, that may be different from the number of IDs passed in case certain IDs do not exist.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each single item to delete in the stream, regardless of the stream size.
    /// ## Documentation
    /// view the docs for [XDEL](https://redis.io/commands/xdel)
    public func xdel<T: FromRedisValue>(_ key: String, _ id: String...) async throws -> T {
        let cmd = Cmd("XDEL").arg(key).arg(id)
        return try await cmd.query(self)
    }
    /// Removes the specified entries from the stream. Returns the number of items actually deleted, that may be different from the number of IDs passed in case certain IDs do not exist.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each single item to delete in the stream, regardless of the stream size.
    /// ## Documentation
    /// view the docs for [XDEL](https://redis.io/commands/xdel)
    public func xdel(_ key: String, _ id: String...) async throws {
        let cmd = Cmd("XDEL").arg(key).arg(id)
        try await cmd.exec(self)
    }
    /// A container for consumer groups commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XGROUP](https://redis.io/commands/xgroup)
    public func xgroup<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("XGROUP")
        return try await cmd.query(self)
    }
    /// A container for consumer groups commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XGROUP](https://redis.io/commands/xgroup)
    public func xgroup() async throws {
        let cmd = Cmd("XGROUP")
        try await cmd.exec(self)
    }
    /// A container for stream introspection commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XINFO](https://redis.io/commands/xinfo)
    public func xinfo<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("XINFO")
        return try await cmd.query(self)
    }
    /// A container for stream introspection commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XINFO](https://redis.io/commands/xinfo)
    public func xinfo() async throws {
        let cmd = Cmd("XINFO")
        try await cmd.exec(self)
    }
    /// Return the number of entries in a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XLEN](https://redis.io/commands/xlen)
    public func xlen<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("XLEN").arg(key)
        return try await cmd.query(self)
    }
    /// Return the number of entries in a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XLEN](https://redis.io/commands/xlen)
    public func xlen(_ key: String) async throws {
        let cmd = Cmd("XLEN").arg(key)
        try await cmd.exec(self)
    }
    /// Return information and entries from a stream consumer group pending entries list, that are messages fetched but never acknowledged.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned, so asking for a small fixed number of entries per call is O(1). O(M), where M is the total number of entries scanned when used with the IDLE filter. When the command returns just the summary and the list of consumers is small, it runs in O(1) time; otherwise, an additional O(N) time for iterating every consumer.
    /// ## History
    /// - 6.2.0, Added the `IDLE` option and exclusive range intervals.
    /// ## Documentation
    /// view the docs for [XPENDING](https://redis.io/commands/xpending)
    public func xpending<T: FromRedisValue>(_ key: String, _ group: String, _ filters: XpendingFilters? = nil)
        async throws -> T
    {
        let cmd = Cmd("XPENDING").arg(key).arg(group).arg(filters)
        return try await cmd.query(self)
    }
    /// Return information and entries from a stream consumer group pending entries list, that are messages fetched but never acknowledged.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned, so asking for a small fixed number of entries per call is O(1). O(M), where M is the total number of entries scanned when used with the IDLE filter. When the command returns just the summary and the list of consumers is small, it runs in O(1) time; otherwise, an additional O(N) time for iterating every consumer.
    /// ## History
    /// - 6.2.0, Added the `IDLE` option and exclusive range intervals.
    /// ## Documentation
    /// view the docs for [XPENDING](https://redis.io/commands/xpending)
    public func xpending(_ key: String, _ group: String, _ filters: XpendingFilters? = nil) async throws {
        let cmd = Cmd("XPENDING").arg(key).arg(group).arg(filters)
        try await cmd.exec(self)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements being returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XRANGE](https://redis.io/commands/xrange)
    public func xrange<T: FromRedisValue>(_ key: String, _ start: String, _ end: String, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("XRANGE").arg(key).arg(start).arg(end).arg((count != nil) ? "COUNT" : nil).arg(count)
        return try await cmd.query(self)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements being returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XRANGE](https://redis.io/commands/xrange)
    public func xrange(_ key: String, _ start: String, _ end: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("XRANGE").arg(key).arg(start).arg(end).arg((count != nil) ? "COUNT" : nil).arg(count)
        try await cmd.exec(self)
    }
    /// Return never seen elements in multiple streams, with IDs greater than the ones reported by the caller for each stream. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(N) with N being the number of elements being returned, it means that XREAD-ing with a fixed COUNT is O(1). Note that when the BLOCK option is used, XADD will pay O(M) time in order to serve the M clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREAD](https://redis.io/commands/xread)
    public func xread<T: FromRedisValue>(_ count: Int? = nil, _ milliseconds: Int? = nil, _ streams: XreadStreams)
        async throws -> T
    {
        let cmd = Cmd("XREAD").arg((count != nil) ? "COUNT" : nil).arg(count).arg((milliseconds != nil) ? "BLOCK" : nil)
            .arg(milliseconds).arg("STREAMS").arg(streams)
        return try await cmd.query(self)
    }
    /// Return never seen elements in multiple streams, with IDs greater than the ones reported by the caller for each stream. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(N) with N being the number of elements being returned, it means that XREAD-ing with a fixed COUNT is O(1). Note that when the BLOCK option is used, XADD will pay O(M) time in order to serve the M clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREAD](https://redis.io/commands/xread)
    public func xread(_ count: Int? = nil, _ milliseconds: Int? = nil, _ streams: XreadStreams) async throws {
        let cmd = Cmd("XREAD").arg((count != nil) ? "COUNT" : nil).arg(count).arg((milliseconds != nil) ? "BLOCK" : nil)
            .arg(milliseconds).arg("STREAMS").arg(streams)
        try await cmd.exec(self)
    }
    /// Return new entries from a stream using a consumer group, or access the history of the pending entries for a given consumer. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(M) with M being the number of elements returned. If M is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1). On the other side when XREADGROUP blocks, XADD will pay the O(N) time in order to serve the N clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREADGROUP](https://redis.io/commands/xreadgroup)
    public func xreadgroup<T: FromRedisValue>(
        _ groupConsumer: XreadgroupGroupconsumer, _ count: Int? = nil, _ milliseconds: Int? = nil,
        _ streams: XreadgroupStreams, _ options: XreadgroupOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("XREADGROUP").arg("GROUP").arg(groupConsumer).arg((count != nil) ? "COUNT" : nil).arg(count).arg(
            (milliseconds != nil) ? "BLOCK" : nil
        ).arg(milliseconds).arg("STREAMS").arg(streams).arg(options)
        return try await cmd.query(self)
    }
    /// Return new entries from a stream using a consumer group, or access the history of the pending entries for a given consumer. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(M) with M being the number of elements returned. If M is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1). On the other side when XREADGROUP blocks, XADD will pay the O(N) time in order to serve the N clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREADGROUP](https://redis.io/commands/xreadgroup)
    public func xreadgroup(
        _ groupConsumer: XreadgroupGroupconsumer, _ count: Int? = nil, _ milliseconds: Int? = nil,
        _ streams: XreadgroupStreams, _ options: XreadgroupOptions? = nil
    ) async throws {
        let cmd = Cmd("XREADGROUP").arg("GROUP").arg(groupConsumer).arg((count != nil) ? "COUNT" : nil).arg(count).arg(
            (milliseconds != nil) ? "BLOCK" : nil
        ).arg(milliseconds).arg("STREAMS").arg(streams).arg(options)
        try await cmd.exec(self)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval, in reverse order (from greater to smaller IDs) compared to XRANGE
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XREVRANGE](https://redis.io/commands/xrevrange)
    public func xrevrange<T: FromRedisValue>(_ key: String, _ end: String, _ start: String, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("XREVRANGE").arg(key).arg(end).arg(start).arg((count != nil) ? "COUNT" : nil).arg(count)
        return try await cmd.query(self)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval, in reverse order (from greater to smaller IDs) compared to XRANGE
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XREVRANGE](https://redis.io/commands/xrevrange)
    public func xrevrange(_ key: String, _ end: String, _ start: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("XREVRANGE").arg(key).arg(end).arg(start).arg((count != nil) ? "COUNT" : nil).arg(count)
        try await cmd.exec(self)
    }
    /// An internal command for replicating stream values
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_added` and `max_deleted_entry_id` arguments.
    /// ## Documentation
    /// view the docs for [XSETID](https://redis.io/commands/xsetid)
    public func xsetid<T: FromRedisValue>(
        _ key: String, _ lastId: String, _ entriesAdded: Int? = nil, _ maxDeletedEntryId: String? = nil
    ) async throws -> T {
        let cmd = Cmd("XSETID").arg(key).arg(lastId).arg((entriesAdded != nil) ? "ENTRIESADDED" : nil).arg(entriesAdded)
            .arg((maxDeletedEntryId != nil) ? "MAXDELETEDID" : nil).arg(maxDeletedEntryId)
        return try await cmd.query(self)
    }
    /// An internal command for replicating stream values
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_added` and `max_deleted_entry_id` arguments.
    /// ## Documentation
    /// view the docs for [XSETID](https://redis.io/commands/xsetid)
    public func xsetid(_ key: String, _ lastId: String, _ entriesAdded: Int? = nil, _ maxDeletedEntryId: String? = nil)
        async throws
    {
        let cmd = Cmd("XSETID").arg(key).arg(lastId).arg((entriesAdded != nil) ? "ENTRIESADDED" : nil).arg(entriesAdded)
            .arg((maxDeletedEntryId != nil) ? "MAXDELETEDID" : nil).arg(maxDeletedEntryId)
        try await cmd.exec(self)
    }
    /// Trims the stream to (approximately if '~' is passed) a certain size
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N), with N being the number of evicted entries. Constant times are very small however, since entries are organized in macro nodes containing multiple entries that can be released with a single deallocation.
    /// ## History
    /// - 6.2.0, Added the `MINID` trimming strategy and the `LIMIT` option.
    /// ## Documentation
    /// view the docs for [XTRIM](https://redis.io/commands/xtrim)
    public func xtrim<T: FromRedisValue>(_ key: String, _ trim: XtrimTrim) async throws -> T {
        let cmd = Cmd("XTRIM").arg(key).arg(trim)
        return try await cmd.query(self)
    }
    /// Trims the stream to (approximately if '~' is passed) a certain size
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N), with N being the number of evicted entries. Constant times are very small however, since entries are organized in macro nodes containing multiple entries that can be released with a single deallocation.
    /// ## History
    /// - 6.2.0, Added the `MINID` trimming strategy and the `LIMIT` option.
    /// ## Documentation
    /// view the docs for [XTRIM](https://redis.io/commands/xtrim)
    public func xtrim(_ key: String, _ trim: XtrimTrim) async throws {
        let cmd = Cmd("XTRIM").arg(key).arg(trim)
        try await cmd.exec(self)
    }
    /// Add one or more members to a sorted set, or update its score if it already exists
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// - 3.0.2, Added the `XX`, `NX`, `CH` and `INCR` options.
    /// - 6.2.0, Added the `GT` and `LT` options.
    /// ## Documentation
    /// view the docs for [ZADD](https://redis.io/commands/zadd)
    public func zadd<T: FromRedisValue>(
        _ key: String, _ condition: ZaddCondition? = nil, _ comparison: ZaddComparison? = nil,
        _ scoreMember: ZaddScoremember..., options: ZaddOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZADD").arg(key).arg(condition).arg(comparison).arg(scoreMember).arg(options)
        return try await cmd.query(self)
    }
    /// Add one or more members to a sorted set, or update its score if it already exists
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// - 3.0.2, Added the `XX`, `NX`, `CH` and `INCR` options.
    /// - 6.2.0, Added the `GT` and `LT` options.
    /// ## Documentation
    /// view the docs for [ZADD](https://redis.io/commands/zadd)
    public func zadd(
        _ key: String, _ condition: ZaddCondition? = nil, _ comparison: ZaddComparison? = nil,
        _ scoreMember: ZaddScoremember..., options: ZaddOptions? = nil
    ) async throws {
        let cmd = Cmd("ZADD").arg(key).arg(condition).arg(comparison).arg(scoreMember).arg(options)
        try await cmd.exec(self)
    }
    /// Get the number of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZCARD](https://redis.io/commands/zcard)
    public func zcard<T: FromRedisValue>(_ key: String) async throws -> T {
        let cmd = Cmd("ZCARD").arg(key)
        return try await cmd.query(self)
    }
    /// Get the number of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZCARD](https://redis.io/commands/zcard)
    public func zcard(_ key: String) async throws {
        let cmd = Cmd("ZCARD").arg(key)
        try await cmd.exec(self)
    }
    /// Count the members in a sorted set with scores within the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZCOUNT](https://redis.io/commands/zcount)
    public func zcount<T: FromRedisValue>(_ key: String, _ min: Double, _ max: Double) async throws -> T {
        let cmd = Cmd("ZCOUNT").arg(key).arg(min).arg(max)
        return try await cmd.query(self)
    }
    /// Count the members in a sorted set with scores within the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZCOUNT](https://redis.io/commands/zcount)
    public func zcount(_ key: String, _ min: Double, _ max: Double) async throws {
        let cmd = Cmd("ZCOUNT").arg(key).arg(min).arg(max)
        try await cmd.exec(self)
    }
    /// Subtract multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFF](https://redis.io/commands/zdiff)
    public func zdiff<T: FromRedisValue>(_ numkeys: Int, _ key: String..., options: ZdiffOptions? = nil) async throws
        -> T
    {
        let cmd = Cmd("ZDIFF").arg(numkeys).arg(key).arg(options)
        return try await cmd.query(self)
    }
    /// Subtract multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFF](https://redis.io/commands/zdiff)
    public func zdiff(_ numkeys: Int, _ key: String..., options: ZdiffOptions? = nil) async throws {
        let cmd = Cmd("ZDIFF").arg(numkeys).arg(key).arg(options)
        try await cmd.exec(self)
    }
    /// Subtract multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFFSTORE](https://redis.io/commands/zdiffstore)
    public func zdiffstore<T: FromRedisValue>(_ destination: String, _ numkeys: Int, _ key: String...) async throws -> T
    {
        let cmd = Cmd("ZDIFFSTORE").arg(destination).arg(numkeys).arg(key)
        return try await cmd.query(self)
    }
    /// Subtract multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFFSTORE](https://redis.io/commands/zdiffstore)
    public func zdiffstore(_ destination: String, _ numkeys: Int, _ key: String...) async throws {
        let cmd = Cmd("ZDIFFSTORE").arg(destination).arg(numkeys).arg(key)
        try await cmd.exec(self)
    }
    /// Increment the score of a member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZINCRBY](https://redis.io/commands/zincrby)
    public func zincrby<T: FromRedisValue>(_ key: String, _ increment: Int, _ member: String) async throws -> T {
        let cmd = Cmd("ZINCRBY").arg(key).arg(increment).arg(member)
        return try await cmd.query(self)
    }
    /// Increment the score of a member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZINCRBY](https://redis.io/commands/zincrby)
    public func zincrby(_ key: String, _ increment: Int, _ member: String) async throws {
        let cmd = Cmd("ZINCRBY").arg(key).arg(increment).arg(member)
        try await cmd.exec(self)
    }
    /// Intersect multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTER](https://redis.io/commands/zinter)
    public func zinter<T: FromRedisValue>(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterAggregate? = nil,
        _ options: ZinterOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZINTER").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        return try await cmd.query(self)
    }
    /// Intersect multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTER](https://redis.io/commands/zinter)
    public func zinter(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterAggregate? = nil,
        _ options: ZinterOptions? = nil
    ) async throws {
        let cmd = Cmd("ZINTER").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        try await cmd.exec(self)
    }
    /// Intersect multiple sorted sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*K) worst case with N being the smallest input sorted set, K being the number of input sorted sets.
    /// ## Documentation
    /// view the docs for [ZINTERCARD](https://redis.io/commands/zintercard)
    public func zintercard<T: FromRedisValue>(_ numkeys: Int, _ key: String..., limit: Int? = nil) async throws -> T {
        let cmd = Cmd("ZINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        return try await cmd.query(self)
    }
    /// Intersect multiple sorted sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*K) worst case with N being the smallest input sorted set, K being the number of input sorted sets.
    /// ## Documentation
    /// view the docs for [ZINTERCARD](https://redis.io/commands/zintercard)
    public func zintercard(_ numkeys: Int, _ key: String..., limit: Int? = nil) async throws {
        let cmd = Cmd("ZINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        try await cmd.exec(self)
    }
    /// Intersect multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTERSTORE](https://redis.io/commands/zinterstore)
    public func zinterstore<T: FromRedisValue>(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterstoreAggregate? = nil
    ) async throws -> T {
        let cmd = Cmd("ZINTERSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        return try await cmd.query(self)
    }
    /// Intersect multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTERSTORE](https://redis.io/commands/zinterstore)
    public func zinterstore(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterstoreAggregate? = nil
    ) async throws {
        let cmd = Cmd("ZINTERSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        try await cmd.exec(self)
    }
    /// Count the number of members in a sorted set between a given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZLEXCOUNT](https://redis.io/commands/zlexcount)
    public func zlexcount<T: FromRedisValue>(_ key: String, _ min: String, _ max: String) async throws -> T {
        let cmd = Cmd("ZLEXCOUNT").arg(key).arg(min).arg(max)
        return try await cmd.query(self)
    }
    /// Count the number of members in a sorted set between a given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZLEXCOUNT](https://redis.io/commands/zlexcount)
    public func zlexcount(_ key: String, _ min: String, _ max: String) async throws {
        let cmd = Cmd("ZLEXCOUNT").arg(key).arg(min).arg(max)
        try await cmd.exec(self)
    }
    /// Remove and return members with scores in a sorted set
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZMPOP](https://redis.io/commands/zmpop)
    public func zmpop<T: FromRedisValue>(_ numkeys: Int, _ key: String..., rWhere: ZmpopRwhere, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("ZMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and return members with scores in a sorted set
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZMPOP](https://redis.io/commands/zmpop)
    public func zmpop(_ numkeys: Int, _ key: String..., rWhere: ZmpopRwhere, _ count: Int? = nil) async throws {
        let cmd = Cmd("ZMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        try await cmd.exec(self)
    }
    /// Get the score associated with the given members in a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members being requested.
    /// ## Documentation
    /// view the docs for [ZMSCORE](https://redis.io/commands/zmscore)
    public func zmscore<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("ZMSCORE").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Get the score associated with the given members in a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members being requested.
    /// ## Documentation
    /// view the docs for [ZMSCORE](https://redis.io/commands/zmscore)
    public func zmscore(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("ZMSCORE").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Remove and return members with the highest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMAX](https://redis.io/commands/zpopmax)
    public func zpopmax<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("ZPOPMAX").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and return members with the highest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMAX](https://redis.io/commands/zpopmax)
    public func zpopmax(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("ZPOPMAX").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Remove and return members with the lowest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMIN](https://redis.io/commands/zpopmin)
    public func zpopmin<T: FromRedisValue>(_ key: String, _ count: Int? = nil) async throws -> T {
        let cmd = Cmd("ZPOPMIN").arg(key).arg(count)
        return try await cmd.query(self)
    }
    /// Remove and return members with the lowest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMIN](https://redis.io/commands/zpopmin)
    public func zpopmin(_ key: String, _ count: Int? = nil) async throws {
        let cmd = Cmd("ZPOPMIN").arg(key).arg(count)
        try await cmd.exec(self)
    }
    /// Get one or multiple random elements from a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## Documentation
    /// view the docs for [ZRANDMEMBER](https://redis.io/commands/zrandmember)
    public func zrandmember<T: FromRedisValue>(_ key: String, _ options: ZrandmemberOptions? = nil) async throws -> T {
        let cmd = Cmd("ZRANDMEMBER").arg(key).arg(options)
        return try await cmd.query(self)
    }
    /// Get one or multiple random elements from a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## Documentation
    /// view the docs for [ZRANDMEMBER](https://redis.io/commands/zrandmember)
    public func zrandmember(_ key: String, _ options: ZrandmemberOptions? = nil) async throws {
        let cmd = Cmd("ZRANDMEMBER").arg(key).arg(options)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## History
    /// - 6.2.0, Added the `REV`, `BYSCORE`, `BYLEX` and `LIMIT` options.
    /// ## Documentation
    /// view the docs for [ZRANGE](https://redis.io/commands/zrange)
    public func zrange<T: FromRedisValue>(
        _ key: String, _ start: String, _ stop: String, _ sortby: ZrangeSortby? = nil,
        _ offsetCount: ZrangeOffsetcount? = nil, _ options: ZrangeOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZRANGE").arg(key).arg(start).arg(stop).arg(sortby).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## History
    /// - 6.2.0, Added the `REV`, `BYSCORE`, `BYLEX` and `LIMIT` options.
    /// ## Documentation
    /// view the docs for [ZRANGE](https://redis.io/commands/zrange)
    public func zrange(
        _ key: String, _ start: String, _ stop: String, _ sortby: ZrangeSortby? = nil,
        _ offsetCount: ZrangeOffsetcount? = nil, _ options: ZrangeOptions? = nil
    ) async throws {
        let cmd = Cmd("ZRANGE").arg(key).arg(start).arg(stop).arg(sortby).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set, by lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZRANGEBYLEX](https://redis.io/commands/zrangebylex)
    public func zrangebylex<T: FromRedisValue>(
        _ key: String, _ min: String, _ max: String, _ offsetCount: ZrangebylexOffsetcount? = nil
    ) async throws -> T {
        let cmd = Cmd("ZRANGEBYLEX").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set, by lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZRANGEBYLEX](https://redis.io/commands/zrangebylex)
    public func zrangebylex(_ key: String, _ min: String, _ max: String, _ offsetCount: ZrangebylexOffsetcount? = nil)
        async throws
    {
        let cmd = Cmd("ZRANGEBYLEX").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set, by score
    /// ## Available since
    /// 1.0.5
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.0.0, Added the `WITHSCORES` modifier.
    /// ## Documentation
    /// view the docs for [ZRANGEBYSCORE](https://redis.io/commands/zrangebyscore)
    public func zrangebyscore<T: FromRedisValue>(
        _ key: String, _ min: Double, _ max: Double, _ offsetCount: ZrangebyscoreOffsetcount? = nil,
        _ options: ZrangebyscoreOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZRANGEBYSCORE").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set, by score
    /// ## Available since
    /// 1.0.5
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.0.0, Added the `WITHSCORES` modifier.
    /// ## Documentation
    /// view the docs for [ZRANGEBYSCORE](https://redis.io/commands/zrangebyscore)
    public func zrangebyscore(
        _ key: String, _ min: Double, _ max: Double, _ offsetCount: ZrangebyscoreOffsetcount? = nil,
        _ options: ZrangebyscoreOptions? = nil
    ) async throws {
        let cmd = Cmd("ZRANGEBYSCORE").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        try await cmd.exec(self)
    }
    /// Store a range of members from sorted set into another key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements stored into the destination key.
    /// ## Documentation
    /// view the docs for [ZRANGESTORE](https://redis.io/commands/zrangestore)
    public func zrangestore<T: FromRedisValue>(
        _ dst: String, _ src: String, _ min: String, _ max: String, _ sortby: ZrangestoreSortby? = nil,
        _ offsetCount: ZrangestoreOffsetcount? = nil, _ options: ZrangestoreOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZRANGESTORE").arg(dst).arg(src).arg(min).arg(max).arg(sortby).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg(options)
        return try await cmd.query(self)
    }
    /// Store a range of members from sorted set into another key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements stored into the destination key.
    /// ## Documentation
    /// view the docs for [ZRANGESTORE](https://redis.io/commands/zrangestore)
    public func zrangestore(
        _ dst: String, _ src: String, _ min: String, _ max: String, _ sortby: ZrangestoreSortby? = nil,
        _ offsetCount: ZrangestoreOffsetcount? = nil, _ options: ZrangestoreOptions? = nil
    ) async throws {
        let cmd = Cmd("ZRANGESTORE").arg(dst).arg(src).arg(min).arg(max).arg(sortby).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg(options)
        try await cmd.exec(self)
    }
    /// Determine the index of a member in a sorted set
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZRANK](https://redis.io/commands/zrank)
    public func zrank<T: FromRedisValue>(_ key: String, _ member: String) async throws -> T {
        let cmd = Cmd("ZRANK").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Determine the index of a member in a sorted set
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZRANK](https://redis.io/commands/zrank)
    public func zrank(_ key: String, _ member: String) async throws {
        let cmd = Cmd("ZRANK").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Remove one or more members from a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(M*log(N)) with N being the number of elements in the sorted set and M the number of elements to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// ## Documentation
    /// view the docs for [ZREM](https://redis.io/commands/zrem)
    public func zrem<T: FromRedisValue>(_ key: String, _ member: String...) async throws -> T {
        let cmd = Cmd("ZREM").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Remove one or more members from a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(M*log(N)) with N being the number of elements in the sorted set and M the number of elements to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// ## Documentation
    /// view the docs for [ZREM](https://redis.io/commands/zrem)
    public func zrem(_ key: String, _ member: String...) async throws {
        let cmd = Cmd("ZREM").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Remove all members in a sorted set between the given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYLEX](https://redis.io/commands/zremrangebylex)
    public func zremrangebylex<T: FromRedisValue>(_ key: String, _ min: String, _ max: String) async throws -> T {
        let cmd = Cmd("ZREMRANGEBYLEX").arg(key).arg(min).arg(max)
        return try await cmd.query(self)
    }
    /// Remove all members in a sorted set between the given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYLEX](https://redis.io/commands/zremrangebylex)
    public func zremrangebylex(_ key: String, _ min: String, _ max: String) async throws {
        let cmd = Cmd("ZREMRANGEBYLEX").arg(key).arg(min).arg(max)
        try await cmd.exec(self)
    }
    /// Remove all members in a sorted set within the given indexes
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYRANK](https://redis.io/commands/zremrangebyrank)
    public func zremrangebyrank<T: FromRedisValue>(_ key: String, _ start: Int, _ stop: Int) async throws -> T {
        let cmd = Cmd("ZREMRANGEBYRANK").arg(key).arg(start).arg(stop)
        return try await cmd.query(self)
    }
    /// Remove all members in a sorted set within the given indexes
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYRANK](https://redis.io/commands/zremrangebyrank)
    public func zremrangebyrank(_ key: String, _ start: Int, _ stop: Int) async throws {
        let cmd = Cmd("ZREMRANGEBYRANK").arg(key).arg(start).arg(stop)
        try await cmd.exec(self)
    }
    /// Remove all members in a sorted set within the given scores
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYSCORE](https://redis.io/commands/zremrangebyscore)
    public func zremrangebyscore<T: FromRedisValue>(_ key: String, _ min: Double, _ max: Double) async throws -> T {
        let cmd = Cmd("ZREMRANGEBYSCORE").arg(key).arg(min).arg(max)
        return try await cmd.query(self)
    }
    /// Remove all members in a sorted set within the given scores
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYSCORE](https://redis.io/commands/zremrangebyscore)
    public func zremrangebyscore(_ key: String, _ min: Double, _ max: Double) async throws {
        let cmd = Cmd("ZREMRANGEBYSCORE").arg(key).arg(min).arg(max)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set, by index, with scores ordered from high to low
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## Documentation
    /// view the docs for [ZREVRANGE](https://redis.io/commands/zrevrange)
    public func zrevrange<T: FromRedisValue>(
        _ key: String, _ start: Int, _ stop: Int, _ options: ZrevrangeOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZREVRANGE").arg(key).arg(start).arg(stop).arg(options)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set, by index, with scores ordered from high to low
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## Documentation
    /// view the docs for [ZREVRANGE](https://redis.io/commands/zrevrange)
    public func zrevrange(_ key: String, _ start: Int, _ stop: Int, _ options: ZrevrangeOptions? = nil) async throws {
        let cmd = Cmd("ZREVRANGE").arg(key).arg(start).arg(stop).arg(options)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set, by lexicographical range, ordered from higher to lower strings.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYLEX](https://redis.io/commands/zrevrangebylex)
    public func zrevrangebylex<T: FromRedisValue>(
        _ key: String, _ max: String, _ min: String, _ offsetCount: ZrevrangebylexOffsetcount? = nil
    ) async throws -> T {
        let cmd = Cmd("ZREVRANGEBYLEX").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set, by lexicographical range, ordered from higher to lower strings.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYLEX](https://redis.io/commands/zrevrangebylex)
    public func zrevrangebylex(
        _ key: String, _ max: String, _ min: String, _ offsetCount: ZrevrangebylexOffsetcount? = nil
    ) async throws {
        let cmd = Cmd("ZREVRANGEBYLEX").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        try await cmd.exec(self)
    }
    /// Return a range of members in a sorted set, by score, with scores ordered from high to low
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.1.6, `min` and `max` can be exclusive.
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYSCORE](https://redis.io/commands/zrevrangebyscore)
    public func zrevrangebyscore<T: FromRedisValue>(
        _ key: String, _ max: Double, _ min: Double, _ offsetCount: ZrevrangebyscoreOffsetcount? = nil,
        _ options: ZrevrangebyscoreOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZREVRANGEBYSCORE").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return try await cmd.query(self)
    }
    /// Return a range of members in a sorted set, by score, with scores ordered from high to low
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.1.6, `min` and `max` can be exclusive.
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYSCORE](https://redis.io/commands/zrevrangebyscore)
    public func zrevrangebyscore(
        _ key: String, _ max: Double, _ min: Double, _ offsetCount: ZrevrangebyscoreOffsetcount? = nil,
        _ options: ZrevrangebyscoreOptions? = nil
    ) async throws {
        let cmd = Cmd("ZREVRANGEBYSCORE").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        try await cmd.exec(self)
    }
    /// Determine the index of a member in a sorted set, with scores ordered from high to low
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZREVRANK](https://redis.io/commands/zrevrank)
    public func zrevrank<T: FromRedisValue>(_ key: String, _ member: String) async throws -> T {
        let cmd = Cmd("ZREVRANK").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Determine the index of a member in a sorted set, with scores ordered from high to low
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZREVRANK](https://redis.io/commands/zrevrank)
    public func zrevrank(_ key: String, _ member: String) async throws {
        let cmd = Cmd("ZREVRANK").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Incrementally iterate sorted sets elements and associated scores
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [ZSCAN](https://redis.io/commands/zscan)
    public func zscan<T: FromRedisValue>(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil)
        async throws -> T
    {
        let cmd = Cmd("ZSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return try await cmd.query(self)
    }
    /// Incrementally iterate sorted sets elements and associated scores
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [ZSCAN](https://redis.io/commands/zscan)
    public func zscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) async throws {
        let cmd = Cmd("ZSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        try await cmd.exec(self)
    }
    /// Get the score associated with the given member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZSCORE](https://redis.io/commands/zscore)
    public func zscore<T: FromRedisValue>(_ key: String, _ member: String) async throws -> T {
        let cmd = Cmd("ZSCORE").arg(key).arg(member)
        return try await cmd.query(self)
    }
    /// Get the score associated with the given member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZSCORE](https://redis.io/commands/zscore)
    public func zscore(_ key: String, _ member: String) async throws {
        let cmd = Cmd("ZSCORE").arg(key).arg(member)
        try await cmd.exec(self)
    }
    /// Add multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N)+O(M*log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNION](https://redis.io/commands/zunion)
    public func zunion<T: FromRedisValue>(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionAggregate? = nil,
        _ options: ZunionOptions? = nil
    ) async throws -> T {
        let cmd = Cmd("ZUNION").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        return try await cmd.query(self)
    }
    /// Add multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N)+O(M*log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNION](https://redis.io/commands/zunion)
    public func zunion(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionAggregate? = nil,
        _ options: ZunionOptions? = nil
    ) async throws {
        let cmd = Cmd("ZUNION").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        try await cmd.exec(self)
    }
    /// Add multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N)+O(M log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNIONSTORE](https://redis.io/commands/zunionstore)
    public func zunionstore<T: FromRedisValue>(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionstoreAggregate? = nil
    ) async throws -> T {
        let cmd = Cmd("ZUNIONSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        return try await cmd.query(self)
    }
    /// Add multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N)+O(M log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNIONSTORE](https://redis.io/commands/zunionstore)
    public func zunionstore(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionstoreAggregate? = nil
    ) async throws {
        let cmd = Cmd("ZUNIONSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// A container for Access List Control commands
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [ACL](https://redis.io/commands/acl)
    public func acl() -> Self {
        let cmd = Cmd("ACL")
        return self.add_command(cmd)
    }
    /// Append a value to a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1). The amortized time complexity is O(1) assuming the appended value is small and the already present value is of any size, since the dynamic string library used by Redis will double the free space available on every reallocation.
    /// ## Documentation
    /// view the docs for [APPEND](https://redis.io/commands/append)
    public func append(_ key: String, _ value: String) -> Self {
        let cmd = Cmd("APPEND").arg(key).arg(value)
        return self.add_command(cmd)
    }
    /// Sent by cluster clients after an -ASK redirect
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ASKING](https://redis.io/commands/asking)
    public func asking() -> Self {
        let cmd = Cmd("ASKING")
        return self.add_command(cmd)
    }
    /// Authenticate to the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of passwords defined for the user
    /// ## History
    /// - 6.0.0, Added ACL style (username and password).
    /// ## Documentation
    /// view the docs for [AUTH](https://redis.io/commands/auth)
    public func auth(_ username: String? = nil, _ password: String) -> Self {
        let cmd = Cmd("AUTH").arg(username).arg(password)
        return self.add_command(cmd)
    }
    /// Asynchronously rewrite the append-only file
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BGREWRITEAOF](https://redis.io/commands/bgrewriteaof)
    public func bgrewriteaof() -> Self {
        let cmd = Cmd("BGREWRITEAOF")
        return self.add_command(cmd)
    }
    /// Asynchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.2, Added the `SCHEDULE` option.
    /// ## Documentation
    /// view the docs for [BGSAVE](https://redis.io/commands/bgsave)
    public func bgsave(_ options: BgsaveOptions? = nil) -> Self {
        let cmd = Cmd("BGSAVE").arg(options)
        return self.add_command(cmd)
    }
    /// Count set bits in a string
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITCOUNT](https://redis.io/commands/bitcount)
    public func bitcount(_ key: String, _ index: BitcountIndex? = nil) -> Self {
        let cmd = Cmd("BITCOUNT").arg(key).arg(index)
        return self.add_command(cmd)
    }
    /// Perform arbitrary bitfield integer operations on strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD](https://redis.io/commands/bitfield)
    public func bitfield(_ key: String, _ operation: BitfieldOperation...) -> Self {
        let cmd = Cmd("BITFIELD").arg(key).arg(operation)
        return self.add_command(cmd)
    }
    /// Perform arbitrary bitfield integer operations on strings. Read-only variant of BITFIELD
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1) for each subcommand specified
    /// ## Documentation
    /// view the docs for [BITFIELD_RO](https://redis.io/commands/bitfield-ro)
    public func bitfield_ro(_ key: String, _ encodingOffset: BitfieldRoEncodingoffset...) -> Self {
        let cmd = Cmd("BITFIELD_RO").arg(key).arg((!encodingOffset.isEmpty) ? "GET" : nil).arg(encodingOffset)
        return self.add_command(cmd)
    }
    /// Perform bitwise operations between strings
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(N)
    /// ## Documentation
    /// view the docs for [BITOP](https://redis.io/commands/bitop)
    public func bitop(_ operation: String, _ destkey: String, _ key: String...) -> Self {
        let cmd = Cmd("BITOP").arg(operation).arg(destkey).arg(key)
        return self.add_command(cmd)
    }
    /// Find first bit set or clear in a string
    /// ## Available since
    /// 2.8.7
    /// ## Time complexity
    /// O(N)
    /// ## History
    /// - 7.0.0, Added the `BYTE|BIT` option.
    /// ## Documentation
    /// view the docs for [BITPOS](https://redis.io/commands/bitpos)
    public func bitpos(_ key: String, _ bit: Int, _ index: BitposIndex? = nil) -> Self {
        let cmd = Cmd("BITPOS").arg(key).arg(bit).arg(index)
        return self.add_command(cmd)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [BLMOVE](https://redis.io/commands/blmove)
    public func blmove(
        _ source: String, _ destination: String, _ wherefrom: BlmoveWherefrom, _ whereto: BlmoveWhereto,
        _ timeout: Double
    ) -> Self {
        let cmd = Cmd("BLMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto).arg(timeout)
        return self.add_command(cmd)
    }
    /// Pop elements from a list, or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [BLMPOP](https://redis.io/commands/blmpop)
    public func blmpop(_ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BlmpopRwhere, _ count: Int? = nil)
        -> Self
    {
        let cmd = Cmd("BLMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        return self.add_command(cmd)
    }
    /// Remove and get the first element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BLPOP](https://redis.io/commands/blpop)
    public func blpop(_ key: String..., timeout: Double) -> Self {
        let cmd = Cmd("BLPOP").arg(key).arg(timeout)
        return self.add_command(cmd)
    }
    /// Remove and get the last element in a list, or block until one is available
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of provided keys.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOP](https://redis.io/commands/brpop)
    public func brpop(_ key: String..., timeout: Double) -> Self {
        let cmd = Cmd("BRPOP").arg(key).arg(timeout)
        return self.add_command(cmd)
    }
    /// Pop an element from a list, push it to another list and return it; or block until one is available
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BRPOPLPUSH](https://redis.io/commands/brpoplpush)
    public func brpoplpush(_ source: String, _ destination: String, _ timeout: Double) -> Self {
        let cmd = Cmd("BRPOPLPUSH").arg(source).arg(destination).arg(timeout)
        return self.add_command(cmd)
    }
    /// Remove and return members with scores in a sorted set or block until one is available
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [BZMPOP](https://redis.io/commands/bzmpop)
    public func bzmpop(_ timeout: Double, _ numkeys: Int, _ key: String..., rWhere: BzmpopRwhere, _ count: Int? = nil)
        -> Self
    {
        let cmd = Cmd("BZMPOP").arg(timeout).arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(
            count)
        return self.add_command(cmd)
    }
    /// Remove and return the member with the highest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMAX](https://redis.io/commands/bzpopmax)
    public func bzpopmax(_ key: String..., timeout: Double) -> Self {
        let cmd = Cmd("BZPOPMAX").arg(key).arg(timeout)
        return self.add_command(cmd)
    }
    /// Remove and return the member with the lowest score from one or more sorted sets, or block until one is available
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## History
    /// - 6.0.0, `timeout` is interpreted as a double instead of an integer.
    /// ## Documentation
    /// view the docs for [BZPOPMIN](https://redis.io/commands/bzpopmin)
    public func bzpopmin(_ key: String..., timeout: Double) -> Self {
        let cmd = Cmd("BZPOPMIN").arg(key).arg(timeout)
        return self.add_command(cmd)
    }
    /// A container for client connection commands
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLIENT](https://redis.io/commands/client)
    public func client() -> Self {
        let cmd = Cmd("CLIENT")
        return self.add_command(cmd)
    }
    /// A container for cluster commands
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CLUSTER](https://redis.io/commands/cluster)
    public func cluster() -> Self {
        let cmd = Cmd("CLUSTER")
        return self.add_command(cmd)
    }
    /// Get array of Redis command details
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// O(N) where N is the total number of Redis commands
    /// ## Documentation
    /// view the docs for [COMMAND](https://redis.io/commands/command)
    public func command() -> Self {
        let cmd = Cmd("COMMAND")
        return self.add_command(cmd)
    }
    /// A container for server configuration commands
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [CONFIG](https://redis.io/commands/config)
    public func config() -> Self {
        let cmd = Cmd("CONFIG")
        return self.add_command(cmd)
    }
    /// Copy a key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) worst case for collections, where N is the number of nested items. O(1) for string values.
    /// ## Documentation
    /// view the docs for [COPY](https://redis.io/commands/copy)
    public func copy(
        _ source: String, _ destination: String, _ destinationDb: Int? = nil, _ options: CopyOptions? = nil
    ) -> Self {
        let cmd = Cmd("COPY").arg(source).arg(destination).arg((destinationDb != nil) ? "DB" : nil).arg(destinationDb)
            .arg(options)
        return self.add_command(cmd)
    }
    /// Return the number of keys in the selected database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DBSIZE](https://redis.io/commands/dbsize)
    public func dbsize() -> Self {
        let cmd = Cmd("DBSIZE")
        return self.add_command(cmd)
    }
    /// A container for debugging commands
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [DEBUG](https://redis.io/commands/debug)
    public func debug() -> Self {
        let cmd = Cmd("DEBUG")
        return self.add_command(cmd)
    }
    /// Decrement the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECR](https://redis.io/commands/decr)
    public func decr(_ key: String) -> Self {
        let cmd = Cmd("DECR").arg(key)
        return self.add_command(cmd)
    }
    /// Decrement the integer value of a key by the given number
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [DECRBY](https://redis.io/commands/decrby)
    public func decrby(_ key: String, _ decrement: Int) -> Self {
        let cmd = Cmd("DECRBY").arg(key).arg(decrement)
        return self.add_command(cmd)
    }
    /// Delete a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be removed. When a key to remove holds a value other than a string, the individual complexity for this key is O(M) where M is the number of elements in the list, set, sorted set or hash. Removing a single key that holds a string value is O(1).
    /// ## Documentation
    /// view the docs for [DEL](https://redis.io/commands/del)
    public func del(_ key: String...) -> Self {
        let cmd = Cmd("DEL").arg(key)
        return self.add_command(cmd)
    }
    /// Discard all commands issued after MULTI
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N), when N is the number of queued commands
    /// ## Documentation
    /// view the docs for [DISCARD](https://redis.io/commands/discard)
    public func discard() -> Self {
        let cmd = Cmd("DISCARD")
        return self.add_command(cmd)
    }
    /// Return a serialized version of the value stored at the specified key.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to access the key and additional O(N*M) to serialize it, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1).
    /// ## Documentation
    /// view the docs for [DUMP](https://redis.io/commands/dump)
    public func dump(_ key: String) -> Self {
        let cmd = Cmd("DUMP").arg(key)
        return self.add_command(cmd)
    }
    /// Echo the given string
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ECHO](https://redis.io/commands/echo)
    public func echo(_ message: String) -> Self {
        let cmd = Cmd("ECHO").arg(message)
        return self.add_command(cmd)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL](https://redis.io/commands/eval)
    public func eval(_ script: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("EVAL").arg(script).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Execute a Lua script server side
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA](https://redis.io/commands/evalsha)
    public func evalsha(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("EVALSHA").arg(sha1).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVALSHA_RO](https://redis.io/commands/evalsha-ro)
    public func evalsha_ro(_ sha1: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("EVALSHA_RO").arg(sha1).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Execute a read-only Lua script server side
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the script that is executed.
    /// ## Documentation
    /// view the docs for [EVAL_RO](https://redis.io/commands/eval-ro)
    public func eval_ro(_ script: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("EVAL_RO").arg(script).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Execute all commands issued after MULTI
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// Depends on commands in the transaction
    /// ## Documentation
    /// view the docs for [EXEC](https://redis.io/commands/exec)
    public func exec() -> Self {
        let cmd = Cmd("EXEC")
        return self.add_command(cmd)
    }
    /// Determine if a key exists
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to check.
    /// ## History
    /// - 3.0.3, Accepts multiple `key` arguments.
    /// ## Documentation
    /// view the docs for [EXISTS](https://redis.io/commands/exists)
    public func exists(_ key: String...) -> Self {
        let cmd = Cmd("EXISTS").arg(key)
        return self.add_command(cmd)
    }
    /// Set a key's time to live in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIRE](https://redis.io/commands/expire)
    public func expire(_ key: String, _ seconds: Int, _ condition: ExpireCondition? = nil) -> Self {
        let cmd = Cmd("EXPIRE").arg(key).arg(seconds).arg(condition)
        return self.add_command(cmd)
    }
    /// Set the expiration for a key as a UNIX timestamp
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [EXPIREAT](https://redis.io/commands/expireat)
    public func expireat(_ key: String, _ unixTimeSeconds: Int64, _ condition: ExpireatCondition? = nil) -> Self {
        let cmd = Cmd("EXPIREAT").arg(key).arg(unixTimeSeconds).arg(condition)
        return self.add_command(cmd)
    }
    /// Get the expiration Unix timestamp for a key
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [EXPIRETIME](https://redis.io/commands/expiretime)
    public func expiretime(_ key: String) -> Self {
        let cmd = Cmd("EXPIRETIME").arg(key)
        return self.add_command(cmd)
    }
    /// Start a coordinated failover between this server and one of its replicas.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [FAILOVER](https://redis.io/commands/failover)
    public func failover(_ target: FailoverTarget? = nil, _ milliseconds: Int? = nil, _ options: FailoverOptions? = nil)
        -> Self
    {
        let cmd = Cmd("FAILOVER").arg((target != nil) ? "TO" : nil).arg(target).arg(
            (milliseconds != nil) ? "TIMEOUT" : nil
        ).arg(milliseconds).arg(options)
        return self.add_command(cmd)
    }
    /// Invoke a function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL](https://redis.io/commands/fcall)
    public func fcall(_ function: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("FCALL").arg(function).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Invoke a read-only function
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on the function that is executed.
    /// ## Documentation
    /// view the docs for [FCALL_RO](https://redis.io/commands/fcall-ro)
    public func fcall_ro(_ function: String, _ numkeys: Int, _ key: String..., arg: String...) -> Self {
        let cmd = Cmd("FCALL_RO").arg(function).arg(numkeys).arg(key).arg(arg)
        return self.add_command(cmd)
    }
    /// Remove all keys from all databases
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHALL](https://redis.io/commands/flushall)
    public func flushall(_ async: FlushallAsync? = nil) -> Self {
        let cmd = Cmd("FLUSHALL").arg(async)
        return self.add_command(cmd)
    }
    /// Remove all keys from the current database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys in the selected database
    /// ## History
    /// - 4.0.0, Added the `ASYNC` flushing mode modifier.
    /// - 6.2.0, Added the `SYNC` flushing mode modifier.
    /// ## Documentation
    /// view the docs for [FLUSHDB](https://redis.io/commands/flushdb)
    public func flushdb(_ async: FlushdbAsync? = nil) -> Self {
        let cmd = Cmd("FLUSHDB").arg(async)
        return self.add_command(cmd)
    }
    /// A container for function commands
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [FUNCTION](https://redis.io/commands/function)
    public func function() -> Self {
        let cmd = Cmd("FUNCTION")
        return self.add_command(cmd)
    }
    /// Add one or more geospatial items in the geospatial index represented using a sorted set
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 6.2.0, Added the `CH`, `NX` and `XX` options.
    /// ## Documentation
    /// view the docs for [GEOADD](https://redis.io/commands/geoadd)
    public func geoadd(
        _ key: String, _ condition: GeoaddCondition? = nil, _ longitudeLatitudeMember: GeoaddLongitudelatitudemember...,
        options: GeoaddOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEOADD").arg(key).arg(condition).arg(longitudeLatitudeMember).arg(options)
        return self.add_command(cmd)
    }
    /// Returns the distance between two members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [GEODIST](https://redis.io/commands/geodist)
    public func geodist(_ key: String, _ member1: String, _ member2: String, _ unit: GeodistUnit? = nil) -> Self {
        let cmd = Cmd("GEODIST").arg(key).arg(member1).arg(member2).arg(unit)
        return self.add_command(cmd)
    }
    /// Returns members of a geospatial index as standard geohash strings
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(log(N)) for each member requested, where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [GEOHASH](https://redis.io/commands/geohash)
    public func geohash(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("GEOHASH").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Returns longitude and latitude of members of a geospatial index
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members requested.
    /// ## Documentation
    /// view the docs for [GEOPOS](https://redis.io/commands/geopos)
    public func geopos(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("GEOPOS").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a point
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUS](https://redis.io/commands/georadius)
    public func georadius(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusUnit,
        _ count: GeoradiusCount? = nil, _ order: GeoradiusOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEORADIUS").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg((STORE != nil) ? "STORE" : nil).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST)
            .arg(options)
        return self.add_command(cmd)
    }
    /// Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a member
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER](https://redis.io/commands/georadiusbymember)
    public func georadiusbymember(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberUnit,
        _ count: GeoradiusbymemberCount? = nil, _ order: GeoradiusbymemberOrder? = nil, _ STORE: String? = nil,
        _ STOREDIST: String? = nil, _ options: GeoradiusbymemberOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEORADIUSBYMEMBER").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            (STORE != nil) ? "STORE" : nil
        ).arg(STORE).arg((STOREDIST != nil) ? "STOREDIST" : nil).arg(STOREDIST).arg(options)
        return self.add_command(cmd)
    }
    /// A read-only variant for GEORADIUSBYMEMBER
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## Documentation
    /// view the docs for [GEORADIUSBYMEMBER_RO](https://redis.io/commands/georadiusbymember-ro)
    public func georadiusbymember_ro(
        _ key: String, _ member: String, _ radius: Double, _ unit: GeoradiusbymemberRoUnit,
        _ count: GeoradiusbymemberRoCount? = nil, _ order: GeoradiusbymemberRoOrder? = nil,
        _ options: GeoradiusbymemberRoOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEORADIUSBYMEMBER_RO").arg(key).arg(member).arg(radius).arg(unit).arg(count).arg(order).arg(
            options)
        return self.add_command(cmd)
    }
    /// A read-only variant for GEORADIUS
    /// ## Available since
    /// 3.2.10
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements inside the bounding box of the circular area delimited by center and radius and M is the number of items inside the index.
    /// ## History
    /// - 6.2.0, Added the `ANY` option for `COUNT`.
    /// ## Documentation
    /// view the docs for [GEORADIUS_RO](https://redis.io/commands/georadius-ro)
    public func georadius_ro(
        _ key: String, _ longitude: Double, _ latitude: Double, _ radius: Double, _ unit: GeoradiusRoUnit,
        _ count: GeoradiusRoCount? = nil, _ order: GeoradiusRoOrder? = nil, _ options: GeoradiusRoOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEORADIUS_RO").arg(key).arg(longitude).arg(latitude).arg(radius).arg(unit).arg(count).arg(order)
            .arg(options)
        return self.add_command(cmd)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCH](https://redis.io/commands/geosearch)
    public func geosearch(
        _ key: String, _ from: GeosearchFrom, _ by: GeosearchBy, _ order: GeosearchOrder? = nil,
        _ count: GeosearchCount? = nil, _ options: GeosearchOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEOSEARCH").arg(key).arg(from).arg(by).arg(order).arg(count).arg(options)
        return self.add_command(cmd)
    }
    /// Query a sorted set representing a geospatial index to fetch members inside an area of a box or a circle, and store the result in another key.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N+log(M)) where N is the number of elements in the grid-aligned bounding box area around the shape provided as the filter and M is the number of items inside the shape
    /// ## History
    /// - 7.0.0, Added support for uppercase unit names.
    /// ## Documentation
    /// view the docs for [GEOSEARCHSTORE](https://redis.io/commands/geosearchstore)
    public func geosearchstore(
        _ destination: String, _ source: String, _ from: GeosearchstoreFrom, _ by: GeosearchstoreBy,
        _ order: GeosearchstoreOrder? = nil, _ count: GeosearchstoreCount? = nil,
        _ options: GeosearchstoreOptions? = nil
    ) -> Self {
        let cmd = Cmd("GEOSEARCHSTORE").arg(destination).arg(source).arg(from).arg(by).arg(order).arg(count).arg(
            options)
        return self.add_command(cmd)
    }
    /// Get the value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GET](https://redis.io/commands/get)
    public func get(_ key: String) -> Self {
        let cmd = Cmd("GET").arg(key)
        return self.add_command(cmd)
    }
    /// Returns the bit value at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETBIT](https://redis.io/commands/getbit)
    public func getbit(_ key: String, _ offset: Int) -> Self {
        let cmd = Cmd("GETBIT").arg(key).arg(offset)
        return self.add_command(cmd)
    }
    /// Get the value of a key and delete the key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETDEL](https://redis.io/commands/getdel)
    public func getdel(_ key: String) -> Self {
        let cmd = Cmd("GETDEL").arg(key)
        return self.add_command(cmd)
    }
    /// Get the value of a key and optionally set its expiration
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETEX](https://redis.io/commands/getex)
    public func getex(_ key: String, _ expiration: GetexExpiration? = nil) -> Self {
        let cmd = Cmd("GETEX").arg(key).arg(expiration)
        return self.add_command(cmd)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 2.4.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [GETRANGE](https://redis.io/commands/getrange)
    public func getrange(_ key: String, _ start: Int, _ end: Int) -> Self {
        let cmd = Cmd("GETRANGE").arg(key).arg(start).arg(end)
        return self.add_command(cmd)
    }
    /// Set the string value of a key and return its old value
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [GETSET](https://redis.io/commands/getset)
    public func getset(_ key: String, _ value: String) -> Self {
        let cmd = Cmd("GETSET").arg(key).arg(value)
        return self.add_command(cmd)
    }
    /// Delete one or more hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `field` arguments.
    /// ## Documentation
    /// view the docs for [HDEL](https://redis.io/commands/hdel)
    public func hdel(_ key: String, _ field: String...) -> Self {
        let cmd = Cmd("HDEL").arg(key).arg(field)
        return self.add_command(cmd)
    }
    /// Handshake with Redis
    /// ## Available since
    /// 6.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 6.2.0, `protover` made optional; when called without arguments the command reports the current connection's context.
    /// ## Documentation
    /// view the docs for [HELLO](https://redis.io/commands/hello)
    public func hello(_ arguments: HelloArguments? = nil) -> Self {
        let cmd = Cmd("HELLO").arg(arguments)
        return self.add_command(cmd)
    }
    /// Determine if a hash field exists
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HEXISTS](https://redis.io/commands/hexists)
    public func hexists(_ key: String, _ field: String) -> Self {
        let cmd = Cmd("HEXISTS").arg(key).arg(field)
        return self.add_command(cmd)
    }
    /// Get the value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HGET](https://redis.io/commands/hget)
    public func hget(_ key: String, _ field: String) -> Self {
        let cmd = Cmd("HGET").arg(key).arg(field)
        return self.add_command(cmd)
    }
    /// Get all the fields and values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HGETALL](https://redis.io/commands/hgetall)
    public func hgetall(_ key: String) -> Self {
        let cmd = Cmd("HGETALL").arg(key)
        return self.add_command(cmd)
    }
    /// Increment the integer value of a hash field by the given number
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBY](https://redis.io/commands/hincrby)
    public func hincrby(_ key: String, _ field: String, _ increment: Int) -> Self {
        let cmd = Cmd("HINCRBY").arg(key).arg(field).arg(increment)
        return self.add_command(cmd)
    }
    /// Increment the float value of a hash field by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HINCRBYFLOAT](https://redis.io/commands/hincrbyfloat)
    public func hincrbyfloat(_ key: String, _ field: String, _ increment: Double) -> Self {
        let cmd = Cmd("HINCRBYFLOAT").arg(key).arg(field).arg(increment)
        return self.add_command(cmd)
    }
    /// Get all the fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HKEYS](https://redis.io/commands/hkeys)
    public func hkeys(_ key: String) -> Self {
        let cmd = Cmd("HKEYS").arg(key)
        return self.add_command(cmd)
    }
    /// Get the number of fields in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HLEN](https://redis.io/commands/hlen)
    public func hlen(_ key: String) -> Self {
        let cmd = Cmd("HLEN").arg(key)
        return self.add_command(cmd)
    }
    /// Get the values of all the given hash fields
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being requested.
    /// ## Documentation
    /// view the docs for [HMGET](https://redis.io/commands/hmget)
    public func hmget(_ key: String, _ field: String...) -> Self {
        let cmd = Cmd("HMGET").arg(key).arg(field)
        return self.add_command(cmd)
    }
    /// Set multiple hash fields to multiple values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the number of fields being set.
    /// ## Documentation
    /// view the docs for [HMSET](https://redis.io/commands/hmset)
    public func hmset(_ key: String, _ fieldValue: HmsetFieldvalue...) -> Self {
        let cmd = Cmd("HMSET").arg(key).arg(fieldValue)
        return self.add_command(cmd)
    }
    /// Get one or multiple random fields from a hash
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of fields returned
    /// ## Documentation
    /// view the docs for [HRANDFIELD](https://redis.io/commands/hrandfield)
    public func hrandfield(_ key: String, _ options: HrandfieldOptions? = nil) -> Self {
        let cmd = Cmd("HRANDFIELD").arg(key).arg(options)
        return self.add_command(cmd)
    }
    /// Incrementally iterate hash fields and associated values
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [HSCAN](https://redis.io/commands/hscan)
    public func hscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) -> Self {
        let cmd = Cmd("HSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return self.add_command(cmd)
    }
    /// Set the string value of a hash field
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1) for each field/value pair added, so O(N) to add N field/value pairs when the command is called with multiple field/value pairs.
    /// ## History
    /// - 4.0.0, Accepts multiple `field` and `value` arguments.
    /// ## Documentation
    /// view the docs for [HSET](https://redis.io/commands/hset)
    public func hset(_ key: String, _ fieldValue: HsetFieldvalue...) -> Self {
        let cmd = Cmd("HSET").arg(key).arg(fieldValue)
        return self.add_command(cmd)
    }
    /// Set the value of a hash field, only if the field does not exist
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSETNX](https://redis.io/commands/hsetnx)
    public func hsetnx(_ key: String, _ field: String, _ value: String) -> Self {
        let cmd = Cmd("HSETNX").arg(key).arg(field).arg(value)
        return self.add_command(cmd)
    }
    /// Get the length of the value of a hash field
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [HSTRLEN](https://redis.io/commands/hstrlen)
    public func hstrlen(_ key: String, _ field: String) -> Self {
        let cmd = Cmd("HSTRLEN").arg(key).arg(field)
        return self.add_command(cmd)
    }
    /// Get all the values in a hash
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N) where N is the size of the hash.
    /// ## Documentation
    /// view the docs for [HVALS](https://redis.io/commands/hvals)
    public func hvals(_ key: String) -> Self {
        let cmd = Cmd("HVALS").arg(key)
        return self.add_command(cmd)
    }
    /// Increment the integer value of a key by one
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCR](https://redis.io/commands/incr)
    public func incr(_ key: String) -> Self {
        let cmd = Cmd("INCR").arg(key)
        return self.add_command(cmd)
    }
    /// Increment the integer value of a key by the given amount
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBY](https://redis.io/commands/incrby)
    public func incrby(_ key: String, _ increment: Int) -> Self {
        let cmd = Cmd("INCRBY").arg(key).arg(increment)
        return self.add_command(cmd)
    }
    /// Increment the float value of a key by the given amount
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [INCRBYFLOAT](https://redis.io/commands/incrbyfloat)
    public func incrbyfloat(_ key: String, _ increment: Double) -> Self {
        let cmd = Cmd("INCRBYFLOAT").arg(key).arg(increment)
        return self.add_command(cmd)
    }
    /// Get information and statistics about the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added support for taking multiple section arguments.
    /// ## Documentation
    /// view the docs for [INFO](https://redis.io/commands/info)
    public func info(_ section: String...) -> Self {
        let cmd = Cmd("INFO").arg(section)
        return self.add_command(cmd)
    }
    /// Find all keys matching the given pattern
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) with N being the number of keys in the database, under the assumption that the key names in the database and the given pattern have limited length.
    /// ## Documentation
    /// view the docs for [KEYS](https://redis.io/commands/keys)
    public func keys(_ pattern: String) -> Self {
        let cmd = Cmd("KEYS").arg(pattern)
        return self.add_command(cmd)
    }
    /// Get the UNIX time stamp of the last successful save to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LASTSAVE](https://redis.io/commands/lastsave)
    public func lastsave() -> Self {
        let cmd = Cmd("LASTSAVE")
        return self.add_command(cmd)
    }
    /// A container for latency diagnostics commands
    /// ## Available since
    /// 2.8.13
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [LATENCY](https://redis.io/commands/latency)
    public func latency() -> Self {
        let cmd = Cmd("LATENCY")
        return self.add_command(cmd)
    }
    /// Find longest common substring
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) where N and M are the lengths of s1 and s2, respectively
    /// ## Documentation
    /// view the docs for [LCS](https://redis.io/commands/lcs)
    public func lcs(_ key1: String, _ key2: String, _ MINMATCHLEN: Int? = nil, _ options: LcsOptions? = nil) -> Self {
        let cmd = Cmd("LCS").arg(key1).arg(key2).arg((MINMATCHLEN != nil) ? "MINMATCHLEN" : nil).arg(MINMATCHLEN).arg(
            options)
        return self.add_command(cmd)
    }
    /// Get an element from a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse to get to the element at index. This makes asking for the first or the last element of the list O(1).
    /// ## Documentation
    /// view the docs for [LINDEX](https://redis.io/commands/lindex)
    public func lindex(_ key: String, _ index: Int) -> Self {
        let cmd = Cmd("LINDEX").arg(key).arg(index)
        return self.add_command(cmd)
    }
    /// Insert an element before or after another element in a list
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to traverse before seeing the value pivot. This means that inserting somewhere on the left end on the list (head) can be considered O(1) and inserting somewhere on the right end (tail) is O(N).
    /// ## Documentation
    /// view the docs for [LINSERT](https://redis.io/commands/linsert)
    public func linsert(_ key: String, _ rWhere: LinsertRwhere, _ pivot: String, _ element: String) -> Self {
        let cmd = Cmd("LINSERT").arg(key).arg(rWhere).arg(pivot).arg(element)
        return self.add_command(cmd)
    }
    /// Get the length of a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LLEN](https://redis.io/commands/llen)
    public func llen(_ key: String) -> Self {
        let cmd = Cmd("LLEN").arg(key)
        return self.add_command(cmd)
    }
    /// Pop an element from a list, push it to another list and return it
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [LMOVE](https://redis.io/commands/lmove)
    public func lmove(_ source: String, _ destination: String, _ wherefrom: LmoveWherefrom, _ whereto: LmoveWhereto)
        -> Self
    {
        let cmd = Cmd("LMOVE").arg(source).arg(destination).arg(wherefrom).arg(whereto)
        return self.add_command(cmd)
    }
    /// Pop elements from a list
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of provided keys and M is the number of elements returned.
    /// ## Documentation
    /// view the docs for [LMPOP](https://redis.io/commands/lmpop)
    public func lmpop(_ numkeys: Int, _ key: String..., rWhere: LmpopRwhere, _ count: Int? = nil) -> Self {
        let cmd = Cmd("LMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        return self.add_command(cmd)
    }
    /// Display some computer art and the Redis version
    /// ## Available since
    /// 5.0.0
    /// ## Documentation
    /// view the docs for [LOLWUT](https://redis.io/commands/lolwut)
    public func lolwut(_ version: Int? = nil) -> Self {
        let cmd = Cmd("LOLWUT").arg((version != nil) ? "VERSION" : nil).arg(version)
        return self.add_command(cmd)
    }
    /// Remove and get the first elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [LPOP](https://redis.io/commands/lpop)
    public func lpop(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("LPOP").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Return the index of matching elements on a list
    /// ## Available since
    /// 6.0.6
    /// ## Time complexity
    /// O(N) where N is the number of elements in the list, for the average case. When searching for elements near the head or the tail of the list, or when the MAXLEN option is provided, the command may run in constant time.
    /// ## Documentation
    /// view the docs for [LPOS](https://redis.io/commands/lpos)
    public func lpos(_ key: String, _ element: String, _ rank: Int? = nil, _ numMatches: Int? = nil, _ len: Int? = nil)
        -> Self
    {
        let cmd = Cmd("LPOS").arg(key).arg(element).arg((rank != nil) ? "RANK" : nil).arg(rank).arg(
            (numMatches != nil) ? "COUNT" : nil
        ).arg(numMatches).arg((len != nil) ? "MAXLEN" : nil).arg(len)
        return self.add_command(cmd)
    }
    /// Prepend one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSH](https://redis.io/commands/lpush)
    public func lpush(_ key: String, _ element: String...) -> Self {
        let cmd = Cmd("LPUSH").arg(key).arg(element)
        return self.add_command(cmd)
    }
    /// Prepend an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [LPUSHX](https://redis.io/commands/lpushx)
    public func lpushx(_ key: String, _ element: String...) -> Self {
        let cmd = Cmd("LPUSHX").arg(key).arg(element)
        return self.add_command(cmd)
    }
    /// Get a range of elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(S+N) where S is the distance of start offset from HEAD for small lists, from nearest end (HEAD or TAIL) for large lists; and N is the number of elements in the specified range.
    /// ## Documentation
    /// view the docs for [LRANGE](https://redis.io/commands/lrange)
    public func lrange(_ key: String, _ start: Int, _ stop: Int) -> Self {
        let cmd = Cmd("LRANGE").arg(key).arg(start).arg(stop)
        return self.add_command(cmd)
    }
    /// Remove elements from a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M) where N is the length of the list and M is the number of elements removed.
    /// ## Documentation
    /// view the docs for [LREM](https://redis.io/commands/lrem)
    public func lrem(_ key: String, _ count: Int, _ element: String) -> Self {
        let cmd = Cmd("LREM").arg(key).arg(count).arg(element)
        return self.add_command(cmd)
    }
    /// Set the value of an element in a list by its index
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the list. Setting either the first or the last element of the list is O(1).
    /// ## Documentation
    /// view the docs for [LSET](https://redis.io/commands/lset)
    public func lset(_ key: String, _ index: Int, _ element: String) -> Self {
        let cmd = Cmd("LSET").arg(key).arg(index).arg(element)
        return self.add_command(cmd)
    }
    /// Trim a list to the specified range
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements to be removed by the operation.
    /// ## Documentation
    /// view the docs for [LTRIM](https://redis.io/commands/ltrim)
    public func ltrim(_ key: String, _ start: Int, _ stop: Int) -> Self {
        let cmd = Cmd("LTRIM").arg(key).arg(start).arg(stop)
        return self.add_command(cmd)
    }
    /// A container for memory diagnostics commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MEMORY](https://redis.io/commands/memory)
    public func memory() -> Self {
        let cmd = Cmd("MEMORY")
        return self.add_command(cmd)
    }
    /// Get the values of all the given keys
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of keys to retrieve.
    /// ## Documentation
    /// view the docs for [MGET](https://redis.io/commands/mget)
    public func mget(_ key: String...) -> Self {
        let cmd = Cmd("MGET").arg(key)
        return self.add_command(cmd)
    }
    /// Atomically transfer a key from a Redis instance to another one.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// This command actually executes a DUMP+DEL in the source instance, and a RESTORE in the target instance. See the pages of these commands for time complexity. Also an O(N) data transfer between the two instances is performed.
    /// ## History
    /// - 3.0.0, Added the `COPY` and `REPLACE` options.
    /// - 3.0.6, Added the `KEYS` option.
    /// - 4.0.7, Added the `AUTH` option.
    /// - 6.0.0, Added the `AUTH2` option.
    /// ## Documentation
    /// view the docs for [MIGRATE](https://redis.io/commands/migrate)
    public func migrate(
        _ host: String, _ port: Int, _ keyOrEmptyString: MigrateKeyoremptystring, _ destinationDb: Int, _ timeout: Int,
        _ authentication: MigrateAuthentication? = nil, _ key: String..., options: MigrateOptions? = nil
    ) -> Self {
        let cmd = Cmd("MIGRATE").arg(host).arg(port).arg(keyOrEmptyString).arg(destinationDb).arg(timeout).arg(
            authentication
        ).arg((!key.isEmpty) ? "KEYS" : nil).arg(key).arg(options)
        return self.add_command(cmd)
    }
    /// A container for module commands
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [MODULE](https://redis.io/commands/module)
    public func module() -> Self {
        let cmd = Cmd("MODULE")
        return self.add_command(cmd)
    }
    /// Listen for all requests received by the server in real time
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [MONITOR](https://redis.io/commands/monitor)
    public func monitor() -> Self {
        let cmd = Cmd("MONITOR")
        return self.add_command(cmd)
    }
    /// Move a key to another database
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MOVE](https://redis.io/commands/move)
    public func move(_ key: String, _ db: Int) -> Self {
        let cmd = Cmd("MOVE").arg(key).arg(db)
        return self.add_command(cmd)
    }
    /// Set multiple keys to multiple values
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSET](https://redis.io/commands/mset)
    public func mset(_ keyValue: MsetKeyvalue...) -> Self {
        let cmd = Cmd("MSET").arg(keyValue)
        return self.add_command(cmd)
    }
    /// Set multiple keys to multiple values, only if none of the keys exist
    /// ## Available since
    /// 1.0.1
    /// ## Time complexity
    /// O(N) where N is the number of keys to set.
    /// ## Documentation
    /// view the docs for [MSETNX](https://redis.io/commands/msetnx)
    public func msetnx(_ keyValue: MsetnxKeyvalue...) -> Self {
        let cmd = Cmd("MSETNX").arg(keyValue)
        return self.add_command(cmd)
    }
    /// Mark the start of a transaction block
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [MULTI](https://redis.io/commands/multi)
    public func multi() -> Self {
        let cmd = Cmd("MULTI")
        return self.add_command(cmd)
    }
    /// A container for object introspection commands
    /// ## Available since
    /// 2.2.3
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [OBJECT](https://redis.io/commands/object)
    public func object() -> Self {
        let cmd = Cmd("OBJECT")
        return self.add_command(cmd)
    }
    /// Remove the expiration from a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PERSIST](https://redis.io/commands/persist)
    public func persist(_ key: String) -> Self {
        let cmd = Cmd("PERSIST").arg(key)
        return self.add_command(cmd)
    }
    /// Set a key's time to live in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIRE](https://redis.io/commands/pexpire)
    public func pexpire(_ key: String, _ milliseconds: Int, _ condition: PexpireCondition? = nil) -> Self {
        let cmd = Cmd("PEXPIRE").arg(key).arg(milliseconds).arg(condition)
        return self.add_command(cmd)
    }
    /// Set the expiration for a key as a UNIX timestamp specified in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added options: `NX`, `XX`, `GT` and `LT`.
    /// ## Documentation
    /// view the docs for [PEXPIREAT](https://redis.io/commands/pexpireat)
    public func pexpireat(_ key: String, _ unixTimeMilliseconds: Int64, _ condition: PexpireatCondition? = nil) -> Self
    {
        let cmd = Cmd("PEXPIREAT").arg(key).arg(unixTimeMilliseconds).arg(condition)
        return self.add_command(cmd)
    }
    /// Get the expiration Unix timestamp for a key in milliseconds
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PEXPIRETIME](https://redis.io/commands/pexpiretime)
    public func pexpiretime(_ key: String) -> Self {
        let cmd = Cmd("PEXPIRETIME").arg(key)
        return self.add_command(cmd)
    }
    /// Adds the specified elements to the specified HyperLogLog.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) to add every element.
    /// ## Documentation
    /// view the docs for [PFADD](https://redis.io/commands/pfadd)
    public func pfadd(_ key: String, _ element: String...) -> Self {
        let cmd = Cmd("PFADD").arg(key).arg(element)
        return self.add_command(cmd)
    }
    /// Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s).
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(1) with a very small average constant time when called with a single key. O(N) with N being the number of keys, and much bigger constant times, when called with multiple keys.
    /// ## Documentation
    /// view the docs for [PFCOUNT](https://redis.io/commands/pfcount)
    public func pfcount(_ key: String...) -> Self {
        let cmd = Cmd("PFCOUNT").arg(key)
        return self.add_command(cmd)
    }
    /// Internal commands for debugging HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFDEBUG](https://redis.io/commands/pfdebug)
    public func pfdebug(_ subcommand: String, _ key: String) -> Self {
        let cmd = Cmd("PFDEBUG").arg(subcommand).arg(key)
        return self.add_command(cmd)
    }
    /// Merge N different HyperLogLogs into a single one.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(N) to merge N HyperLogLogs, but with high constant times.
    /// ## Documentation
    /// view the docs for [PFMERGE](https://redis.io/commands/pfmerge)
    public func pfmerge(_ destkey: String, _ sourcekey: String...) -> Self {
        let cmd = Cmd("PFMERGE").arg(destkey).arg(sourcekey)
        return self.add_command(cmd)
    }
    /// An internal command for testing HyperLogLog values
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// N/A
    /// ## Documentation
    /// view the docs for [PFSELFTEST](https://redis.io/commands/pfselftest)
    public func pfselftest() -> Self {
        let cmd = Cmd("PFSELFTEST")
        return self.add_command(cmd)
    }
    /// Ping the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PING](https://redis.io/commands/ping)
    public func ping(_ message: String? = nil) -> Self {
        let cmd = Cmd("PING").arg(message)
        return self.add_command(cmd)
    }
    /// Set the value and expiration in milliseconds of a key
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [PSETEX](https://redis.io/commands/psetex)
    public func psetex(_ key: String, _ milliseconds: Int, _ value: String) -> Self {
        let cmd = Cmd("PSETEX").arg(key).arg(milliseconds).arg(value)
        return self.add_command(cmd)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 2.8.0
    /// ## Documentation
    /// view the docs for [PSYNC](https://redis.io/commands/psync)
    public func psync(_ replicationid: String, _ offset: Int) -> Self {
        let cmd = Cmd("PSYNC").arg(replicationid).arg(offset)
        return self.add_command(cmd)
    }
    /// Get the time to live for a key in milliseconds
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [PTTL](https://redis.io/commands/pttl)
    public func pttl(_ key: String) -> Self {
        let cmd = Cmd("PTTL").arg(key)
        return self.add_command(cmd)
    }
    /// Post a message to a channel
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N+M) where N is the number of clients subscribed to the receiving channel and M is the total number of subscribed patterns (by any client).
    /// ## Documentation
    /// view the docs for [PUBLISH](https://redis.io/commands/publish)
    public func publish(_ channel: String, _ message: String) -> Self {
        let cmd = Cmd("PUBLISH").arg(channel).arg(message)
        return self.add_command(cmd)
    }
    /// A container for Pub/Sub commands
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [PUBSUB](https://redis.io/commands/pubsub)
    public func pubsub() -> Self {
        let cmd = Cmd("PUBSUB")
        return self.add_command(cmd)
    }
    /// Close the connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [QUIT](https://redis.io/commands/quit)
    public func quit() -> Self {
        let cmd = Cmd("QUIT")
        return self.add_command(cmd)
    }
    /// Return a random key from the keyspace
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RANDOMKEY](https://redis.io/commands/randomkey)
    public func randomkey() -> Self {
        let cmd = Cmd("RANDOMKEY")
        return self.add_command(cmd)
    }
    /// Enables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READONLY](https://redis.io/commands/readonly)
    public func readonly() -> Self {
        let cmd = Cmd("READONLY")
        return self.add_command(cmd)
    }
    /// Disables read queries for a connection to a cluster replica node
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [READWRITE](https://redis.io/commands/readwrite)
    public func readwrite() -> Self {
        let cmd = Cmd("READWRITE")
        return self.add_command(cmd)
    }
    /// Rename a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RENAME](https://redis.io/commands/rename)
    public func rename(_ key: String, _ newkey: String) -> Self {
        let cmd = Cmd("RENAME").arg(key).arg(newkey)
        return self.add_command(cmd)
    }
    /// Rename a key, only if the new key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 3.2.0, The command no longer returns an error when source and destination names are the same.
    /// ## Documentation
    /// view the docs for [RENAMENX](https://redis.io/commands/renamenx)
    public func renamenx(_ key: String, _ newkey: String) -> Self {
        let cmd = Cmd("RENAMENX").arg(key).arg(newkey)
        return self.add_command(cmd)
    }
    /// An internal command for configuring the replication stream
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLCONF](https://redis.io/commands/replconf)
    public func replconf() -> Self {
        let cmd = Cmd("REPLCONF")
        return self.add_command(cmd)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [REPLICAOF](https://redis.io/commands/replicaof)
    public func replicaof(_ host: String, _ port: Int) -> Self {
        let cmd = Cmd("REPLICAOF").arg(host).arg(port)
        return self.add_command(cmd)
    }
    /// Reset the connection
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RESET](https://redis.io/commands/reset)
    public func reset() -> Self {
        let cmd = Cmd("RESET")
        return self.add_command(cmd)
    }
    /// Create a key using the provided serialized value, previously obtained using DUMP.
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE](https://redis.io/commands/restore)
    public func restore(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreOptions? = nil
    ) -> Self {
        let cmd = Cmd("RESTORE").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil).arg(
            seconds
        ).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        return self.add_command(cmd)
    }
    /// An internal command for migrating keys in a cluster
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1) to create the new key and additional O(N*M) to reconstruct the serialized value, where N is the number of Redis objects composing the value and M their average size. For small string values the time complexity is thus O(1)+O(1*M) where M is small, so simply O(1). However for sorted set values the complexity is O(N*M*log(N)) because inserting values into sorted sets is O(log(N)).
    /// ## History
    /// - 3.0.0, Added the `REPLACE` modifier.
    /// - 5.0.0, Added the `ABSTTL` modifier.
    /// - 5.0.0, Added the `IDLETIME` and `FREQ` options.
    /// ## Documentation
    /// view the docs for [RESTORE_ASKING](https://redis.io/commands/restore-asking)
    public func restore_asking(
        _ key: String, _ ttl: Int, _ serializedValue: String, _ seconds: Int? = nil, _ frequency: Int? = nil,
        _ options: RestoreAskingOptions? = nil
    ) -> Self {
        let cmd = Cmd("RESTORE_ASKING").arg(key).arg(ttl).arg(serializedValue).arg((seconds != nil) ? "IDLETIME" : nil)
            .arg(seconds).arg((frequency != nil) ? "FREQ" : nil).arg(frequency).arg(options)
        return self.add_command(cmd)
    }
    /// Return the role of the instance in the context of replication
    /// ## Available since
    /// 2.8.12
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ROLE](https://redis.io/commands/role)
    public func role() -> Self {
        let cmd = Cmd("ROLE")
        return self.add_command(cmd)
    }
    /// Remove and get the last elements in a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## History
    /// - 6.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [RPOP](https://redis.io/commands/rpop)
    public func rpop(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("RPOP").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Remove the last element in a list, prepend it to another list and return it
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [RPOPLPUSH](https://redis.io/commands/rpoplpush)
    public func rpoplpush(_ source: String, _ destination: String) -> Self {
        let cmd = Cmd("RPOPLPUSH").arg(source).arg(destination)
        return self.add_command(cmd)
    }
    /// Append one or multiple elements to a list
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSH](https://redis.io/commands/rpush)
    public func rpush(_ key: String, _ element: String...) -> Self {
        let cmd = Cmd("RPUSH").arg(key).arg(element)
        return self.add_command(cmd)
    }
    /// Append an element to a list, only if the list exists
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 4.0.0, Accepts multiple `element` arguments.
    /// ## Documentation
    /// view the docs for [RPUSHX](https://redis.io/commands/rpushx)
    public func rpushx(_ key: String, _ element: String...) -> Self {
        let cmd = Cmd("RPUSHX").arg(key).arg(element)
        return self.add_command(cmd)
    }
    /// Add one or more members to a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1) for each element added, so O(N) to add N elements when the command is called with multiple arguments.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SADD](https://redis.io/commands/sadd)
    public func sadd(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("SADD").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Synchronously save the dataset to disk
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of keys in all databases
    /// ## Documentation
    /// view the docs for [SAVE](https://redis.io/commands/save)
    public func save() -> Self {
        let cmd = Cmd("SAVE")
        return self.add_command(cmd)
    }
    /// Incrementally iterate the keys space
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection.
    /// ## History
    /// - 6.0.0, Added the `TYPE` subcommand.
    /// ## Documentation
    /// view the docs for [SCAN](https://redis.io/commands/scan)
    public func scan(_ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil, _ type: String? = nil) -> Self {
        let cmd = Cmd("SCAN").arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg((type != nil) ? "TYPE" : nil).arg(type)
        return self.add_command(cmd)
    }
    /// Get the number of members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SCARD](https://redis.io/commands/scard)
    public func scard(_ key: String) -> Self {
        let cmd = Cmd("SCARD").arg(key)
        return self.add_command(cmd)
    }
    /// A container for Lua scripts management commands
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SCRIPT](https://redis.io/commands/script)
    public func script() -> Self {
        let cmd = Cmd("SCRIPT")
        return self.add_command(cmd)
    }
    /// Subtract multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFF](https://redis.io/commands/sdiff)
    public func sdiff(_ key: String...) -> Self {
        let cmd = Cmd("SDIFF").arg(key)
        return self.add_command(cmd)
    }
    /// Subtract multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SDIFFSTORE](https://redis.io/commands/sdiffstore)
    public func sdiffstore(_ destination: String, _ key: String...) -> Self {
        let cmd = Cmd("SDIFFSTORE").arg(destination).arg(key)
        return self.add_command(cmd)
    }
    /// Change the selected database for the current connection
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SELECT](https://redis.io/commands/select)
    public func select(_ index: Int) -> Self {
        let cmd = Cmd("SELECT").arg(index)
        return self.add_command(cmd)
    }
    /// A container for Sentinel commands
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SENTINEL](https://redis.io/commands/sentinel)
    public func sentinel() -> Self {
        let cmd = Cmd("SENTINEL")
        return self.add_command(cmd)
    }
    /// Set the string value of a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.6.12, Added the `EX`, `PX`, `NX` and `XX` options.
    /// - 6.0.0, Added the `KEEPTTL` option.
    /// - 6.2.0, Added the `GET`, `EXAT` and `PXAT` option.
    /// - 7.0.0, Allowed the `NX` and `GET` options to be used together.
    /// ## Documentation
    /// view the docs for [SET](https://redis.io/commands/set)
    public func set(
        _ key: String, _ value: String, _ condition: SetCondition? = nil, _ expiration: SetExpiration? = nil,
        _ options: SetOptions? = nil
    ) -> Self {
        let cmd = Cmd("SET").arg(key).arg(value).arg(condition).arg(expiration).arg(options)
        return self.add_command(cmd)
    }
    /// Sets or clears the bit at offset in the string value stored at key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETBIT](https://redis.io/commands/setbit)
    public func setbit(_ key: String, _ offset: Int, _ value: Int) -> Self {
        let cmd = Cmd("SETBIT").arg(key).arg(offset).arg(value)
        return self.add_command(cmd)
    }
    /// Set the value and expiration of a key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETEX](https://redis.io/commands/setex)
    public func setex(_ key: String, _ seconds: Int, _ value: String) -> Self {
        let cmd = Cmd("SETEX").arg(key).arg(seconds).arg(value)
        return self.add_command(cmd)
    }
    /// Set the value of a key, only if the key does not exist
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SETNX](https://redis.io/commands/setnx)
    public func setnx(_ key: String, _ value: String) -> Self {
        let cmd = Cmd("SETNX").arg(key).arg(value)
        return self.add_command(cmd)
    }
    /// Overwrite part of a string at key starting at the specified offset
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1), not counting the time taken to copy the new string in place. Usually, this string is very small so the amortized complexity is O(1). Otherwise, complexity is O(M) with M being the length of the value argument.
    /// ## Documentation
    /// view the docs for [SETRANGE](https://redis.io/commands/setrange)
    public func setrange(_ key: String, _ offset: Int, _ value: String) -> Self {
        let cmd = Cmd("SETRANGE").arg(key).arg(offset).arg(value)
        return self.add_command(cmd)
    }
    /// Synchronously save the dataset to disk and then shut down the server
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) when saving, where N is the total number of keys in all databases when saving data, otherwise O(1)
    /// ## History
    /// - 7.0.0, Added the `NOW`, `FORCE` and `ABORT` modifiers.
    /// ## Documentation
    /// view the docs for [SHUTDOWN](https://redis.io/commands/shutdown)
    public func shutdown(_ nosaveSave: ShutdownNosavesave? = nil, _ options: ShutdownOptions? = nil) -> Self {
        let cmd = Cmd("SHUTDOWN").arg(nosaveSave).arg(options)
        return self.add_command(cmd)
    }
    /// Intersect multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTER](https://redis.io/commands/sinter)
    public func sinter(_ key: String...) -> Self {
        let cmd = Cmd("SINTER").arg(key)
        return self.add_command(cmd)
    }
    /// Intersect multiple sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERCARD](https://redis.io/commands/sintercard)
    public func sintercard(_ numkeys: Int, _ key: String..., limit: Int? = nil) -> Self {
        let cmd = Cmd("SINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        return self.add_command(cmd)
    }
    /// Intersect multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N*M) worst case where N is the cardinality of the smallest set and M is the number of sets.
    /// ## Documentation
    /// view the docs for [SINTERSTORE](https://redis.io/commands/sinterstore)
    public func sinterstore(_ destination: String, _ key: String...) -> Self {
        let cmd = Cmd("SINTERSTORE").arg(destination).arg(key)
        return self.add_command(cmd)
    }
    /// Determine if a given value is a member of a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SISMEMBER](https://redis.io/commands/sismember)
    public func sismember(_ key: String, _ member: String) -> Self {
        let cmd = Cmd("SISMEMBER").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Make the server a replica of another instance, or promote it as master.
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SLAVEOF](https://redis.io/commands/slaveof)
    public func slaveof(_ host: String, _ port: Int) -> Self {
        let cmd = Cmd("SLAVEOF").arg(host).arg(port)
        return self.add_command(cmd)
    }
    /// A container for slow log commands
    /// ## Available since
    /// 2.2.12
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [SLOWLOG](https://redis.io/commands/slowlog)
    public func slowlog() -> Self {
        let cmd = Cmd("SLOWLOG")
        return self.add_command(cmd)
    }
    /// Get all the members in a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the set cardinality.
    /// ## Documentation
    /// view the docs for [SMEMBERS](https://redis.io/commands/smembers)
    public func smembers(_ key: String) -> Self {
        let cmd = Cmd("SMEMBERS").arg(key)
        return self.add_command(cmd)
    }
    /// Returns the membership associated with the given elements for a set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements being checked for membership
    /// ## Documentation
    /// view the docs for [SMISMEMBER](https://redis.io/commands/smismember)
    public func smismember(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("SMISMEMBER").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Move a member from one set to another
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SMOVE](https://redis.io/commands/smove)
    public func smove(_ source: String, _ destination: String, _ member: String) -> Self {
        let cmd = Cmd("SMOVE").arg(source).arg(destination).arg(member)
        return self.add_command(cmd)
    }
    /// Sort the elements in a list, set or sorted set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT](https://redis.io/commands/sort)
    public func sort(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortOffsetcount? = nil, _ GET: String...,
        order: SortOrder? = nil, _ destination: String? = nil, _ options: SortOptions? = nil
    ) -> Self {
        let cmd = Cmd("SORT").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(
            (destination != nil) ? "STORE" : nil
        ).arg(destination).arg(options)
        return self.add_command(cmd)
    }
    /// Sort the elements in a list, set or sorted set. Read-only variant of SORT.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N+M*log(M)) where N is the number of elements in the list or set to sort, and M the number of returned elements. When the elements are not sorted, complexity is O(N).
    /// ## Documentation
    /// view the docs for [SORT_RO](https://redis.io/commands/sort-ro)
    public func sort_ro(
        _ key: String, _ pattern: String? = nil, _ offsetCount: SortRoOffsetcount? = nil, _ GET: String...,
        order: SortRoOrder? = nil, _ options: SortRoOptions? = nil
    ) -> Self {
        let cmd = Cmd("SORT_RO").arg(key).arg((pattern != nil) ? "BY" : nil).arg(pattern).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg((!GET.isEmpty) ? "GET" : nil).arg(GET).arg(order).arg(options)
        return self.add_command(cmd)
    }
    /// Remove and return one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the value of the passed count.
    /// ## History
    /// - 3.2.0, Added the `count` argument.
    /// ## Documentation
    /// view the docs for [SPOP](https://redis.io/commands/spop)
    public func spop(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("SPOP").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Post a message to a shard channel
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of clients subscribed to the receiving shard channel.
    /// ## Documentation
    /// view the docs for [SPUBLISH](https://redis.io/commands/spublish)
    public func spublish(_ shardchannel: String, _ message: String) -> Self {
        let cmd = Cmd("SPUBLISH").arg(shardchannel).arg(message)
        return self.add_command(cmd)
    }
    /// Get one or multiple random members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// Without the count argument O(1), otherwise O(N) where N is the absolute value of the passed count.
    /// ## History
    /// - 2.6.0, Added the optional `count` argument.
    /// ## Documentation
    /// view the docs for [SRANDMEMBER](https://redis.io/commands/srandmember)
    public func srandmember(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("SRANDMEMBER").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Remove one or more members from a set
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the number of members to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple `member` arguments.
    /// ## Documentation
    /// view the docs for [SREM](https://redis.io/commands/srem)
    public func srem(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("SREM").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Incrementally iterate Set elements
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [SSCAN](https://redis.io/commands/sscan)
    public func sscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) -> Self {
        let cmd = Cmd("SSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return self.add_command(cmd)
    }
    /// Get the length of the value stored in a key
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [STRLEN](https://redis.io/commands/strlen)
    public func strlen(_ key: String) -> Self {
        let cmd = Cmd("STRLEN").arg(key)
        return self.add_command(cmd)
    }
    /// Get a substring of the string stored at a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the length of the returned string. The complexity is ultimately determined by the returned length, but because creating a substring from an existing string is very cheap, it can be considered O(1) for small strings.
    /// ## Documentation
    /// view the docs for [SUBSTR](https://redis.io/commands/substr)
    public func substr(_ key: String, _ start: Int, _ end: Int) -> Self {
        let cmd = Cmd("SUBSTR").arg(key).arg(start).arg(end)
        return self.add_command(cmd)
    }
    /// Add multiple sets
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNION](https://redis.io/commands/sunion)
    public func sunion(_ key: String...) -> Self {
        let cmd = Cmd("SUNION").arg(key)
        return self.add_command(cmd)
    }
    /// Add multiple sets and store the resulting set in a key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(N) where N is the total number of elements in all given sets.
    /// ## Documentation
    /// view the docs for [SUNIONSTORE](https://redis.io/commands/sunionstore)
    public func sunionstore(_ destination: String, _ key: String...) -> Self {
        let cmd = Cmd("SUNIONSTORE").arg(destination).arg(key)
        return self.add_command(cmd)
    }
    /// Swaps two Redis databases
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(N) where N is the count of clients watching or blocking on keys from both databases.
    /// ## Documentation
    /// view the docs for [SWAPDB](https://redis.io/commands/swapdb)
    public func swapdb(_ index1: Int, _ index2: Int) -> Self {
        let cmd = Cmd("SWAPDB").arg(index1).arg(index2)
        return self.add_command(cmd)
    }
    /// Internal command used for replication
    /// ## Available since
    /// 1.0.0
    /// ## Documentation
    /// view the docs for [SYNC](https://redis.io/commands/sync)
    public func sync() -> Self {
        let cmd = Cmd("SYNC")
        return self.add_command(cmd)
    }
    /// Return the current server time
    /// ## Available since
    /// 2.6.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TIME](https://redis.io/commands/time)
    public func time() -> Self {
        let cmd = Cmd("TIME")
        return self.add_command(cmd)
    }
    /// Alters the last access time of a key(s). Returns the number of existing keys specified.
    /// ## Available since
    /// 3.2.1
    /// ## Time complexity
    /// O(N) where N is the number of keys that will be touched.
    /// ## Documentation
    /// view the docs for [TOUCH](https://redis.io/commands/touch)
    public func touch(_ key: String...) -> Self {
        let cmd = Cmd("TOUCH").arg(key)
        return self.add_command(cmd)
    }
    /// Get the time to live for a key in seconds
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 2.8.0, Added the -2 reply.
    /// ## Documentation
    /// view the docs for [TTL](https://redis.io/commands/ttl)
    public func ttl(_ key: String) -> Self {
        let cmd = Cmd("TTL").arg(key)
        return self.add_command(cmd)
    }
    /// Determine the type stored at key
    /// ## Available since
    /// 1.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [TYPE](https://redis.io/commands/type)
    public func type(_ key: String) -> Self {
        let cmd = Cmd("TYPE").arg(key)
        return self.add_command(cmd)
    }
    /// Delete a key asynchronously in another thread. Otherwise it is just as DEL, but non blocking.
    /// ## Available since
    /// 4.0.0
    /// ## Time complexity
    /// O(1) for each key removed regardless of its size. Then the command does O(N) work in a different thread in order to reclaim memory, where N is the number of allocations the deleted objects where composed of.
    /// ## Documentation
    /// view the docs for [UNLINK](https://redis.io/commands/unlink)
    public func unlink(_ key: String...) -> Self {
        let cmd = Cmd("UNLINK").arg(key)
        return self.add_command(cmd)
    }
    /// Forget about all watched keys
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [UNWATCH](https://redis.io/commands/unwatch)
    public func unwatch() -> Self {
        let cmd = Cmd("UNWATCH")
        return self.add_command(cmd)
    }
    /// Wait for the synchronous replication of all the write commands sent in the context of the current connection
    /// ## Available since
    /// 3.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [WAIT](https://redis.io/commands/wait)
    public func wait(_ numreplicas: Int, _ timeout: Int) -> Self {
        let cmd = Cmd("WAIT").arg(numreplicas).arg(timeout)
        return self.add_command(cmd)
    }
    /// Watch the given keys to determine execution of the MULTI/EXEC block
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(1) for every key.
    /// ## Documentation
    /// view the docs for [WATCH](https://redis.io/commands/watch)
    public func watch(_ key: String...) -> Self {
        let cmd = Cmd("WATCH").arg(key)
        return self.add_command(cmd)
    }
    /// Marks a pending message as correctly processed, effectively removing it from the pending entries list of the consumer group. Return value of the command is the number of messages successfully acknowledged, that is, the IDs we were actually able to resolve in the PEL.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each message ID processed.
    /// ## Documentation
    /// view the docs for [XACK](https://redis.io/commands/xack)
    public func xack(_ key: String, _ group: String, _ id: String...) -> Self {
        let cmd = Cmd("XACK").arg(key).arg(group).arg(id)
        return self.add_command(cmd)
    }
    /// Appends a new entry to a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) when adding a new entry, O(N) when trimming where N being the number of entries evicted.
    /// ## History
    /// - 6.2.0, Added the `NOMKSTREAM` option, `MINID` trimming strategy and the `LIMIT` option.
    /// - 7.0.0, Added support for the `<ms>-*` explicit ID form.
    /// ## Documentation
    /// view the docs for [XADD](https://redis.io/commands/xadd)
    public func xadd(
        _ key: String, _ trim: XaddTrim? = nil, _ idOrAuto: XaddIdorauto, _ fieldValue: XaddFieldvalue...,
        options: XaddOptions? = nil
    ) -> Self {
        let cmd = Cmd("XADD").arg(key).arg(trim).arg(idOrAuto).arg(fieldValue).arg(options)
        return self.add_command(cmd)
    }
    /// Changes (or acquires) ownership of messages in a consumer group, as if the messages were delivered to the specified consumer.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1) if COUNT is small.
    /// ## History
    /// - 7.0.0, Added an element to the reply array, containing deleted entries the command cleared from the PEL
    /// ## Documentation
    /// view the docs for [XAUTOCLAIM](https://redis.io/commands/xautoclaim)
    public func xautoclaim(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ start: String, _ count: Int? = nil,
        _ options: XautoclaimOptions? = nil
    ) -> Self {
        let cmd = Cmd("XAUTOCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(start).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count).arg(options)
        return self.add_command(cmd)
    }
    /// Changes (or acquires) ownership of a message in a consumer group, as if the message was delivered to the specified consumer.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log N) with N being the number of messages in the PEL of the consumer group.
    /// ## Documentation
    /// view the docs for [XCLAIM](https://redis.io/commands/xclaim)
    public func xclaim(
        _ key: String, _ group: String, _ consumer: String, _ minIdleTime: String, _ id: String..., ms: Int? = nil,
        _ unixTimeMilliseconds: Int64? = nil, _ count: Int? = nil, _ LASTID: String? = nil,
        _ options: XclaimOptions? = nil
    ) -> Self {
        let cmd = Cmd("XCLAIM").arg(key).arg(group).arg(consumer).arg(minIdleTime).arg(id).arg(
            (ms != nil) ? "IDLE" : nil
        ).arg(ms).arg((unixTimeMilliseconds != nil) ? "TIME" : nil).arg(unixTimeMilliseconds).arg(
            (count != nil) ? "RETRYCOUNT" : nil
        ).arg(count).arg((LASTID != nil) ? "LASTID" : nil).arg(LASTID).arg(options)
        return self.add_command(cmd)
    }
    /// Removes the specified entries from the stream. Returns the number of items actually deleted, that may be different from the number of IDs passed in case certain IDs do not exist.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1) for each single item to delete in the stream, regardless of the stream size.
    /// ## Documentation
    /// view the docs for [XDEL](https://redis.io/commands/xdel)
    public func xdel(_ key: String, _ id: String...) -> Self {
        let cmd = Cmd("XDEL").arg(key).arg(id)
        return self.add_command(cmd)
    }
    /// A container for consumer groups commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XGROUP](https://redis.io/commands/xgroup)
    public func xgroup() -> Self {
        let cmd = Cmd("XGROUP")
        return self.add_command(cmd)
    }
    /// A container for stream introspection commands
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// Depends on subcommand.
    /// ## Documentation
    /// view the docs for [XINFO](https://redis.io/commands/xinfo)
    public func xinfo() -> Self {
        let cmd = Cmd("XINFO")
        return self.add_command(cmd)
    }
    /// Return the number of entries in a stream
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [XLEN](https://redis.io/commands/xlen)
    public func xlen(_ key: String) -> Self {
        let cmd = Cmd("XLEN").arg(key)
        return self.add_command(cmd)
    }
    /// Return information and entries from a stream consumer group pending entries list, that are messages fetched but never acknowledged.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned, so asking for a small fixed number of entries per call is O(1). O(M), where M is the total number of entries scanned when used with the IDLE filter. When the command returns just the summary and the list of consumers is small, it runs in O(1) time; otherwise, an additional O(N) time for iterating every consumer.
    /// ## History
    /// - 6.2.0, Added the `IDLE` option and exclusive range intervals.
    /// ## Documentation
    /// view the docs for [XPENDING](https://redis.io/commands/xpending)
    public func xpending(_ key: String, _ group: String, _ filters: XpendingFilters? = nil) -> Self {
        let cmd = Cmd("XPENDING").arg(key).arg(group).arg(filters)
        return self.add_command(cmd)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements being returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XRANGE](https://redis.io/commands/xrange)
    public func xrange(_ key: String, _ start: String, _ end: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("XRANGE").arg(key).arg(start).arg(end).arg((count != nil) ? "COUNT" : nil).arg(count)
        return self.add_command(cmd)
    }
    /// Return never seen elements in multiple streams, with IDs greater than the ones reported by the caller for each stream. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(N) with N being the number of elements being returned, it means that XREAD-ing with a fixed COUNT is O(1). Note that when the BLOCK option is used, XADD will pay O(M) time in order to serve the M clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREAD](https://redis.io/commands/xread)
    public func xread(_ count: Int? = nil, _ milliseconds: Int? = nil, _ streams: XreadStreams) -> Self {
        let cmd = Cmd("XREAD").arg((count != nil) ? "COUNT" : nil).arg(count).arg((milliseconds != nil) ? "BLOCK" : nil)
            .arg(milliseconds).arg("STREAMS").arg(streams)
        return self.add_command(cmd)
    }
    /// Return new entries from a stream using a consumer group, or access the history of the pending entries for a given consumer. Can block.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// For each stream mentioned: O(M) with M being the number of elements returned. If M is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1). On the other side when XREADGROUP blocks, XADD will pay the O(N) time in order to serve the N clients blocked on the stream getting new data.
    /// ## Documentation
    /// view the docs for [XREADGROUP](https://redis.io/commands/xreadgroup)
    public func xreadgroup(
        _ groupConsumer: XreadgroupGroupconsumer, _ count: Int? = nil, _ milliseconds: Int? = nil,
        _ streams: XreadgroupStreams, _ options: XreadgroupOptions? = nil
    ) -> Self {
        let cmd = Cmd("XREADGROUP").arg("GROUP").arg(groupConsumer).arg((count != nil) ? "COUNT" : nil).arg(count).arg(
            (milliseconds != nil) ? "BLOCK" : nil
        ).arg(milliseconds).arg("STREAMS").arg(streams).arg(options)
        return self.add_command(cmd)
    }
    /// Return a range of elements in a stream, with IDs matching the specified IDs interval, in reverse order (from greater to smaller IDs) compared to XRANGE
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) with N being the number of elements returned. If N is constant (e.g. always asking for the first 10 elements with COUNT), you can consider it O(1).
    /// ## History
    /// - 6.2.0, Added exclusive ranges.
    /// ## Documentation
    /// view the docs for [XREVRANGE](https://redis.io/commands/xrevrange)
    public func xrevrange(_ key: String, _ end: String, _ start: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("XREVRANGE").arg(key).arg(end).arg(start).arg((count != nil) ? "COUNT" : nil).arg(count)
        return self.add_command(cmd)
    }
    /// An internal command for replicating stream values
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(1)
    /// ## History
    /// - 7.0.0, Added the `entries_added` and `max_deleted_entry_id` arguments.
    /// ## Documentation
    /// view the docs for [XSETID](https://redis.io/commands/xsetid)
    public func xsetid(_ key: String, _ lastId: String, _ entriesAdded: Int? = nil, _ maxDeletedEntryId: String? = nil)
        -> Self
    {
        let cmd = Cmd("XSETID").arg(key).arg(lastId).arg((entriesAdded != nil) ? "ENTRIESADDED" : nil).arg(entriesAdded)
            .arg((maxDeletedEntryId != nil) ? "MAXDELETEDID" : nil).arg(maxDeletedEntryId)
        return self.add_command(cmd)
    }
    /// Trims the stream to (approximately if '~' is passed) a certain size
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N), with N being the number of evicted entries. Constant times are very small however, since entries are organized in macro nodes containing multiple entries that can be released with a single deallocation.
    /// ## History
    /// - 6.2.0, Added the `MINID` trimming strategy and the `LIMIT` option.
    /// ## Documentation
    /// view the docs for [XTRIM](https://redis.io/commands/xtrim)
    public func xtrim(_ key: String, _ trim: XtrimTrim) -> Self {
        let cmd = Cmd("XTRIM").arg(key).arg(trim)
        return self.add_command(cmd)
    }
    /// Add one or more members to a sorted set, or update its score if it already exists
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) for each item added, where N is the number of elements in the sorted set.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// - 3.0.2, Added the `XX`, `NX`, `CH` and `INCR` options.
    /// - 6.2.0, Added the `GT` and `LT` options.
    /// ## Documentation
    /// view the docs for [ZADD](https://redis.io/commands/zadd)
    public func zadd(
        _ key: String, _ condition: ZaddCondition? = nil, _ comparison: ZaddComparison? = nil,
        _ scoreMember: ZaddScoremember..., options: ZaddOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZADD").arg(key).arg(condition).arg(comparison).arg(scoreMember).arg(options)
        return self.add_command(cmd)
    }
    /// Get the number of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZCARD](https://redis.io/commands/zcard)
    public func zcard(_ key: String) -> Self {
        let cmd = Cmd("ZCARD").arg(key)
        return self.add_command(cmd)
    }
    /// Count the members in a sorted set with scores within the given values
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZCOUNT](https://redis.io/commands/zcount)
    public func zcount(_ key: String, _ min: Double, _ max: Double) -> Self {
        let cmd = Cmd("ZCOUNT").arg(key).arg(min).arg(max)
        return self.add_command(cmd)
    }
    /// Subtract multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFF](https://redis.io/commands/zdiff)
    public func zdiff(_ numkeys: Int, _ key: String..., options: ZdiffOptions? = nil) -> Self {
        let cmd = Cmd("ZDIFF").arg(numkeys).arg(key).arg(options)
        return self.add_command(cmd)
    }
    /// Subtract multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(L + (N-K)log(N)) worst case where L is the total number of elements in all the sets, N is the size of the first set, and K is the size of the result set.
    /// ## Documentation
    /// view the docs for [ZDIFFSTORE](https://redis.io/commands/zdiffstore)
    public func zdiffstore(_ destination: String, _ numkeys: Int, _ key: String...) -> Self {
        let cmd = Cmd("ZDIFFSTORE").arg(destination).arg(numkeys).arg(key)
        return self.add_command(cmd)
    }
    /// Increment the score of a member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)) where N is the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZINCRBY](https://redis.io/commands/zincrby)
    public func zincrby(_ key: String, _ increment: Int, _ member: String) -> Self {
        let cmd = Cmd("ZINCRBY").arg(key).arg(increment).arg(member)
        return self.add_command(cmd)
    }
    /// Intersect multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTER](https://redis.io/commands/zinter)
    public func zinter(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterAggregate? = nil,
        _ options: ZinterOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZINTER").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        return self.add_command(cmd)
    }
    /// Intersect multiple sorted sets and return the cardinality of the result
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N*K) worst case with N being the smallest input sorted set, K being the number of input sorted sets.
    /// ## Documentation
    /// view the docs for [ZINTERCARD](https://redis.io/commands/zintercard)
    public func zintercard(_ numkeys: Int, _ key: String..., limit: Int? = nil) -> Self {
        let cmd = Cmd("ZINTERCARD").arg(numkeys).arg(key).arg((limit != nil) ? "LIMIT" : nil).arg(limit)
        return self.add_command(cmd)
    }
    /// Intersect multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N*K)+O(M*log(M)) worst case with N being the smallest input sorted set, K being the number of input sorted sets and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZINTERSTORE](https://redis.io/commands/zinterstore)
    public func zinterstore(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZinterstoreAggregate? = nil
    ) -> Self {
        let cmd = Cmd("ZINTERSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        return self.add_command(cmd)
    }
    /// Count the number of members in a sorted set between a given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)) with N being the number of elements in the sorted set.
    /// ## Documentation
    /// view the docs for [ZLEXCOUNT](https://redis.io/commands/zlexcount)
    public func zlexcount(_ key: String, _ min: String, _ max: String) -> Self {
        let cmd = Cmd("ZLEXCOUNT").arg(key).arg(min).arg(max)
        return self.add_command(cmd)
    }
    /// Remove and return members with scores in a sorted set
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(K) + O(M*log(N)) where K is the number of provided keys, N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZMPOP](https://redis.io/commands/zmpop)
    public func zmpop(_ numkeys: Int, _ key: String..., rWhere: ZmpopRwhere, _ count: Int? = nil) -> Self {
        let cmd = Cmd("ZMPOP").arg(numkeys).arg(key).arg(rWhere).arg((count != nil) ? "COUNT" : nil).arg(count)
        return self.add_command(cmd)
    }
    /// Get the score associated with the given members in a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of members being requested.
    /// ## Documentation
    /// view the docs for [ZMSCORE](https://redis.io/commands/zmscore)
    public func zmscore(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("ZMSCORE").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Remove and return members with the highest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMAX](https://redis.io/commands/zpopmax)
    public func zpopmax(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("ZPOPMAX").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Remove and return members with the lowest scores in a sorted set
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(log(N)*M) with N being the number of elements in the sorted set, and M being the number of elements popped.
    /// ## Documentation
    /// view the docs for [ZPOPMIN](https://redis.io/commands/zpopmin)
    public func zpopmin(_ key: String, _ count: Int? = nil) -> Self {
        let cmd = Cmd("ZPOPMIN").arg(key).arg(count)
        return self.add_command(cmd)
    }
    /// Get one or multiple random elements from a sorted set
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) where N is the number of elements returned
    /// ## Documentation
    /// view the docs for [ZRANDMEMBER](https://redis.io/commands/zrandmember)
    public func zrandmember(_ key: String, _ options: ZrandmemberOptions? = nil) -> Self {
        let cmd = Cmd("ZRANDMEMBER").arg(key).arg(options)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## History
    /// - 6.2.0, Added the `REV`, `BYSCORE`, `BYLEX` and `LIMIT` options.
    /// ## Documentation
    /// view the docs for [ZRANGE](https://redis.io/commands/zrange)
    public func zrange(
        _ key: String, _ start: String, _ stop: String, _ sortby: ZrangeSortby? = nil,
        _ offsetCount: ZrangeOffsetcount? = nil, _ options: ZrangeOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZRANGE").arg(key).arg(start).arg(stop).arg(sortby).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set, by lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZRANGEBYLEX](https://redis.io/commands/zrangebylex)
    public func zrangebylex(_ key: String, _ min: String, _ max: String, _ offsetCount: ZrangebylexOffsetcount? = nil)
        -> Self
    {
        let cmd = Cmd("ZRANGEBYLEX").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set, by score
    /// ## Available since
    /// 1.0.5
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.0.0, Added the `WITHSCORES` modifier.
    /// ## Documentation
    /// view the docs for [ZRANGEBYSCORE](https://redis.io/commands/zrangebyscore)
    public func zrangebyscore(
        _ key: String, _ min: Double, _ max: Double, _ offsetCount: ZrangebyscoreOffsetcount? = nil,
        _ options: ZrangebyscoreOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZRANGEBYSCORE").arg(key).arg(min).arg(max).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return self.add_command(cmd)
    }
    /// Store a range of members from sorted set into another key
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements stored into the destination key.
    /// ## Documentation
    /// view the docs for [ZRANGESTORE](https://redis.io/commands/zrangestore)
    public func zrangestore(
        _ dst: String, _ src: String, _ min: String, _ max: String, _ sortby: ZrangestoreSortby? = nil,
        _ offsetCount: ZrangestoreOffsetcount? = nil, _ options: ZrangestoreOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZRANGESTORE").arg(dst).arg(src).arg(min).arg(max).arg(sortby).arg(
            (offsetCount != nil) ? "LIMIT" : nil
        ).arg(offsetCount).arg(options)
        return self.add_command(cmd)
    }
    /// Determine the index of a member in a sorted set
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZRANK](https://redis.io/commands/zrank)
    public func zrank(_ key: String, _ member: String) -> Self {
        let cmd = Cmd("ZRANK").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Remove one or more members from a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(M*log(N)) with N being the number of elements in the sorted set and M the number of elements to be removed.
    /// ## History
    /// - 2.4.0, Accepts multiple elements.
    /// ## Documentation
    /// view the docs for [ZREM](https://redis.io/commands/zrem)
    public func zrem(_ key: String, _ member: String...) -> Self {
        let cmd = Cmd("ZREM").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Remove all members in a sorted set between the given lexicographical range
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYLEX](https://redis.io/commands/zremrangebylex)
    public func zremrangebylex(_ key: String, _ min: String, _ max: String) -> Self {
        let cmd = Cmd("ZREMRANGEBYLEX").arg(key).arg(min).arg(max)
        return self.add_command(cmd)
    }
    /// Remove all members in a sorted set within the given indexes
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYRANK](https://redis.io/commands/zremrangebyrank)
    public func zremrangebyrank(_ key: String, _ start: Int, _ stop: Int) -> Self {
        let cmd = Cmd("ZREMRANGEBYRANK").arg(key).arg(start).arg(stop)
        return self.add_command(cmd)
    }
    /// Remove all members in a sorted set within the given scores
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements removed by the operation.
    /// ## Documentation
    /// view the docs for [ZREMRANGEBYSCORE](https://redis.io/commands/zremrangebyscore)
    public func zremrangebyscore(_ key: String, _ min: Double, _ max: Double) -> Self {
        let cmd = Cmd("ZREMRANGEBYSCORE").arg(key).arg(min).arg(max)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set, by index, with scores ordered from high to low
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements returned.
    /// ## Documentation
    /// view the docs for [ZREVRANGE](https://redis.io/commands/zrevrange)
    public func zrevrange(_ key: String, _ start: Int, _ stop: Int, _ options: ZrevrangeOptions? = nil) -> Self {
        let cmd = Cmd("ZREVRANGE").arg(key).arg(start).arg(stop).arg(options)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set, by lexicographical range, ordered from higher to lower strings.
    /// ## Available since
    /// 2.8.9
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYLEX](https://redis.io/commands/zrevrangebylex)
    public func zrevrangebylex(
        _ key: String, _ max: String, _ min: String, _ offsetCount: ZrevrangebylexOffsetcount? = nil
    ) -> Self {
        let cmd = Cmd("ZREVRANGEBYLEX").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount)
        return self.add_command(cmd)
    }
    /// Return a range of members in a sorted set, by score, with scores ordered from high to low
    /// ## Available since
    /// 2.2.0
    /// ## Time complexity
    /// O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).
    /// ## History
    /// - 2.1.6, `min` and `max` can be exclusive.
    /// ## Documentation
    /// view the docs for [ZREVRANGEBYSCORE](https://redis.io/commands/zrevrangebyscore)
    public func zrevrangebyscore(
        _ key: String, _ max: Double, _ min: Double, _ offsetCount: ZrevrangebyscoreOffsetcount? = nil,
        _ options: ZrevrangebyscoreOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZREVRANGEBYSCORE").arg(key).arg(max).arg(min).arg((offsetCount != nil) ? "LIMIT" : nil).arg(
            offsetCount
        ).arg(options)
        return self.add_command(cmd)
    }
    /// Determine the index of a member in a sorted set, with scores ordered from high to low
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(log(N))
    /// ## Documentation
    /// view the docs for [ZREVRANK](https://redis.io/commands/zrevrank)
    public func zrevrank(_ key: String, _ member: String) -> Self {
        let cmd = Cmd("ZREVRANK").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Incrementally iterate sorted sets elements and associated scores
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(1) for every call. O(N) for a complete iteration, including enough command calls for the cursor to return back to 0. N is the number of elements inside the collection..
    /// ## Documentation
    /// view the docs for [ZSCAN](https://redis.io/commands/zscan)
    public func zscan(_ key: String, _ cursor: Int, _ pattern: String? = nil, _ count: Int? = nil) -> Self {
        let cmd = Cmd("ZSCAN").arg(key).arg(cursor).arg((pattern != nil) ? "MATCH" : nil).arg(pattern).arg(
            (count != nil) ? "COUNT" : nil
        ).arg(count)
        return self.add_command(cmd)
    }
    /// Get the score associated with the given member in a sorted set
    /// ## Available since
    /// 1.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [ZSCORE](https://redis.io/commands/zscore)
    public func zscore(_ key: String, _ member: String) -> Self {
        let cmd = Cmd("ZSCORE").arg(key).arg(member)
        return self.add_command(cmd)
    }
    /// Add multiple sorted sets
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N)+O(M*log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNION](https://redis.io/commands/zunion)
    public func zunion(
        _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionAggregate? = nil,
        _ options: ZunionOptions? = nil
    ) -> Self {
        let cmd = Cmd("ZUNION").arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil).arg(weight).arg(
            (aggregate != nil) ? "AGGREGATE" : nil
        ).arg(aggregate).arg(options)
        return self.add_command(cmd)
    }
    /// Add multiple sorted sets and store the resulting sorted set in a new key
    /// ## Available since
    /// 2.0.0
    /// ## Time complexity
    /// O(N)+O(M log(M)) with N being the sum of the sizes of the input sorted sets, and M being the number of elements in the resulting sorted set.
    /// ## Documentation
    /// view the docs for [ZUNIONSTORE](https://redis.io/commands/zunionstore)
    public func zunionstore(
        _ destination: String, _ numkeys: Int, _ key: String..., weight: Int..., aggregate: ZunionstoreAggregate? = nil
    ) -> Self {
        let cmd = Cmd("ZUNIONSTORE").arg(destination).arg(numkeys).arg(key).arg((!weight.isEmpty) ? "WEIGHTS" : nil)
            .arg(weight).arg((aggregate != nil) ? "AGGREGATE" : nil).arg(aggregate)
        return self.add_command(cmd)
    }
}
public struct BgsaveOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let SCHEDULE = BgsaveOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.SCHEDULE) { out.append("SCHEDULE".data(using: .utf8)!) }
    }
}
public struct BitcountIndex: ToRedisArgs {
    let start: Int
    let end: Int
    let indexUnit: Indexunit?
    public init(_ start: Int, _ end: Int, _ indexUnit: Indexunit? = nil) {
        self.start = start
        self.end = end
        self.indexUnit = indexUnit
    }
    public func write_redis_args(out: inout [Data]) {
        start.write_redis_args(out: &out)
        end.write_redis_args(out: &out)
        indexUnit.write_redis_args(out: &out)
    }
    public enum Indexunit: ToRedisArgs {
        case BYTE
        case BIT
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .BYTE: out.append("BYTE".data(using: .utf8)!)
            case .BIT: out.append("BIT".data(using: .utf8)!)
            }
        }
    }
}
public enum BitfieldOperation: ToRedisArgs {
    case GET(Encodingoffset)
    case WRITE(Write)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .GET(let encodingoffset):
            out.append("GET".data(using: .utf8)!)
            encodingoffset.write_redis_args(out: &out)
        case .WRITE(let write): write.write_redis_args(out: &out)
        }
    }
    public struct Encodingoffset: ToRedisArgs {
        let encoding: String
        let offset: Int
        public init(_ encoding: String, _ offset: Int) {
            self.encoding = encoding
            self.offset = offset
        }
        public func write_redis_args(out: inout [Data]) {
            encoding.write_redis_args(out: &out)
            offset.write_redis_args(out: &out)
        }
    }
    public struct Write: ToRedisArgs {
        let wrapSatFail: Wrapsatfail?
        let writeOperation: Writeoperation
        public init(_ wrapSatFail: Wrapsatfail? = nil, _ writeOperation: Writeoperation) {
            self.wrapSatFail = wrapSatFail
            self.writeOperation = writeOperation
        }
        public func write_redis_args(out: inout [Data]) {
            out.append("OVERFLOW".data(using: .utf8)!)
            wrapSatFail.write_redis_args(out: &out)
            writeOperation.write_redis_args(out: &out)
        }
        public enum Wrapsatfail: ToRedisArgs {
            case WRAP
            case SAT
            case FAIL
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .WRAP: out.append("WRAP".data(using: .utf8)!)
                case .SAT: out.append("SAT".data(using: .utf8)!)
                case .FAIL: out.append("FAIL".data(using: .utf8)!)
                }
            }
        }
        public enum Writeoperation: ToRedisArgs {
            case SET(Encodingoffsetvalue)
            case INCRBY(Encodingoffsetincrement)
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .SET(let encodingoffsetvalue):
                    out.append("SET".data(using: .utf8)!)
                    encodingoffsetvalue.write_redis_args(out: &out)
                case .INCRBY(let encodingoffsetincrement):
                    out.append("INCRBY".data(using: .utf8)!)
                    encodingoffsetincrement.write_redis_args(out: &out)
                }
            }
            public struct Encodingoffsetvalue: ToRedisArgs {
                let encoding: String
                let offset: Int
                let value: Int
                public init(_ encoding: String, _ offset: Int, _ value: Int) {
                    self.encoding = encoding
                    self.offset = offset
                    self.value = value
                }
                public func write_redis_args(out: inout [Data]) {
                    encoding.write_redis_args(out: &out)
                    offset.write_redis_args(out: &out)
                    value.write_redis_args(out: &out)
                }
            }
            public struct Encodingoffsetincrement: ToRedisArgs {
                let encoding: String
                let offset: Int
                let increment: Int
                public init(_ encoding: String, _ offset: Int, _ increment: Int) {
                    self.encoding = encoding
                    self.offset = offset
                    self.increment = increment
                }
                public func write_redis_args(out: inout [Data]) {
                    encoding.write_redis_args(out: &out)
                    offset.write_redis_args(out: &out)
                    increment.write_redis_args(out: &out)
                }
            }
        }
    }
}
public struct BitfieldRoEncodingoffset: ToRedisArgs {
    let encoding: String
    let offset: Int
    public init(_ encoding: String, _ offset: Int) {
        self.encoding = encoding
        self.offset = offset
    }
    public func write_redis_args(out: inout [Data]) {
        encoding.write_redis_args(out: &out)
        offset.write_redis_args(out: &out)
    }
}
public struct BitposIndex: ToRedisArgs {
    let start: Int
    let endIndex: Endindex?
    public init(_ start: Int, _ endIndex: Endindex? = nil) {
        self.start = start
        self.endIndex = endIndex
    }
    public func write_redis_args(out: inout [Data]) {
        start.write_redis_args(out: &out)
        endIndex.write_redis_args(out: &out)
    }
    public struct Endindex: ToRedisArgs {
        let end: Int
        let indexUnit: Indexunit?
        public init(_ end: Int, _ indexUnit: Indexunit? = nil) {
            self.end = end
            self.indexUnit = indexUnit
        }
        public func write_redis_args(out: inout [Data]) {
            end.write_redis_args(out: &out)
            indexUnit.write_redis_args(out: &out)
        }
        public enum Indexunit: ToRedisArgs {
            case BYTE
            case BIT
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .BYTE: out.append("BYTE".data(using: .utf8)!)
                case .BIT: out.append("BIT".data(using: .utf8)!)
                }
            }
        }
    }
}
public enum BlmoveWherefrom: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum BlmoveWhereto: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum BlmpopRwhere: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum BzmpopRwhere: ToRedisArgs {
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
public struct CopyOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REPLACE = CopyOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.REPLACE) { out.append("REPLACE".data(using: .utf8)!) }
    }
}
public enum ExpireCondition: ToRedisArgs {
    case NX
    case XX
    case GT
    case LT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        case .GT: out.append("GT".data(using: .utf8)!)
        case .LT: out.append("LT".data(using: .utf8)!)
        }
    }
}
public enum ExpireatCondition: ToRedisArgs {
    case NX
    case XX
    case GT
    case LT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        case .GT: out.append("GT".data(using: .utf8)!)
        case .LT: out.append("LT".data(using: .utf8)!)
        }
    }
}
public struct FailoverTarget: ToRedisArgs {
    let host: String
    let port: Int
    let options: Options?
    public init(_ host: String, _ port: Int, _ options: Options? = nil) {
        self.host = host
        self.port = port
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        host.write_redis_args(out: &out)
        port.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let FORCE = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.FORCE) { out.append("FORCE".data(using: .utf8)!) }
        }
    }
}
public struct FailoverOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let ABORT = FailoverOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.ABORT) { out.append("ABORT".data(using: .utf8)!) }
    }
}
public enum FlushallAsync: ToRedisArgs {
    case ASYNC
    case SYNC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASYNC: out.append("ASYNC".data(using: .utf8)!)
        case .SYNC: out.append("SYNC".data(using: .utf8)!)
        }
    }
}
public enum FlushdbAsync: ToRedisArgs {
    case ASYNC
    case SYNC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASYNC: out.append("ASYNC".data(using: .utf8)!)
        case .SYNC: out.append("SYNC".data(using: .utf8)!)
        }
    }
}
public enum GeoaddCondition: ToRedisArgs {
    case NX
    case XX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        }
    }
}
public struct GeoaddLongitudelatitudemember: ToRedisArgs {
    let longitude: Double
    let latitude: Double
    let member: String
    public init(_ longitude: Double, _ latitude: Double, _ member: String) {
        self.longitude = longitude
        self.latitude = latitude
        self.member = member
    }
    public func write_redis_args(out: inout [Data]) {
        longitude.write_redis_args(out: &out)
        latitude.write_redis_args(out: &out)
        member.write_redis_args(out: &out)
    }
}
public struct GeoaddOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let CH = GeoaddOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) { if self.contains(.CH) { out.append("CH".data(using: .utf8)!) } }
}
public enum GeodistUnit: ToRedisArgs {
    case m
    case km
    case ft
    case mi
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .m: out.append("m".data(using: .utf8)!)
        case .km: out.append("km".data(using: .utf8)!)
        case .ft: out.append("ft".data(using: .utf8)!)
        case .mi: out.append("mi".data(using: .utf8)!)
        }
    }
}
public enum GeoradiusUnit: ToRedisArgs {
    case m
    case km
    case ft
    case mi
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .m: out.append("m".data(using: .utf8)!)
        case .km: out.append("km".data(using: .utf8)!)
        case .ft: out.append("ft".data(using: .utf8)!)
        case .mi: out.append("mi".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public enum GeoradiusOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCOORD = GeoradiusOptions(rawValue: 1 << 0)
    public static let WITHDIST = GeoradiusOptions(rawValue: 1 << 1)
    public static let WITHHASH = GeoradiusOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCOORD) { out.append("WITHCOORD".data(using: .utf8)!) }
        if self.contains(.WITHDIST) { out.append("WITHDIST".data(using: .utf8)!) }
        if self.contains(.WITHHASH) { out.append("WITHHASH".data(using: .utf8)!) }
    }
}
public enum GeoradiusbymemberUnit: ToRedisArgs {
    case m
    case km
    case ft
    case mi
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .m: out.append("m".data(using: .utf8)!)
        case .km: out.append("km".data(using: .utf8)!)
        case .ft: out.append("ft".data(using: .utf8)!)
        case .mi: out.append("mi".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusbymemberCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public enum GeoradiusbymemberOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusbymemberOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCOORD = GeoradiusbymemberOptions(rawValue: 1 << 0)
    public static let WITHDIST = GeoradiusbymemberOptions(rawValue: 1 << 1)
    public static let WITHHASH = GeoradiusbymemberOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCOORD) { out.append("WITHCOORD".data(using: .utf8)!) }
        if self.contains(.WITHDIST) { out.append("WITHDIST".data(using: .utf8)!) }
        if self.contains(.WITHHASH) { out.append("WITHHASH".data(using: .utf8)!) }
    }
}
public enum GeoradiusbymemberRoUnit: ToRedisArgs {
    case m
    case km
    case ft
    case mi
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .m: out.append("m".data(using: .utf8)!)
        case .km: out.append("km".data(using: .utf8)!)
        case .ft: out.append("ft".data(using: .utf8)!)
        case .mi: out.append("mi".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusbymemberRoCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public enum GeoradiusbymemberRoOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusbymemberRoOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCOORD = GeoradiusbymemberRoOptions(rawValue: 1 << 0)
    public static let WITHDIST = GeoradiusbymemberRoOptions(rawValue: 1 << 1)
    public static let WITHHASH = GeoradiusbymemberRoOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCOORD) { out.append("WITHCOORD".data(using: .utf8)!) }
        if self.contains(.WITHDIST) { out.append("WITHDIST".data(using: .utf8)!) }
        if self.contains(.WITHHASH) { out.append("WITHHASH".data(using: .utf8)!) }
    }
}
public enum GeoradiusRoUnit: ToRedisArgs {
    case m
    case km
    case ft
    case mi
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .m: out.append("m".data(using: .utf8)!)
        case .km: out.append("km".data(using: .utf8)!)
        case .ft: out.append("ft".data(using: .utf8)!)
        case .mi: out.append("mi".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusRoCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public enum GeoradiusRoOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeoradiusRoOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCOORD = GeoradiusRoOptions(rawValue: 1 << 0)
    public static let WITHDIST = GeoradiusRoOptions(rawValue: 1 << 1)
    public static let WITHHASH = GeoradiusRoOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCOORD) { out.append("WITHCOORD".data(using: .utf8)!) }
        if self.contains(.WITHDIST) { out.append("WITHDIST".data(using: .utf8)!) }
        if self.contains(.WITHHASH) { out.append("WITHHASH".data(using: .utf8)!) }
    }
}
public enum GeosearchFrom: ToRedisArgs {
    case FROMMEMBER(String)
    case FROMLONLAT(Longitudelatitude)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .FROMMEMBER(let string):
            out.append("FROMMEMBER".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        case .FROMLONLAT(let longitudelatitude):
            out.append("FROMLONLAT".data(using: .utf8)!)
            longitudelatitude.write_redis_args(out: &out)
        }
    }
    public struct Longitudelatitude: ToRedisArgs {
        let longitude: Double
        let latitude: Double
        public init(_ longitude: Double, _ latitude: Double) {
            self.longitude = longitude
            self.latitude = latitude
        }
        public func write_redis_args(out: inout [Data]) {
            longitude.write_redis_args(out: &out)
            latitude.write_redis_args(out: &out)
        }
    }
}
public enum GeosearchBy: ToRedisArgs {
    case CIRCLE(Circle)
    case BOX(Box)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .CIRCLE(let circle): circle.write_redis_args(out: &out)
        case .BOX(let box): box.write_redis_args(out: &out)
        }
    }
    public struct Circle: ToRedisArgs {
        let radius: Double
        let unit: Unit
        public init(_ radius: Double, _ unit: Unit) {
            self.radius = radius
            self.unit = unit
        }
        public func write_redis_args(out: inout [Data]) {
            out.append("BYRADIUS".data(using: .utf8)!)
            radius.write_redis_args(out: &out)
            unit.write_redis_args(out: &out)
        }
        public enum Unit: ToRedisArgs {
            case m
            case km
            case ft
            case mi
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .m: out.append("m".data(using: .utf8)!)
                case .km: out.append("km".data(using: .utf8)!)
                case .ft: out.append("ft".data(using: .utf8)!)
                case .mi: out.append("mi".data(using: .utf8)!)
                }
            }
        }
    }
    public struct Box: ToRedisArgs {
        let width: Double
        let height: Double
        let unit: Unit
        public init(_ width: Double, _ height: Double, _ unit: Unit) {
            self.width = width
            self.height = height
            self.unit = unit
        }
        public func write_redis_args(out: inout [Data]) {
            out.append("BYBOX".data(using: .utf8)!)
            width.write_redis_args(out: &out)
            height.write_redis_args(out: &out)
            unit.write_redis_args(out: &out)
        }
        public enum Unit: ToRedisArgs {
            case m
            case km
            case ft
            case mi
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .m: out.append("m".data(using: .utf8)!)
                case .km: out.append("km".data(using: .utf8)!)
                case .ft: out.append("ft".data(using: .utf8)!)
                case .mi: out.append("mi".data(using: .utf8)!)
                }
            }
        }
    }
}
public enum GeosearchOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeosearchCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public struct GeosearchOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHCOORD = GeosearchOptions(rawValue: 1 << 0)
    public static let WITHDIST = GeosearchOptions(rawValue: 1 << 1)
    public static let WITHHASH = GeosearchOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHCOORD) { out.append("WITHCOORD".data(using: .utf8)!) }
        if self.contains(.WITHDIST) { out.append("WITHDIST".data(using: .utf8)!) }
        if self.contains(.WITHHASH) { out.append("WITHHASH".data(using: .utf8)!) }
    }
}
public enum GeosearchstoreFrom: ToRedisArgs {
    case FROMMEMBER(String)
    case FROMLONLAT(Longitudelatitude)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .FROMMEMBER(let string):
            out.append("FROMMEMBER".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        case .FROMLONLAT(let longitudelatitude):
            out.append("FROMLONLAT".data(using: .utf8)!)
            longitudelatitude.write_redis_args(out: &out)
        }
    }
    public struct Longitudelatitude: ToRedisArgs {
        let longitude: Double
        let latitude: Double
        public init(_ longitude: Double, _ latitude: Double) {
            self.longitude = longitude
            self.latitude = latitude
        }
        public func write_redis_args(out: inout [Data]) {
            longitude.write_redis_args(out: &out)
            latitude.write_redis_args(out: &out)
        }
    }
}
public enum GeosearchstoreBy: ToRedisArgs {
    case CIRCLE(Circle)
    case BOX(Box)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .CIRCLE(let circle): circle.write_redis_args(out: &out)
        case .BOX(let box): box.write_redis_args(out: &out)
        }
    }
    public struct Circle: ToRedisArgs {
        let radius: Double
        let unit: Unit
        public init(_ radius: Double, _ unit: Unit) {
            self.radius = radius
            self.unit = unit
        }
        public func write_redis_args(out: inout [Data]) {
            out.append("BYRADIUS".data(using: .utf8)!)
            radius.write_redis_args(out: &out)
            unit.write_redis_args(out: &out)
        }
        public enum Unit: ToRedisArgs {
            case m
            case km
            case ft
            case mi
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .m: out.append("m".data(using: .utf8)!)
                case .km: out.append("km".data(using: .utf8)!)
                case .ft: out.append("ft".data(using: .utf8)!)
                case .mi: out.append("mi".data(using: .utf8)!)
                }
            }
        }
    }
    public struct Box: ToRedisArgs {
        let width: Double
        let height: Double
        let unit: Unit
        public init(_ width: Double, _ height: Double, _ unit: Unit) {
            self.width = width
            self.height = height
            self.unit = unit
        }
        public func write_redis_args(out: inout [Data]) {
            out.append("BYBOX".data(using: .utf8)!)
            width.write_redis_args(out: &out)
            height.write_redis_args(out: &out)
            unit.write_redis_args(out: &out)
        }
        public enum Unit: ToRedisArgs {
            case m
            case km
            case ft
            case mi
            public func write_redis_args(out: inout [Data]) {
                switch self {
                case .m: out.append("m".data(using: .utf8)!)
                case .km: out.append("km".data(using: .utf8)!)
                case .ft: out.append("ft".data(using: .utf8)!)
                case .mi: out.append("mi".data(using: .utf8)!)
                }
            }
        }
    }
}
public enum GeosearchstoreOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct GeosearchstoreCount: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("COUNT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let ANY = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.ANY) { out.append("ANY".data(using: .utf8)!) }
        }
    }
}
public struct GeosearchstoreOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let STOREDIST = GeosearchstoreOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.STOREDIST) { out.append("STOREDIST".data(using: .utf8)!) }
    }
}
public enum GetexExpiration: ToRedisArgs {
    case EX(Int)
    case PX(Int)
    case EXAT(Int64)
    case PXAT(Int64)
    case PERSIST
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .EX(let int):
            out.append("EX".data(using: .utf8)!)
            int.write_redis_args(out: &out)
        case .PX(let int):
            out.append("PX".data(using: .utf8)!)
            int.write_redis_args(out: &out)
        case .EXAT(let int64):
            out.append("EXAT".data(using: .utf8)!)
            int64.write_redis_args(out: &out)
        case .PXAT(let int64):
            out.append("PXAT".data(using: .utf8)!)
            int64.write_redis_args(out: &out)
        case .PERSIST: out.append("PERSIST".data(using: .utf8)!)
        }
    }
}
public struct HelloArguments: ToRedisArgs {
    let protover: Int
    let usernamePassword: Usernamepassword?
    let clientname: String?
    public init(_ protover: Int, _ usernamePassword: Usernamepassword? = nil, _ clientname: String? = nil) {
        self.protover = protover
        self.usernamePassword = usernamePassword
        self.clientname = clientname
    }
    public func write_redis_args(out: inout [Data]) {
        protover.write_redis_args(out: &out)
        out.append("AUTH".data(using: .utf8)!)
        usernamePassword.write_redis_args(out: &out)
        out.append("SETNAME".data(using: .utf8)!)
        clientname.write_redis_args(out: &out)
    }
    public struct Usernamepassword: ToRedisArgs {
        let username: String
        let password: String
        public init(_ username: String, _ password: String) {
            self.username = username
            self.password = password
        }
        public func write_redis_args(out: inout [Data]) {
            username.write_redis_args(out: &out)
            password.write_redis_args(out: &out)
        }
    }
}
public struct HmsetFieldvalue: ToRedisArgs {
    let field: String
    let value: String
    public init(_ field: String, _ value: String) {
        self.field = field
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        field.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public struct HrandfieldOptions: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let WITHVALUES = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.WITHVALUES) { out.append("WITHVALUES".data(using: .utf8)!) }
        }
    }
}
public struct HsetFieldvalue: ToRedisArgs {
    let field: String
    let value: String
    public init(_ field: String, _ value: String) {
        self.field = field
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        field.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public struct LcsOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let LEN = LcsOptions(rawValue: 1 << 0)
    public static let IDX = LcsOptions(rawValue: 1 << 1)
    public static let WITHMATCHLEN = LcsOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.LEN) { out.append("LEN".data(using: .utf8)!) }
        if self.contains(.IDX) { out.append("IDX".data(using: .utf8)!) }
        if self.contains(.WITHMATCHLEN) { out.append("WITHMATCHLEN".data(using: .utf8)!) }
    }
}
public enum LinsertRwhere: ToRedisArgs {
    case BEFORE
    case AFTER
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .BEFORE: out.append("BEFORE".data(using: .utf8)!)
        case .AFTER: out.append("AFTER".data(using: .utf8)!)
        }
    }
}
public enum LmoveWherefrom: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum LmoveWhereto: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum LmpopRwhere: ToRedisArgs {
    case LEFT
    case RIGHT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .LEFT: out.append("LEFT".data(using: .utf8)!)
        case .RIGHT: out.append("RIGHT".data(using: .utf8)!)
        }
    }
}
public enum MigrateKeyoremptystring: ToRedisArgs {
    case KEY(String)
    case EMPTY_STRING
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .KEY(let string): string.write_redis_args(out: &out)
        case .EMPTY_STRING: out.append("\"\"".data(using: .utf8)!)
        }
    }
}
public enum MigrateAuthentication: ToRedisArgs {
    case AUTH(String)
    case AUTH2(Usernamepassword)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .AUTH(let string):
            out.append("AUTH".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        case .AUTH2(let usernamepassword):
            out.append("AUTH2".data(using: .utf8)!)
            usernamepassword.write_redis_args(out: &out)
        }
    }
    public struct Usernamepassword: ToRedisArgs {
        let username: String
        let password: String
        public init(_ username: String, _ password: String) {
            self.username = username
            self.password = password
        }
        public func write_redis_args(out: inout [Data]) {
            username.write_redis_args(out: &out)
            password.write_redis_args(out: &out)
        }
    }
}
public struct MigrateOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let COPY = MigrateOptions(rawValue: 1 << 0)
    public static let REPLACE = MigrateOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.COPY) { out.append("COPY".data(using: .utf8)!) }
        if self.contains(.REPLACE) { out.append("REPLACE".data(using: .utf8)!) }
    }
}
public struct MsetKeyvalue: ToRedisArgs {
    let key: String
    let value: String
    public init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        key.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public struct MsetnxKeyvalue: ToRedisArgs {
    let key: String
    let value: String
    public init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        key.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public enum PexpireCondition: ToRedisArgs {
    case NX
    case XX
    case GT
    case LT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        case .GT: out.append("GT".data(using: .utf8)!)
        case .LT: out.append("LT".data(using: .utf8)!)
        }
    }
}
public enum PexpireatCondition: ToRedisArgs {
    case NX
    case XX
    case GT
    case LT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        case .GT: out.append("GT".data(using: .utf8)!)
        case .LT: out.append("LT".data(using: .utf8)!)
        }
    }
}
public struct RestoreOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REPLACE = RestoreOptions(rawValue: 1 << 0)
    public static let ABSTTL = RestoreOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.REPLACE) { out.append("REPLACE".data(using: .utf8)!) }
        if self.contains(.ABSTTL) { out.append("ABSTTL".data(using: .utf8)!) }
    }
}
public struct RestoreAskingOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REPLACE = RestoreAskingOptions(rawValue: 1 << 0)
    public static let ABSTTL = RestoreAskingOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.REPLACE) { out.append("REPLACE".data(using: .utf8)!) }
        if self.contains(.ABSTTL) { out.append("ABSTTL".data(using: .utf8)!) }
    }
}
public enum SetCondition: ToRedisArgs {
    case NX
    case XX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        }
    }
}
public enum SetExpiration: ToRedisArgs {
    case EX(Int)
    case PX(Int)
    case EXAT(Int64)
    case PXAT(Int64)
    case KEEPTTL
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .EX(let int):
            out.append("EX".data(using: .utf8)!)
            int.write_redis_args(out: &out)
        case .PX(let int):
            out.append("PX".data(using: .utf8)!)
            int.write_redis_args(out: &out)
        case .EXAT(let int64):
            out.append("EXAT".data(using: .utf8)!)
            int64.write_redis_args(out: &out)
        case .PXAT(let int64):
            out.append("PXAT".data(using: .utf8)!)
            int64.write_redis_args(out: &out)
        case .KEEPTTL: out.append("KEEPTTL".data(using: .utf8)!)
        }
    }
}
public struct SetOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let GET = SetOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) { if self.contains(.GET) { out.append("GET".data(using: .utf8)!) } }
}
public enum ShutdownNosavesave: ToRedisArgs {
    case NOSAVE
    case SAVE
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NOSAVE: out.append("NOSAVE".data(using: .utf8)!)
        case .SAVE: out.append("SAVE".data(using: .utf8)!)
        }
    }
}
public struct ShutdownOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let NOW = ShutdownOptions(rawValue: 1 << 0)
    public static let FORCE = ShutdownOptions(rawValue: 1 << 1)
    public static let ABORT = ShutdownOptions(rawValue: 1 << 2)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.NOW) { out.append("NOW".data(using: .utf8)!) }
        if self.contains(.FORCE) { out.append("FORCE".data(using: .utf8)!) }
        if self.contains(.ABORT) { out.append("ABORT".data(using: .utf8)!) }
    }
}
public struct SortOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public enum SortOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct SortOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let ALPHA = SortOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.ALPHA) { out.append("ALPHA".data(using: .utf8)!) }
    }
}
public struct SortRoOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public enum SortRoOrder: ToRedisArgs {
    case ASC
    case DESC
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .ASC: out.append("ASC".data(using: .utf8)!)
        case .DESC: out.append("DESC".data(using: .utf8)!)
        }
    }
}
public struct SortRoOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let ALPHA = SortRoOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.ALPHA) { out.append("ALPHA".data(using: .utf8)!) }
    }
}
public struct XaddTrim: ToRedisArgs {
    let strategy: Strategy
    let rOperator: Roperator?
    let threshold: String
    let count: Int?
    public init(_ strategy: Strategy, _ rOperator: Roperator? = nil, _ threshold: String, _ count: Int? = nil) {
        self.strategy = strategy
        self.rOperator = rOperator
        self.threshold = threshold
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        strategy.write_redis_args(out: &out)
        rOperator.write_redis_args(out: &out)
        threshold.write_redis_args(out: &out)
        out.append("LIMIT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
    }
    public enum Strategy: ToRedisArgs {
        case MAXLEN
        case MINID
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .MAXLEN: out.append("MAXLEN".data(using: .utf8)!)
            case .MINID: out.append("MINID".data(using: .utf8)!)
            }
        }
    }
    public enum Roperator: ToRedisArgs {
        case EQUAL
        case APPROXIMATELY
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .EQUAL: out.append("=".data(using: .utf8)!)
            case .APPROXIMATELY: out.append("~".data(using: .utf8)!)
            }
        }
    }
}
public enum XaddIdorauto: ToRedisArgs {
    case AUTO_ID
    case ID(String)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .AUTO_ID: out.append("*".data(using: .utf8)!)
        case .ID(let string): string.write_redis_args(out: &out)
        }
    }
}
public struct XaddFieldvalue: ToRedisArgs {
    let field: String
    let value: String
    public init(_ field: String, _ value: String) {
        self.field = field
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        field.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public struct XaddOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let NOMKSTREAM = XaddOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.NOMKSTREAM) { out.append("NOMKSTREAM".data(using: .utf8)!) }
    }
}
public struct XautoclaimOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let JUSTID = XautoclaimOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.JUSTID) { out.append("JUSTID".data(using: .utf8)!) }
    }
}
public struct XclaimOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let FORCE = XclaimOptions(rawValue: 1 << 0)
    public static let JUSTID = XclaimOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.FORCE) { out.append("FORCE".data(using: .utf8)!) }
        if self.contains(.JUSTID) { out.append("JUSTID".data(using: .utf8)!) }
    }
}
public struct XpendingFilters: ToRedisArgs {
    let minIdleTime: Int?
    let start: String
    let end: String
    let count: Int
    let consumer: String?
    public init(_ minIdleTime: Int? = nil, _ start: String, _ end: String, _ count: Int, _ consumer: String? = nil) {
        self.minIdleTime = minIdleTime
        self.start = start
        self.end = end
        self.count = count
        self.consumer = consumer
    }
    public func write_redis_args(out: inout [Data]) {
        out.append("IDLE".data(using: .utf8)!)
        minIdleTime.write_redis_args(out: &out)
        start.write_redis_args(out: &out)
        end.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
        consumer.write_redis_args(out: &out)
    }
}
public struct XreadStreams: ToRedisArgs {
    let key: [String]
    let id: [String]
    public init(_ key: String..., id: String...) {
        self.key = key
        self.id = id
    }
    public func write_redis_args(out: inout [Data]) {
        key.write_redis_args(out: &out)
        id.write_redis_args(out: &out)
    }
}
public struct XreadgroupGroupconsumer: ToRedisArgs {
    let group: String
    let consumer: String
    public init(_ group: String, _ consumer: String) {
        self.group = group
        self.consumer = consumer
    }
    public func write_redis_args(out: inout [Data]) {
        group.write_redis_args(out: &out)
        consumer.write_redis_args(out: &out)
    }
}
public struct XreadgroupStreams: ToRedisArgs {
    let key: [String]
    let id: [String]
    public init(_ key: String..., id: String...) {
        self.key = key
        self.id = id
    }
    public func write_redis_args(out: inout [Data]) {
        key.write_redis_args(out: &out)
        id.write_redis_args(out: &out)
    }
}
public struct XreadgroupOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let NOACK = XreadgroupOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.NOACK) { out.append("NOACK".data(using: .utf8)!) }
    }
}
public struct XtrimTrim: ToRedisArgs {
    let strategy: Strategy
    let rOperator: Roperator?
    let threshold: String
    let count: Int?
    public init(_ strategy: Strategy, _ rOperator: Roperator? = nil, _ threshold: String, _ count: Int? = nil) {
        self.strategy = strategy
        self.rOperator = rOperator
        self.threshold = threshold
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        strategy.write_redis_args(out: &out)
        rOperator.write_redis_args(out: &out)
        threshold.write_redis_args(out: &out)
        out.append("LIMIT".data(using: .utf8)!)
        count.write_redis_args(out: &out)
    }
    public enum Strategy: ToRedisArgs {
        case MAXLEN
        case MINID
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .MAXLEN: out.append("MAXLEN".data(using: .utf8)!)
            case .MINID: out.append("MINID".data(using: .utf8)!)
            }
        }
    }
    public enum Roperator: ToRedisArgs {
        case EQUAL
        case APPROXIMATELY
        public func write_redis_args(out: inout [Data]) {
            switch self {
            case .EQUAL: out.append("=".data(using: .utf8)!)
            case .APPROXIMATELY: out.append("~".data(using: .utf8)!)
            }
        }
    }
}
public enum ZaddCondition: ToRedisArgs {
    case NX
    case XX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .NX: out.append("NX".data(using: .utf8)!)
        case .XX: out.append("XX".data(using: .utf8)!)
        }
    }
}
public enum ZaddComparison: ToRedisArgs {
    case GT
    case LT
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .GT: out.append("GT".data(using: .utf8)!)
        case .LT: out.append("LT".data(using: .utf8)!)
        }
    }
}
public struct ZaddScoremember: ToRedisArgs {
    let score: Double
    let member: String
    public init(_ score: Double, _ member: String) {
        self.score = score
        self.member = member
    }
    public func write_redis_args(out: inout [Data]) {
        score.write_redis_args(out: &out)
        member.write_redis_args(out: &out)
    }
}
public struct ZaddOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let CH = ZaddOptions(rawValue: 1 << 0)
    public static let INCR = ZaddOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.CH) { out.append("CH".data(using: .utf8)!) }
        if self.contains(.INCR) { out.append("INCR".data(using: .utf8)!) }
    }
}
public struct ZdiffOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZdiffOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public enum ZinterAggregate: ToRedisArgs {
    case SUM
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SUM: out.append("SUM".data(using: .utf8)!)
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
public struct ZinterOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZinterOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public enum ZinterstoreAggregate: ToRedisArgs {
    case SUM
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SUM: out.append("SUM".data(using: .utf8)!)
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
public enum ZmpopRwhere: ToRedisArgs {
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
public struct ZrandmemberOptions: ToRedisArgs {
    let count: Int
    let options: Options?
    public init(_ count: Int, _ options: Options? = nil) {
        self.count = count
        self.options = options
    }
    public func write_redis_args(out: inout [Data]) {
        count.write_redis_args(out: &out)
        options.write_redis_args(out: &out)
    }
    public struct Options: OptionSet, ToRedisArgs {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        public static let WITHSCORES = Options(rawValue: 1 << 0)
        public func write_redis_args(out: inout [Data]) {
            if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
        }
    }
}
public enum ZrangeSortby: ToRedisArgs {
    case BYSCORE
    case BYLEX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .BYSCORE: out.append("BYSCORE".data(using: .utf8)!)
        case .BYLEX: out.append("BYLEX".data(using: .utf8)!)
        }
    }
}
public struct ZrangeOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrangeOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REV = ZrangeOptions(rawValue: 1 << 0)
    public static let WITHSCORES = ZrangeOptions(rawValue: 1 << 1)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.REV) { out.append("REV".data(using: .utf8)!) }
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public struct ZrangebylexOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrangebyscoreOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrangebyscoreOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZrangebyscoreOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public enum ZrangestoreSortby: ToRedisArgs {
    case BYSCORE
    case BYLEX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .BYSCORE: out.append("BYSCORE".data(using: .utf8)!)
        case .BYLEX: out.append("BYLEX".data(using: .utf8)!)
        }
    }
}
public struct ZrangestoreOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrangestoreOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let REV = ZrangestoreOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) { if self.contains(.REV) { out.append("REV".data(using: .utf8)!) } }
}
public struct ZrevrangeOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZrevrangeOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public struct ZrevrangebylexOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrevrangebyscoreOffsetcount: ToRedisArgs {
    let offset: Int
    let count: Int
    public init(_ offset: Int, _ count: Int) {
        self.offset = offset
        self.count = count
    }
    public func write_redis_args(out: inout [Data]) {
        offset.write_redis_args(out: &out)
        count.write_redis_args(out: &out)
    }
}
public struct ZrevrangebyscoreOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZrevrangebyscoreOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public enum ZunionAggregate: ToRedisArgs {
    case SUM
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SUM: out.append("SUM".data(using: .utf8)!)
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
public struct ZunionOptions: OptionSet, ToRedisArgs {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public static let WITHSCORES = ZunionOptions(rawValue: 1 << 0)
    public func write_redis_args(out: inout [Data]) {
        if self.contains(.WITHSCORES) { out.append("WITHSCORES".data(using: .utf8)!) }
    }
}
public enum ZunionstoreAggregate: ToRedisArgs {
    case SUM
    case MIN
    case MAX
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SUM: out.append("SUM".data(using: .utf8)!)
        case .MIN: out.append("MIN".data(using: .utf8)!)
        case .MAX: out.append("MAX".data(using: .utf8)!)
        }
    }
}
