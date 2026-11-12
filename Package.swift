// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Which product to add (the code is `import BBSDK` with any of them):
// - BBSDK-iOS: iOS only, for an iOS app target.
// - BBSDK-tvOS: tvOS only, for a tvOS app target.
// - BBSDK-SPM: iOS and tvOS. For one target that builds for both platforms, or a package that
//   supports both. It adds BBSDK-iOS when building for iOS and BBSDK-tvOS when building for tvOS.
// Add either BBSDK-SPM or a per-platform product to a target, not both.
let package = Package(
    name: "BBSDK-SPM",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "BBSDK-SPM",
            targets: ["BBSDKWrapper"]
        ),
        .library(
            name: "BBSDK-iOS",
            targets: ["BBSDK-iOS"]
        ),
        .library(
            name: "BBSDK-tvOS",
            targets: ["BBSDK-tvOS"]
        ),
    ],
    targets: [
        // Both hold BBSDK.framework (module BBSDK), built by build_xcframework_tv.sh.
        .binaryTarget(
            name: "BBSDK-iOS",
            path: "Frameworks/BBSDK-iOS.xcframework"
        ),
        .binaryTarget(
            name: "BBSDK-tvOS",
            path: "Frameworks/BBSDK-tvOS.xcframework"
        ),
        .target(
            name: "BBSDKWrapper",
            dependencies: [
                .target(name: "BBSDK-iOS", condition: .when(platforms: [.iOS])),
                .target(name: "BBSDK-tvOS", condition: .when(platforms: [.tvOS])),
            ]
        ),
    ]
)
