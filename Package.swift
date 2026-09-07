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
        .library(name: "Error", targets: ["Error"]),

        .library(name: "Error Foundation Integration", targets: ["Error Foundation Integration"]),
        .library(name: "Error Test Support", targets: ["Error Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Error",
            dependencies: [
            ],
            path: "Sources/Error"
        ),
        
        .target(
            name: "Error Foundation Integration",
            dependencies: [
                .target(name: "Error"),
            ],
            path: "Sources/Error Foundation Integration"
        ),
        .target(
            name: "Error Test Support",
            dependencies: [
                .target(name: "Error"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Error Tests",
            dependencies: [
                .target(name: "Error"),
                .target(name: "Error Test Support"),
                .target(name: "Error Foundation Integration"),
            ],
            path: "Tests/Error Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
