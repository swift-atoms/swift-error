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
        .library(name: "Error Standard Library Integration", targets: ["Error Standard Library Integration"]),
        .library(name: "Error Foundation Library Integration", targets: ["Error Foundation Library Integration"]),
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
            name: "Error Standard Library Integration",
            dependencies: [
                .target(name: "Error"),
            ],
            path: "Sources/Error Standard Library Integration"
        ),
        .target(
            name: "Error Foundation Library Integration",
            dependencies: [
                .target(name: "Error"),
                .target(name: "Error Standard Library Integration"),
            ],
            path: "Sources/Error Foundation Library Integration"
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
                .target(name: "Error Standard Library Integration"),
                .target(name: "Error Foundation Library Integration"),
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
