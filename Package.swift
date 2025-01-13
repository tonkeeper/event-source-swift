// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "TKEventSource",
  platforms: [.iOS(.v14), .macOS(.v12)],
  products: [
    .library(
      name: "TKEventSource",
      targets: ["TKEventSource"]),
  ],
  targets: [
    .target(
      name: "TKEventSource"),
    .testTarget(name: "TKEventSourceTests",
                dependencies: ["TKEventSource"])
  ]
)
