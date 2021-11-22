// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TVShowsRxService",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TVShowsRxService",
            targets: ["TVShowsRxService"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
        .package(url: "https://github.com/mihaelamj/RequestAdapter.git", from: "0.1.0"),
        .package(url: "https://github.com/mihaelamj/TVShowsEndpoint.git", branch: "main"),
        .package(url: "https://github.com/mihaelamj/TVShowsResponseResults.git", branch: "main"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TVShowsRxService", dependencies: ["Alamofire", "RequestAdapter", "TVShowsEndpoint", "TVShowsResponseResults"]),
        .testTarget(
            name: "TVShowsRxServiceTests",
            dependencies: ["TVShowsRxService"]),
    ]
)
