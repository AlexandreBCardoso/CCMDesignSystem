// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CCMDesignSystem",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CCMDesignSystem",
            targets: ["CCMDesignSystem"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CCMDesignSystem",
            dependencies: []
        ),
        .testTarget(
            name: "CCMDesignSystemTests",
            dependencies: ["CCMDesignSystem"]
        ),
    ]
)
