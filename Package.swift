// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "EventSource",
  platforms: [.iOS(.v14), .macOS(.v12)],
  products: [
    .library(
      name: "EventSource",
      targets: ["EventSource"]),
  ],
  targets: [
    .target(
      name: "EventSource"),
    .testTarget(name: "EventSourceTests",
                dependencies: ["EventSource"])
  ]
)
