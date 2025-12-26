//
//  CommandDetails.swift
//  SwiftyRedis
//
//  Created by Michael van Straten on 24.04.25.
//

import Foundation

/**
 Represents the metadata of a Redis command as returned by the `COMMAND`
 introspection command.

 ## Overview
 Redis replies to `COMMAND` with a heterogeneous RESP array whose fixed
 positions carry different kinds of information (name, arity, flags, key
 positions, ACL categories, tips, key-specifications and sub-commands) :contentReference[oaicite:3]{index=3}.
 `CommandDetails` offers a strongly-typed Swift view of that data so that
 higher-level client code can reason about commands without hand-parsing
 nested arrays.

 Any field that was introduced in Redis 6 or later (ACL categories) or
 7 (tips, key-specifications, sub-commands, history) is declared *optional*
 so that the struct can still model older server versions gracefully.
 */
public struct CommandDetails: Sendable, Hashable {
    /// The command’s lowercase name (e.g. `"get"`).
    public let name: String

    /**
     Arity as reported by Redis.

     * A **positive** value means a fixed number of arguments.<br>
     * A **negative** value means a *minimum* number of arguments, more may follow :contentReference[oaicite:4]{index=4}.
     */
    public let arity: Int

    /// An array of flags such as `readonly`, `movablekeys`, `admin`, `fast`, … :contentReference[oaicite:5]{index=5}.
    public let flags: [String]

    /// 1-based position of the first key name (0 is the command itself) :contentReference[oaicite:6]{index=6}.
    public let firstKey: Int

    /// Position of the last key name (or `-1` for “up to the last argument”) :contentReference[oaicite:7]{index=7}.
    public let lastKey: Int

    /// Increment between successive key names (the **step**) :contentReference[oaicite:8]{index=8}.
    public let keyStep: Int

    // MARK: Extended properties (elements 7–10, Redis 6 + 7)

    /// ACL categories such as `@read`, `@string`, `@fast` :contentReference[oaicite:9]{index=9}.
    public let aclCategories: [String]?

    /// *Command tips* that guide cluster-aware clients (e.g. `"request_policy:all_shards"`) :contentReference[oaicite:10]{index=10}.
    public let tips: [String]?

    /// Key-specifications that rigorously describe how to locate keys inside the argument vector :contentReference[oaicite:11]{index=11}.
    public let keySpecs: [KeySpecification]?

    /// Sub-commands, each expressed recursively with the same structure :contentReference[oaicite:12]{index=12}.
    public let subcommands: [CommandDetails]?

    // MARK: Future-proof fields (from COMMAND DOCS)

    /// History entries describing signature changes across Redis versions :contentReference[oaicite:13]{index=13}.
    public let history: [HistoryEntry]?

    // MARK: Nested helper types

    /**
     Describes a single *key specification* (9th element of the reply).

     Key-specs replace the legacy first/last/step scheme and allow clients
     to locate keys even in exotic commands such as `EVAL` or `ZUNION` :contentReference[oaicite:14]{index=14}.
     */
    public struct KeySpecification: Sendable, Hashable {

        /// Access-type and logical-operation flags (e.g. `RW`, `access`, `update`) :contentReference[oaicite:15]{index=15}.
        public let flags: [String]

        /// Rule that tells where to *start* looking for keys.
        public let beginSearch: BeginSearch

        /// Rule that tells how to *continue* finding keys once the first was found.
        public let findKeys: FindKeys

        /// Optional free-form notes from the server.
        public let notes: String?

        // MARK: Begin-search and find-keys shapes

        public enum BeginSearch: Hashable, Sendable {
            /// Keys start at a constant 0-based index (`index`).
            case index(Int)
            /// Keys start after the given *keyword*; `startFrom` may be negative :contentReference[oaicite:16]{index=16}.
            case keyword(keyword: String, startFrom: Int)
            /// Unknown begin-search type — client should fall back to `COMMAND GETKEYS`.
            case unknown
        }

        public enum FindKeys: Hashable, Sendable {
            /// Keys span the range `lastKey`, with `keyStep` increment and optional `limit`.
            case range(lastKey: Int, keyStep: Int, limit: Int)
            /// Number of keys is given by a preceding argument (`keyNumIndex`).
            case keynum(keyNumIndex: Int, firstKey: Int, keyStep: Int)
            /// Unknown find-keys type — fall back to `COMMAND GETKEYS`.
            case unknown
        }
    }

    /// One entry in the *history* array returned by `COMMAND DOCS` :contentReference[oaicite:17]{index=17}.
    public struct HistoryEntry: Sendable, Hashable {
        public let sinceVersion: String
        public let description: String
    }
}
