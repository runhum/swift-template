import DTO

public struct UserService {
    private let userRepository: UserRepository

    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    public func fetch(id: String) async throws -> UserDTO? {
        try await userRepository
            .fetch(id: id)
            .map { try UserDTO(id: $0.requireID(), name: $0.name) }
    }

    public func fetchAll() async throws -> [UserDTO] {
        try await userRepository
            .fetchAll()
            .compactMap { try UserDTO(id: $0.requireID(), name: $0.name) }
    }
}
