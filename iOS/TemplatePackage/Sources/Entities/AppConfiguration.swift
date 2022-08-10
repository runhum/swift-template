public struct AppConfiguration: Codable {
    // Support for the single row guarantee
    private var id = 1

    public var isOnboardingComplete: Bool
}

public extension AppConfiguration {
    /// The default configuration
    static let `default` = AppConfiguration(isOnboardingComplete: false)
}
