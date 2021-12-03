// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HideableUITabBar",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "HideableUITabBar",
            targets: ["HideableUITabBar"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HideableUITabBar",
            path: "HideableUITabBar/Sources"),
    ],
    swiftLanguageVersions: [.v5]
)
