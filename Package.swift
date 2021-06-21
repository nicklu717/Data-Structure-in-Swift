// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStructure",
    products: [
        .executable(name: "Playground", targets: ["Playground"]),
        .library(name: "DataStructure", targets: ["DataStructure"]),
    ],
    targets: [
        .target(name: "Playground", dependencies: ["DataStructure"]),
        .target(name: "DataStructure"),
        .testTarget(name: "DataStructureTests", dependencies: ["DataStructure"]),
    ]
)
