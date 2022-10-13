import Fluent

public struct Version1: AsyncMigration {
    public init() {}
    public func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("name", .string, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .field("deleted_at", .datetime)
            .create()
    }

    public func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}
