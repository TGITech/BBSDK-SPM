// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BBSDK-SPM",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "BBSDK-SPM",
            targets: ["BBSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "BBSDK",
            path: "Frameworks/BBSDK.xcframework"
        )
    ]
)

