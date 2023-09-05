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
    dependencies: [
        .package(url: "https://github.com/AlexandreBCardoso/CCMNetwork.git", .upToNextMajor(from: "1.0.1"))
    ],
    targets: [
        .target(
            name: "CCMDesignSystem",
            dependencies: [
                .product(name: "CCMNetwork", package: "CCMNetwork")
            ]
        ),
        .testTarget(
            name: "CCMDesignSystemTests",
            dependencies: ["CCMDesignSystem"]
        ),
    ]
)
