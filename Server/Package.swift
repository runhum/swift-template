// swift-tools-version:5.6
import PackageDescription

private let serverName = "Server"
private let appName = "App"

let package = Package(
    name: "TemplateServer",
    platforms: [
        .macOS(.v12),
    ],
    products: [.library(name: "\(serverName)DTO", targets: ["DTO"])],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(name: appName, dependencies: [.target(name: serverName)]),
        .target(
            name: serverName,
            dependencies: [
                "DTO",
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),

        .target(name: "DTO"),

        .testTarget(name: "\(appName)Tests", dependencies: [
            .target(name: serverName),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
