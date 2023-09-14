//
//  sentinel.swift
//
//
//  Created by CodeGen on 14.09.23.
//
import Foundation
extension RedisConnection {
    /// Shows the state of a master
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
    /// Shows the state of a master
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
    /// Simulate failover scenarios
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure<T: FromRedisValue>(_ mode: SentinelSimulateFailureMode...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        return try await cmd.query(self)
    }
    /// Simulate failover scenarios
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure(_ mode: SentinelSimulateFailureMode...) async throws {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        try await cmd.exec(self)
    }
    /// Force a failover
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        return try await cmd.query(self)
    }
    /// Force a failover
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        try await cmd.exec(self)
    }
    /// List the monitored replicas
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
    /// List the monitored replicas
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
    /// List the monitored masters
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
    /// List the monitored masters
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
    /// Get the Sentinel instance ID
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
    /// Get the Sentinel instance ID
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
    /// Get information about pending scripts
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts<T: FromRedisValue>() async throws -> T {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        return try await cmd.query(self)
    }
    /// Get information about pending scripts
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts() async throws {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        try await cmd.exec(self)
    }
    /// List or update the current configurable parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug<T: FromRedisValue>(_ parameterValue: SentinelDebugParametervalue...) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(parameterValue)
        return try await cmd.query(self)
    }
    /// List or update the current configurable parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug(_ parameterValue: SentinelDebugParametervalue...) async throws {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(parameterValue)
        try await cmd.exec(self)
    }
    /// Get cached INFO from the instances in the deployment
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
    /// Get cached INFO from the instances in the deployment
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
    /// Stop monitoring
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
    /// Stop monitoring
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
    /// Check if a master is down
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
    /// Check if a master is down
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
    /// Rewrite configuration file
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
    /// Rewrite configuration file
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
    /// Get port and address of a master
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
    /// Get port and address of a master
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
    /// Configure Sentinel
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config<T: FromRedisValue>(_ setOrGet: SentinelConfigSetorget) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(setOrGet)
        return try await cmd.query(self)
    }
    /// Configure Sentinel
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config(_ setOrGet: SentinelConfigSetorget) async throws {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(setOrGet)
        try await cmd.exec(self)
    }
    /// List the Sentinel instances
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
    /// List the Sentinel instances
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
    /// Check for a Sentinel quorum
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        return try await cmd.query(self)
    }
    /// Check for a Sentinel quorum
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        try await cmd.exec(self)
    }
    /// Start monitoring
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
    /// Start monitoring
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
    /// List the monitored slaves
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of slaves
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves<T: FromRedisValue>(_ masterName: String) async throws -> T {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        return try await cmd.query(self)
    }
    /// List the monitored slaves
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of slaves
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves(_ masterName: String) async throws {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        try await cmd.exec(self)
    }
    /// Reset masters by name pattern
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
    /// Reset masters by name pattern
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
    /// Show helpful text about the different subcommands
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
    /// Show helpful text about the different subcommands
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
    /// Change the configuration of a monitored master
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set<T: FromRedisValue>(_ masterName: String, _ optionValue: SentinelSetOptionvalue...)
        async throws -> T
    {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(optionValue)
        return try await cmd.query(self)
    }
    /// Change the configuration of a monitored master
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set(_ masterName: String, _ optionValue: SentinelSetOptionvalue...) async throws {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(optionValue)
        try await cmd.exec(self)
    }
}
extension RedisPipeline {
    /// Shows the state of a master
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
    /// Simulate failover scenarios
    /// ## Available since
    /// 3.2.0
    /// ## Documentation
    /// view the docs for [SENTINEL SIMULATE_FAILURE](https://redis.io/commands/sentinel-simulate-failure)
    public func sentinel_simulate_failure(_ mode: SentinelSimulateFailureMode...) -> Self {
        let cmd = Cmd("SENTINEL").arg("SIMULATE_FAILURE").arg(mode)
        return self.add_command(cmd)
    }
    /// Force a failover
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL FAILOVER](https://redis.io/commands/sentinel-failover)
    public func sentinel_failover(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("FAILOVER").arg(masterName)
        return self.add_command(cmd)
    }
    /// List the monitored replicas
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
    /// List the monitored masters
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
    /// Get the Sentinel instance ID
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
    /// Get information about pending scripts
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL PENDING_SCRIPTS](https://redis.io/commands/sentinel-pending-scripts)
    public func sentinel_pending_scripts() -> Self {
        let cmd = Cmd("SENTINEL").arg("PENDING_SCRIPTS")
        return self.add_command(cmd)
    }
    /// List or update the current configurable parameters
    /// ## Available since
    /// 7.0.0
    /// ## Time complexity
    /// O(N) where N is the number of configurable parameters
    /// ## Documentation
    /// view the docs for [SENTINEL DEBUG](https://redis.io/commands/sentinel-debug)
    public func sentinel_debug(_ parameterValue: SentinelDebugParametervalue...) -> Self {
        let cmd = Cmd("SENTINEL").arg("DEBUG").arg(parameterValue)
        return self.add_command(cmd)
    }
    /// Get cached INFO from the instances in the deployment
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
    /// Stop monitoring
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
    /// Check if a master is down
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
    /// Rewrite configuration file
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
    /// Get port and address of a master
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
    /// Configure Sentinel
    /// ## Available since
    /// 6.2.0
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL CONFIG](https://redis.io/commands/sentinel-config)
    public func sentinel_config(_ setOrGet: SentinelConfigSetorget) -> Self {
        let cmd = Cmd("SENTINEL").arg("CONFIG").arg(setOrGet)
        return self.add_command(cmd)
    }
    /// List the Sentinel instances
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
    /// Check for a Sentinel quorum
    /// ## Available since
    /// 2.8.4
    /// ## Documentation
    /// view the docs for [SENTINEL CKQUORUM](https://redis.io/commands/sentinel-ckquorum)
    public func sentinel_ckquorum(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("CKQUORUM").arg(masterName)
        return self.add_command(cmd)
    }
    /// Start monitoring
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
    /// List the monitored slaves
    /// ## Available since
    /// 2.8.0
    /// ## Time complexity
    /// O(N) where N is the number of slaves
    /// ## Documentation
    /// view the docs for [SENTINEL SLAVES](https://redis.io/commands/sentinel-slaves)
    public func sentinel_slaves(_ masterName: String) -> Self {
        let cmd = Cmd("SENTINEL").arg("SLAVES").arg(masterName)
        return self.add_command(cmd)
    }
    /// Reset masters by name pattern
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
    /// Show helpful text about the different subcommands
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
    /// Change the configuration of a monitored master
    /// ## Available since
    /// 2.8.4
    /// ## Time complexity
    /// O(1)
    /// ## Documentation
    /// view the docs for [SENTINEL SET](https://redis.io/commands/sentinel-set)
    public func sentinel_set(_ masterName: String, _ optionValue: SentinelSetOptionvalue...) -> Self {
        let cmd = Cmd("SENTINEL").arg("SET").arg(masterName).arg(optionValue)
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
public struct SentinelDebugParametervalue: ToRedisArgs {
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
public enum SentinelConfigSetorget: ToRedisArgs {
    case SET(Setparamvalue)
    case GET(String)
    public func write_redis_args(out: inout [Data]) {
        switch self {
        case .SET(let setparamvalue):
            out.append("SET".data(using: .utf8)!)
            setparamvalue.write_redis_args(out: &out)
        case .GET(let string):
            out.append("GET".data(using: .utf8)!)
            string.write_redis_args(out: &out)
        }
    }
    public struct Setparamvalue: ToRedisArgs {
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
public struct SentinelSetOptionvalue: ToRedisArgs {
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
