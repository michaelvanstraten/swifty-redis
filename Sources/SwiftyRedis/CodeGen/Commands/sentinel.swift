//
//  sentinel.swift
//
//
//  Created by CodeGen on 15.09.23.
//
import Foundation
extension RedisConnection {
    /// Returns the state of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MASTER](https://redis.io/commands/sentinel-master)
    public func sentinel_master<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("MASTER").arg(masterName)
        return try await cmd.query(self)
    }
    /// Returns the state of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MASTER](https://redis.io/commands/sentinel-master)
    public func sentinel_master(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("MASTER").arg(masterName)
        try await cmd.exec(self)
    }
    /// Simulates failover scenarios.
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure<T: FromRedisValue>(_ mode: SentinelSimulateFailureMode...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        return try await cmd.query(self)
    }
    /// Simulates failover scenarios.
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure(_ mode: SentinelSimulateFailureMode...) async throws {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        try await cmd.exec(self)
    }
    /// Forces a Redis Sentinel failover.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        return try await cmd.query(self)
    }
    /// Forces a Redis Sentinel failover.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        try await cmd.exec(self)
    }
    /// Returns a list of the monitored Redis replicas.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas
    /// ## Documentation
    /// view the docs for [SENTINEL REPLICAS](https://redis.io/commands/sentinel-replicas)
    public func sentinel_replicas<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("REPLICAS").arg(masterName)
        return try await cmd.query(self)
    }
    /// Returns a list of the monitored Redis replicas.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas
    /// ## Documentation
    /// view the docs for [SENTINEL REPLICAS](https://redis.io/commands/sentinel-replicas)
    public func sentinel_replicas(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("REPLICAS").arg(masterName)
        try await cmd.exec(self)
    }
    /// Returns a list of monitored Redis masters.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of masters
    /// ## Documentation
    /// view the docs for [SENTINEL MASTERS](https://redis.io/commands/sentinel-masters)
    public func sentinel_masters<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("MASTERS")
        return try await cmd.query(self)
    }
    /// Returns a list of monitored Redis masters.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of masters
    /// ## Documentation
    /// view the docs for [SENTINEL MASTERS](https://redis.io/commands/sentinel-masters)
    public func sentinel_masters() async throws {
        let cmd = Cmd("SENTINEL").arg("MASTERS")
        try await cmd.exec(self)
    }
    /// Returns the Redis Sentinel instance ID.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MYID](https://redis.io/commands/sentinel-myid)
    public func sentinel_myid<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("MYID")
        return try await cmd.query(self)
    }
    /// Returns the Redis Sentinel instance ID.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MYID](https://redis.io/commands/sentinel-myid)
    public func sentinel_myid() async throws {
        let cmd = Cmd("SENTINEL").arg("MYID")
        try await cmd.exec(self)
    }
    /// Returns information about pending scripts for Redis Sentinel.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        return try await cmd.query(self)
    }
    /// Returns information about pending scripts for Redis Sentinel.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts() async throws {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        try await cmd.exec(self)
    }
    /// Lists or updates the current configurable parameters of Redis Sentinel.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug<T: FromRedisValue>(_ data: SentinelDebugData...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(data)
        return try await cmd.query(self)
    }
    /// Lists or updates the current configurable parameters of Redis Sentinel.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug(_ data: SentinelDebugData...) async throws {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(data)
        try await cmd.exec(self)
    }
    /// Returns the cached `INFO` replies from the deployment's instances.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of instances
    /// ## Documentation
    /// view the docs for [SENTINEL INFO_CACHE](https://redis.io/commands/sentinel-info-cache)
    public func sentinel_info_cache<T: FromRedisValue>(_ nodename: String...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("INFO_CACHE").arg(nodename)
        return try await cmd.query(self)
    }
    /// Returns the cached `INFO` replies from the deployment's instances.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of instances
    /// ## Documentation
    /// view the docs for [SENTINEL INFO_CACHE](https://redis.io/commands/sentinel-info-cache)
    public func sentinel_info_cache(_ nodename: String...) async throws {
        let cmd = Cmd("SENTINEL").arg("INFO_CACHE").arg(nodename)
        try await cmd.exec(self)
    }
    /// Stops monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL REMOVE](https://redis.io/commands/sentinel-remove)
    public func sentinel_remove<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("REMOVE").arg(masterName)
        return try await cmd.query(self)
    }
    /// Stops monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL REMOVE](https://redis.io/commands/sentinel-remove)
    public func sentinel_remove(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("REMOVE").arg(masterName)
        try await cmd.exec(self)
    }
    /// Determines whether a master Redis instance is down.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL IS_MASTER_DOWN_BY_ADDR](https://redis.io/commands/sentinel-is-master-down-by-addr)
    public func sentinel_is_master_down_by_addr<T: FromRedisValue>(
        _ ip: String, _ port: Int, _ currentEpoch: Int, _ runid: String
    ) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("IS_MASTER_DOWN_BY_ADDR").arg(ip).arg(port).arg(currentEpoch).arg(runid)
        return try await cmd.query(self)
    }
    /// Determines whether a master Redis instance is down.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL IS_MASTER_DOWN_BY_ADDR](https://redis.io/commands/sentinel-is-master-down-by-addr)
    public func sentinel_is_master_down_by_addr(_ ip: String, _ port: Int, _ currentEpoch: Int, _ runid: String)
        async throws
    {
        let cmd = Cmd("SENTINEL").arg("IS_MASTER_DOWN_BY_ADDR").arg(ip).arg(port).arg(currentEpoch).arg(runid)
        try await cmd.exec(self)
    }
    /// Rewrites the Redis Sentinel configuration file.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL FLUSHCONFIG](https://redis.io/commands/sentinel-flushconfig)
    public func sentinel_flushconfig<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("FLUSHCONFIG")
        return try await cmd.query(self)
    }
    /// Rewrites the Redis Sentinel configuration file.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL FLUSHCONFIG](https://redis.io/commands/sentinel-flushconfig)
    public func sentinel_flushconfig() async throws {
        let cmd = Cmd("SENTINEL").arg("FLUSHCONFIG")
        try await cmd.exec(self)
    }
    /// Returns the port and address of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL GET_MASTER_ADDR_BY_NAME](https://redis.io/commands/sentinel-get-master-addr-by-name)
    public func sentinel_get_master_addr_by_name<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("GET_MASTER_ADDR_BY_NAME").arg(masterName)
        return try await cmd.query(self)
    }
    /// Returns the port and address of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL GET_MASTER_ADDR_BY_NAME](https://redis.io/commands/sentinel-get-master-addr-by-name)
    public func sentinel_get_master_addr_by_name(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("GET_MASTER_ADDR_BY_NAME").arg(masterName)
        try await cmd.exec(self)
    }
    /// Configures Redis Sentinel.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.2.0, Added the ability to set and get multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config<T: FromRedisValue>(_ action: SentinelConfigAction) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(action)
        return try await cmd.query(self)
    }
    /// Configures Redis Sentinel.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.2.0, Added the ability to set and get multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config(_ action: SentinelConfigAction) async throws {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(action)
        try await cmd.exec(self)
    }
    /// Returns a list of Sentinel instances.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of Sentinels
    /// ## Documentation
    /// view the docs for [SENTINEL SENTINELS](https://redis.io/commands/sentinel-sentinels)
    public func sentinel_sentinels<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SENTINELS").arg(masterName)
        return try await cmd.query(self)
    }
    /// Returns a list of Sentinel instances.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of Sentinels
    /// ## Documentation
    /// view the docs for [SENTINEL SENTINELS](https://redis.io/commands/sentinel-sentinels)
    public func sentinel_sentinels(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("SENTINELS").arg(masterName)
        try await cmd.exec(self)
    }
    /// Checks for a Redis Sentinel quorum.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        return try await cmd.query(self)
    }
    /// Checks for a Redis Sentinel quorum.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        try await cmd.exec(self)
    }
    /// Starts monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MONITOR](https://redis.io/commands/sentinel-monitor)
    public func sentinel_monitor<T: FromRedisValue>(_ name: String, _ ip: String, _ port: Int, _ quorum: Int)
        async throws -> T
    {
        let cmd = Cmd("SENTINEL").arg("MONITOR").arg(name).arg(ip).arg(port).arg(quorum)
        return try await cmd.query(self)
    }
    /// Starts monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MONITOR](https://redis.io/commands/sentinel-monitor)
    public func sentinel_monitor(_ name: String, _ ip: String, _ port: Int, _ quorum: Int) async throws {
        let cmd = Cmd("SENTINEL").arg("MONITOR").arg(name).arg(ip).arg(port).arg(quorum)
        try await cmd.exec(self)
    }
    /// Returns a list of the monitored replicas.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas.
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        return try await cmd.query(self)
    }
    /// Returns a list of the monitored replicas.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas.
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        try await cmd.exec(self)
    }
    /// Resets Redis masters by name matching a pattern.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of monitored masters
    /// ## Documentation
    /// view the docs for [SENTINEL RESET](https://redis.io/commands/sentinel-reset)
    public func sentinel_reset<T: FromRedisValue>(_ pattern: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("RESET").arg(pattern)
        return try await cmd.query(self)
    }
    /// Resets Redis masters by name matching a pattern.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of monitored masters
    /// ## Documentation
    /// view the docs for [SENTINEL RESET](https://redis.io/commands/sentinel-reset)
    public func sentinel_reset(_ pattern: String) async throws {
        let cmd = Cmd("SENTINEL").arg("RESET").arg(pattern)
        try await cmd.exec(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL HELP](https://redis.io/commands/sentinel-help)
    public func sentinel_help<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("HELP")
        return try await cmd.query(self)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL HELP](https://redis.io/commands/sentinel-help)
    public func sentinel_help() async throws {
        let cmd = Cmd("SENTINEL").arg("HELP")
        try await cmd.exec(self)
    }
    /// Changes the configuration of a monitored Redis master.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set<T: FromRedisValue>(_ masterName: String, _ data: SentinelSetData...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(data)
        return try await cmd.query(self)
    }
    /// Changes the configuration of a monitored Redis master.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set(_ masterName: String, _ data: SentinelSetData...) async throws {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(data)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Returns the state of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MASTER](https://redis.io/commands/sentinel-master)
    public func sentinel_master(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("MASTER").arg(masterName)
        return self.add_command(cmd)
    }
    /// Simulates failover scenarios.
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure(_ mode: SentinelSimulateFailureMode...) -> Self {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        return self.add_command(cmd)
    }
    /// Forces a Redis Sentinel failover.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        return self.add_command(cmd)
    }
    /// Returns a list of the monitored Redis replicas.
    /// ## Available since
    /// 5.0.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas
    /// ## Documentation
    /// view the docs for [SENTINEL REPLICAS](https://redis.io/commands/sentinel-replicas)
    public func sentinel_replicas(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("REPLICAS").arg(masterName)
        return self.add_command(cmd)
    }
    /// Returns a list of monitored Redis masters.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of masters
    /// ## Documentation
    /// view the docs for [SENTINEL MASTERS](https://redis.io/commands/sentinel-masters)
    public func sentinel_masters() -> Self {
        let cmd = Cmd("SENTINEL").arg("MASTERS")
        return self.add_command(cmd)
    }
    /// Returns the Redis Sentinel instance ID.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MYID](https://redis.io/commands/sentinel-myid)
    public func sentinel_myid() -> Self {
        let cmd = Cmd("SENTINEL").arg("MYID")
        return self.add_command(cmd)
    }
    /// Returns information about pending scripts for Redis Sentinel.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts() -> Self {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        return self.add_command(cmd)
    }
    /// Lists or updates the current configurable parameters of Redis Sentinel.
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug(_ data: SentinelDebugData...) -> Self {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(data)
        return self.add_command(cmd)
    }
    /// Returns the cached `INFO` replies from the deployment's instances.
    /// ## Available since
    /// 3.2.0
    /// ## Time complexity
    /// O(N) where N is the number of instances
    /// ## Documentation
    /// view the docs for [SENTINEL INFO_CACHE](https://redis.io/commands/sentinel-info-cache)
    public func sentinel_info_cache(_ nodename: String...) -> Self {
        let cmd = Cmd("SENTINEL").arg("INFO_CACHE").arg(nodename)
        return self.add_command(cmd)
    }
    /// Stops monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL REMOVE](https://redis.io/commands/sentinel-remove)
    public func sentinel_remove(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("REMOVE").arg(masterName)
        return self.add_command(cmd)
    }
    /// Determines whether a master Redis instance is down.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL IS_MASTER_DOWN_BY_ADDR](https://redis.io/commands/sentinel-is-master-down-by-addr)
    public func sentinel_is_master_down_by_addr(_ ip: String, _ port: Int, _ currentEpoch: Int, _ runid: String) -> Self
    {
        let cmd = Cmd("SENTINEL").arg("IS_MASTER_DOWN_BY_ADDR").arg(ip).arg(port).arg(currentEpoch).arg(runid)
        return self.add_command(cmd)
    }
    /// Rewrites the Redis Sentinel configuration file.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL FLUSHCONFIG](https://redis.io/commands/sentinel-flushconfig)
    public func sentinel_flushconfig() -> Self {
        let cmd = Cmd("SENTINEL").arg("FLUSHCONFIG")
        return self.add_command(cmd)
    }
    /// Returns the port and address of a master Redis instance.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL GET_MASTER_ADDR_BY_NAME](https://redis.io/commands/sentinel-get-master-addr-by-name)
    public func sentinel_get_master_addr_by_name(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("GET_MASTER_ADDR_BY_NAME").arg(masterName)
        return self.add_command(cmd)
    }
    /// Configures Redis Sentinel.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(N) when N is the number of configuration parameters provided
    /// ## History
    /// - 7.2.0, Added the ability to set and get multiple parameters in one call.
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config(_ action: SentinelConfigAction) -> Self {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(action)
        return self.add_command(cmd)
    }
    /// Returns a list of Sentinel instances.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of Sentinels
    /// ## Documentation
    /// view the docs for [SENTINEL SENTINELS](https://redis.io/commands/sentinel-sentinels)
    public func sentinel_sentinels(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("SENTINELS").arg(masterName)
        return self.add_command(cmd)
    }
    /// Checks for a Redis Sentinel quorum.
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        return self.add_command(cmd)
    }
    /// Starts monitoring.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL MONITOR](https://redis.io/commands/sentinel-monitor)
    public func sentinel_monitor(_ name: String, _ ip: String, _ port: Int, _ quorum: Int) -> Self {
        let cmd = Cmd("SENTINEL").arg("MONITOR").arg(name).arg(ip).arg(port).arg(quorum)
        return self.add_command(cmd)
    }
    /// Returns a list of the monitored replicas.
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of replicas.
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        return self.add_command(cmd)
    }
    /// Resets Redis masters by name matching a pattern.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(N) where N is the number of monitored masters
    /// ## Documentation
    /// view the docs for [SENTINEL RESET](https://redis.io/commands/sentinel-reset)
    public func sentinel_reset(_ pattern: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("RESET").arg(pattern)
        return self.add_command(cmd)
    }
    /// Returns helpful text about the different subcommands.
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL HELP](https://redis.io/commands/sentinel-help)
    public func sentinel_help() -> Self {
        let cmd = Cmd("SENTINEL").arg("HELP")
        return self.add_command(cmd)
    }
    /// Changes the configuration of a monitored Redis master.
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set(_ masterName: String, _ data: SentinelSetData...) -> Self {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(data)
        return self.add_command(cmd)
    }
}
public enum SentinelSimulateFailureMode: ToRedisArgs {
    case CRASH_AFTER_ELECTION
    case CRASH_AFTER_PROMOTION
    case HELP
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .CRASH_AFTER_ELECTION: out.append("crash-after-election".data(using: .utf8)!)
        case .CRASH_AFTER_PROMOTION: out.append("crash-after-promotion".data(using: .utf8)!)
        case .HELP: out.append("help".data(using: .utf8)!)
        }
    }
}
public struct SentinelDebugData: ToRedisArgs {
    let parameter: String
    let value: String
    public init(_ parameter: String, _ value: String) {
        self.parameter = parameter
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        parameter.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
public enum SentinelConfigAction: ToRedisArgs {
    case SET(Set)
    case GET(String)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SET(let set):
            out.append("SET".data(using: .utf8)!)
            set.write_redis_args(out: &out)
        case .GET(let string):
            out.append("GET".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        }
    }
    public struct Set: ToRedisArgs {
        let parameter: String
        let value: String
        public init(_ parameter: String, _ value: String) {
            self.parameter = parameter
            self.value = value
        }
        public func write_redis_args(out: inout [Data]) {
            parameter.write_redis_args(out: &out)
            value.write_redis_args(out: &out)
        }
    }
}
public struct SentinelSetData: ToRedisArgs {
    let option: String
    let value: String
    public init(_ option: String, _ value: String) {
        self.option = option
        self.value = value
    }
    public func write_redis_args(out: inout [Data]) {
        option.write_redis_args(out: &out)
        value.write_redis_args(out: &out)
    }
}
