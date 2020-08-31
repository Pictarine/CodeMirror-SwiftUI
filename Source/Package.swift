// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "CodeMirror-SwiftUI",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "CodeMirror-SwiftUI",
      type: .dynamic,
      targets: ["CodeMirror-SwiftUI"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "CodeMirror-SwiftUI",
      dependencies: [],
      resources: [
        .copy("Resources/CodeMirrorView.bundle")
      ]
    ),
    .testTarget(
      name: "CodeMirror-SwiftUITests",
      dependencies: ["CodeMirror-SwiftUI"],
      resources: [
        .process("Resources")
      ]
    ),
  ],
  swiftLanguageVersions: [.v5]
)
