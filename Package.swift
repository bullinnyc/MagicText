// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagicText",
    platforms: [
        // Add support for all platforms starting from a specific version.
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MagicText",
            targets: ["MagicText"]
        ),
        .library(
            name: "ExampleMagicText",
            targets: ["Examples"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MagicText"
        ),
        .target(
            name: "Examples",
            dependencies: ["MagicText"],
            path: "Examples"
        ),
        .testTarget(
            name: "MagicTextTests",
            dependencies: ["MagicText"]
        )
    ]
)
