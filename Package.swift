// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-error-primitives",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27")
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
                "Error Primitives",
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
