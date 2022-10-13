import Fluent
import Foundation

public protocol UserRepository {
    func fetch(id: UUID) async throws -> User?
    func fetchAll() async throws -> [User]
    func create(user: User) async throws
    func fetchUserCount() async throws -> Int
    func delete(id: UUID) async throws
}

public struct UserFluentRepository: UserRepository {
    private let database: Database
    public init(database: Database) {
        self.database = database
    }

    public func fetch(id: UUID) async throws -> User? {
        try await User.find(id, on: database)
    }

    public func fetchAll() async throws -> [User] {
        try await User.query(on: database).all()
    }

    public func create(user: User) async throws {
        try await user.create(on: database)
    }

    public func fetchUserCount() async throws -> Int {
        try await User.query(on: database).count()
    }

    public func delete(id: UUID) async throws {
        try await User.find(id, on: database)?.delete(on: database)
    }
}
