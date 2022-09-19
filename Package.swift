// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "C32Shared",

	platforms: [
		.iOS(.v13),
		.tvOS(.v11),
		.macOS(.v10_15),
		.watchOS(.v6)
	],

    products: [
        .library(
            name: "C32Shared",
            targets: ["C32Shared"]
		)
    ],

    dependencies: [],

    targets: [
        .target(
            name: "C32Shared",
            dependencies: [],
			path: "Sources"
		)
    ]
)
