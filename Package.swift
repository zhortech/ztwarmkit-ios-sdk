// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTWarmKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZTWarmKit",
            targets: ["ZTWarmKitSDK"]
        )
    ],
    dependencies: [
        .package(
            name: "ZTCoreKit", 
            url: "https://github.com/zhortech/ztcorekit-ios-sdk.git",
            from: "1.1.3"
        )
    ],
    targets: [
        .target(
            name: "ZTWarmKitSDK",
            dependencies: [
                .product(
                    name: "ZTCoreKit",
                    package: "ZTCoreKit"
                ),
                .target(
                    name: "ZTWarmKit"
                )
            ],
            path: "Sources/ZTWarmKitSDK"
        ),
        .binaryTarget(
            name: "ZTWarmKit",
            path: "Sources/ZTWarmKit.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
