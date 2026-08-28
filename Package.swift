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
            name: "Error Test Support",
            targets: ["Error Test Support"]
        ),
    ],
    targets: [
        .target(
            name: "Error",
            dependencies: []
        ),
        .target(
            name: "Error Test Support",
            dependencies: [
                "Error"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Error Tests",
            dependencies: [
                "Error",
                "Error Test Support",
            ]
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
