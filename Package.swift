// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Prism",
    platforms: [.macOS(.v10_12)],
    products: [
        .executable(name: "prism",
                    targets: ["prism"]),
        .library(
            name: "PrismCore",
            targets: ["PrismCore"]),
        .library(
            name: "ZeplinAPI",
            targets: ["ZeplinAPI"])
    ],
    dependencies: [
        .package(url: "https://github.com/devedbox/Commander.git", from: "0.5.6"),
        .package(url: "https://github.com/Quick/Quick", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "8.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.5.0"),
        .package(url: "https://github.com/BuzzFeed/MockDuck", .branch("master")),
        .package(url: "https://github.com/jpsim/Yams", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "prism",
            dependencies: ["PrismCore", "Commander"],
            path: "Sources/CLI"
        ),
        .target(
            name: "PrismCore",
            dependencies: ["ZeplinAPI", "Yams"],
            path: "Sources/PrismCore"),
        .target(
            name: "ZeplinAPI",
            dependencies: [],
            path: "Sources/ZeplinAPI"),
       .testTarget(
           name: "PrismTests",
           dependencies: ["prism", "Quick", "Nimble", "MockDuck", "Yams", "SnapshotTesting"],
           path: "Tests")
    ]
)
