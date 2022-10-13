import Fluent
import FluentSQLiteDriver
import Server
import Vapor

@main
struct App {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        let app = Application(env)

        defer { app.shutdown() }

        app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

        app.databases.use(.sqlite(.file("server.db")), as: .sqlite)
        app.migrations.add(Version1())
        
        let userRepository = UserFluentRepository(database: app.db)
        let userService = UserService(userRepository: userRepository)
        app.logger.info("Migrating database...")
        try await app.autoMigrate()

        try app.register(collection: UserController(userService: userService))

        try await seed(app, userRepository: userRepository)

        try app.run()
    }
}

extension App {
    static func seed(_ app: Application, userRepository: UserRepository) async throws {
        guard try await userRepository.fetchUserCount() == 0 else { return }
        app.logger.info("Seeding the database...")
        try await userRepository.create(user: User(name: "Vapor"))
    }
}
