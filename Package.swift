// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BBSDK",
    platforms: [
        .iOS(.v13) // Adjust the minimum iOS version as needed
    ],
    products: [
        .library(
            name: "BBSDK",
            targets: ["BBSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"),
        .package(url: "https://github.com/socketio/socket.io-client-swift", from: "16.1.1"),
        .package(url: "https://github.com/Datadog/dd-sdk-ios.git", from: "2.18.0"),
        .package(url: "https://github.com/yaslab/CSV.swift.git", from: "2.5.2")
    ],
    targets: [
        .binaryTarget(
            name: "BBTVSDK",
            path: "Frameworks/BBSDK.xcframework"
        ),
        .target(
            name: "BBSDKWrapper",
            dependencies: [
                .target(name: "BBTVSDK"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "DatadogCore", package: "dd-sdk-ios"),
                .product(name: "DatadogLogs", package: "dd-sdk-ios"),
                .product(name: "CSV", package: "CSV.swift")
            ]
        )
    ]
)

