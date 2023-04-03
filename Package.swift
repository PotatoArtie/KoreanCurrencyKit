// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "KoreanCurrencyKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "KoreanCurrencyKit",targets: ["KoreanCurrencyKit"]),
    ],
    targets: [
        .target(
            name: "KoreanCurrencyKit",
            dependencies: []),
        .testTarget(
            name: "KoreanCurrencyKitTests",
            dependencies: ["KoreanCurrencyKit"]),
    ],
    swiftLanguageVersions: [.v5 ]
)
