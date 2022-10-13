import DTO
import Fluent
import Vapor

public struct UserController: RouteCollection {
    private let userService: UserService
    public init(userService: UserService) {
        self.userService = userService
    }

    public func boot(routes: RoutesBuilder) throws {
        let group = routes.grouped("users")
        group.get(use: all)
        group.get(":id", use: single)
        group.post(use: create)
    }

    func all(req: Request) async throws -> [UserDTO] {
        try await userService.fetchAll()
    }

    func single(req: Request) async throws -> UserDTO {
        guard let id = req.parameters.get("id"),
              let user = try await userService.fetch(id: id)
        else { throw Abort(.notFound) }
        return user
    }

    func create(req: Request) async throws -> HTTPStatus {
        let dto = try req.content.decode(CreateUserDTO.self)
        let user = User(id: nil, name: dto.name)
        try await user.save(on: req.db)
        return .noContent
    }
}

extension UserDTO: Content {}
extension CreateUserDTO: Content {}
