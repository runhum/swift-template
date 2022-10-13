import Fluent
import FluentSQLiteDriver
@testable import Server
import XCTVapor

final class UserRepositoryTests: XCTestCase {
    var userRepository: UserRepository!
    let app = Application(.testing)
    // TODO: Is there a way to set up in memory database without creating an Application?
    override func setUp() async throws {
        app.databases.use(.sqlite(.memory), as: .sqlite)
        app.migrations.add(Version1())
        try await app.autoMigrate()
        userRepository = UserFluentRepository(database: app.db)
    }

    override func tearDown() {}
    
    func testCreateUser() async throws {
        let user = User(name: "foo")
        
        try await userRepository.create(user: user)
        
        XCTAssertEqual("foo", user.name)
    }

    func testFetchUserById() async throws {
        let uuid = UUID()
        try await User(id: uuid, name: "foo").save(on: app.db)
        let possibleUser = try await userRepository.fetch(id: uuid.uuidString)
        let user = try XCTUnwrap(possibleUser)
        XCTAssertEqual(user.name, "foo")
        XCTAssertEqual(user.id, uuid)
    }

    func testFetchUserWithWrongId() async throws {
        let user = try await userRepository.fetch(id: "foo")
        
        XCTAssertNil(user)
    }
}
