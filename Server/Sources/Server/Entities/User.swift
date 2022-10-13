import Fluent
import Vapor

public final class User: Model, Content {
    public static let schema = "users"

    @ID(key: .id)
    public var id: UUID?

    @Field(key: "name")
    public var name: String

    public init() {}

    public init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
