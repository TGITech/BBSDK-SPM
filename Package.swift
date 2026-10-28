// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BBSDK-SPM",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "BBSDK-SPM",
            targets: ["BBSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"),
    ],
    targets: [
        .binaryTarget(
            name: "BBSDK",
            path: "Frameworks/BBSDK.xcframework"
        ),
        .target(
            name: "BBSDKWrapper",
            dependencies: [
                .target(name: "BBSDK"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
            ]
        )
    ]
)

