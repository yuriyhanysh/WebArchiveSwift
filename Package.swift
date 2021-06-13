// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebArchiveSwift",
    products: [
        .library(
            name: "WebArchiveSwift",
            targets: ["WebArchiveSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WebArchiveSwift",
            dependencies: []),
        .testTarget(
            name: "WebArchiveSwiftTests",
            dependencies: ["WebArchiveSwift"],
            resources: [
              .copy("Resources"),
            ]),
    ]
)
