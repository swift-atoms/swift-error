// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-error-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Error Primitives",
            targets: ["Error Primitives"]
        ),
        .library(
            name: "Error Primitives Test Support",
            targets: ["Error Primitives Test Support"]
        ),
    ],
    targets: [
        .target(
            name: "Error Primitives",
            dependencies: []
        ),
        .target(
            name: "Error Primitives Test Support",
            dependencies: [
                "Error Primitives"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Error Primitives Tests",
            dependencies: [
                "Error Primitives",
                "Error Primitives Test Support",
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
