import Fluent
import Vapor

public final class User: Model, Content {
    public static let schema = "users"

    @ID(key: .id)
    public var id: UUID?

    @Field(key: "name")
    public var name: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update, format: .iso8601)
    var updatedAt: Date?

    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?

    public init() {}

    public init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
