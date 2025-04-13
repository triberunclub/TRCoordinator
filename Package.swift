// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "TRCoordinator",
	platforms: [
		.iOS(.v16)
	],
	products: [
		.library(
			name: "TRCoordinator",
			targets: ["TRCoordinator"]
		)
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),
	],
	targets: [
		.target(
			name: "TRCoordinator",
			dependencies: [],
			path: "Sources",
			resources: [
				.process("PrivacyInfo.xcprivacy")
			]
		),
		.testTarget(
			name: "TRCoordinatorTests",
			dependencies: ["TRCoordinator"]
		)
	]
)
