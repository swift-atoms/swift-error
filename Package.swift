// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-error",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Error",
            targets: ["Error"]
        ),
        .library(
            name: "Error Standard Library Integration",
            targets: ["Error Standard Library Integration"]
        ),
        .library(
            name: "Error Apple Foundation Integration",
            targets: ["Error Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Error",
            dependencies: []
        ),
        .target(
            name: "Error Standard Library Integration",
            dependencies: ["Error"]
        ),
        .target(
            name: "Error Apple Foundation Integration",
            dependencies: [
                "Error",
                "Error Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Error Tests",
            dependencies: ["Error"],
            path: "Tests/Error Tests"
        ),
        .testTarget(
            name: "Error Standard Library Integration Tests",
            dependencies: [
                "Error",
                "Error Standard Library Integration",
            ],
            path: "Tests/Error Standard Library Integration Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
