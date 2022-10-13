import Fluent

public struct Version1: AsyncMigration {
    public init() {}
    public func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("name", .string, .required)
            .create()
    }

    public func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}
