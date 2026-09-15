// swift-tools-version: 6.3
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
            exact: "1.9.0"
        ),
        .package(
            url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git",
            from: "9.5.0"
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
                path: "Sources",
                linkerSettings: [
                    // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                    // For now, these flags should be added manually to the project for integration.
                    .unsafeFlags(["-ObjC"])
                ]
            ),
            .binaryTarget(
                name: "BlueSeaIronSourceAdapter",
                url: "https://sdk.cdn.blueseasx.com/ios/V1.9.0/2026091500/adapter-V1.9.0.0/BlueSeaISAdapter.xcframework.zip",
                checksum: "052b7134e21fe9900518ce638a0c430573fbb3ec4b589be8e69e82d9e924dff0"
            ),
        ]
)
