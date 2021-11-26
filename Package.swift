// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TVShowsRxService",
  platforms: [.iOS(.v15), .macOS(.v12)],
  products: [
    .library(
      name: "TVShowsRxService", targets: ["TVShowsRxService"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
    .package(url: "https://github.com/mihaelamj/RequestAdapter.git", from: "0.2.0"),
    .package(url: "https://github.com/mihaelamj/TVShowsEndpoint.git", branch: "main"),
    .package(url: "https://github.com/mihaelamj/TVShowsResponseResults.git", branch: "main"),
    .package(url: "https://github.com/ReactiveX/RxSwift.git", branch: "main")
  ],
  targets: [
    .target(
      name: "TVShowsRxService", dependencies: ["Alamofire", "RequestAdapter", "TVShowsEndpoint", "TVShowsResponseResults", "RxSwift"]),
    .testTarget(
      name: "TVShowsRxServiceTests",
      dependencies: [
        "TVShowsRxService",
        "RxSwift",
        .product(name: "RxTest", package: "RxSwift"),
        .product(name: "RxBlocking", package: "RxSwift")]
    ),
  ]
)
