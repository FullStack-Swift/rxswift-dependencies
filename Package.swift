// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "rxswift-dependencies",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "Dependencies",
      targets: ["Dependencies"]),
  ],
  dependencies: [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0"),
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
    .package(url: "https://github.com/pointfreeco/swift-clocks", from: "0.1.0"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "0.8.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "Dependencies",
      dependencies: [
        .product(name: "RxSwift", package: "RxSwift"),
        .product(name: "Clocks", package: "swift-clocks"),
        .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay"),
      ]),
    .testTarget(
      name: "DependenciesTests",
      dependencies: [
        "Dependencies",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ]),
  ]
)

#if swift(>=5.6)
// Add the documentation compiler plugin if possible
package.dependencies.append(
  .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
)
#endif

//for target in package.targets {
//  target.swiftSettings = target.swiftSettings ?? []
//  target.swiftSettings?.append(
//    .unsafeFlags([
//      "-Xfrontend", "-warn-concurrency",
//      "-Xfrontend", "-enable-actor-data-race-checks",
//      "-enable-library-evolution",
//    ])
//  )
//}