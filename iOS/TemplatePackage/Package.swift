// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TemplatePackage",
    platforms: [.iOS(.v13),
                .macOS(.v10_15)],
    products: [
        .library(name: "Entities", targets: ["Entities"]),
        .library(name: "Persistence", targets: ["Persistence"]),
        .library(name: "Repositories", targets: ["Repositories"]),
        .library(name: "UI", targets: ["UI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/groue/GRDB.swift", from: "5.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "Entities", dependencies: []),
        .target(name: "Repositories", dependencies: ["Persistence"]),
        .target(name: "UI", dependencies: []),
        .target(name: "Persistence", dependencies: ["Entities", .product(name: "GRDB", package: "GRDB.swift")]),
        .testTarget(name: "RepositoryTests", dependencies: ["Repositories"]),
        .testTarget(name: "PersistenceTests", dependencies: ["Persistence"]),
    ]
)
