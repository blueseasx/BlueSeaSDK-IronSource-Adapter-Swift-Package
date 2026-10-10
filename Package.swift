// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueSeaIronSourceAdapter",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BlueSeaIronSourceAdapter",
            targets: ["BlueSeaIronSourceAdapterTarget"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/blueseasx/BlueSeaSDK-Swift-Package.git",
            exact: "1.9.1"
        ),
        .package(
            url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git",
            from: "9.0.0"
        ),
    ],
    targets: [
            // This is a wrapper target to configure various settings required by main binary target.
            .target(
                name: "BlueSeaIronSourceAdapterTarget",
                dependencies: [
                    .target(name: "BlueSeaIronSourceAdapter"),
                    .product(name: "BlueSeaSDK", package: "BlueSeaSDK-Swift-Package"),
                    .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
                ],
                path: "Sources"
            ),
            .binaryTarget(
                name: "BlueSeaIronSourceAdapter",
                url: "https://sdk.cdn.blueseasx.com/ios/V1.9.1/2026101000/adapter-V1.9.1.0/BlueSeaISAdapter.xcframework.zip",
                checksum: "e4bb583b4a543ddde9c9075b2ce703bbe0bfc64fd93a40b0239ae5aa1246e1d6"
            ),
        ]
)
