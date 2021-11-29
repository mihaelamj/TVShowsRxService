import XCTest
@testable import TVShowsRxService
import RxSwift
import RxTest
import RxBlocking
import TVShowsEndpoint

final class TVShowsRxServiceTests: XCTestCase {
  
  static let testEmail = "test@test.com"
  static let testPassword = "testtest"
  
  static var email = ""
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    //        XCTAssertEqual(TVShowsRxService().text, "Hello, World!")
  }
  
  override func setUp() {
    TVShowsRxServiceTests.email = "mihaelamj+\(Int.random(in: 0..<1000))@gmail.com"
  }
  
  // TODO: Catch errors -
  
  // TODO: Save responses as `JSON` -
  
  // TODO: Test Interceptor -
  
  func testRandomUserRegister() throws {
    let result: Single<User> = UserService.shared.register(with: TVShowsRxServiceTests.email, TVShowsRxServiceTests.testPassword)
    let blockingResult = try result.toBlocking().toArray()
    
    let userObject = blockingResult.first
    XCTAssertNotNil(userObject)
    XCTAssertEqual(userObject?.email, TVShowsRxServiceTests.email)
    debugPrint("Registered user: \(TVShowsRxServiceTests.email)")
    
    // test auth adapter
    let userAuthData = TVShowsEndpoint.UserAuthData.fromRepository()
    XCTAssertNotNil(userAuthData)
    if let data = userAuthData {
//      XCTAssertEqual(data.uid, TVShowsRxServiceTests.email)
    }
    
    debugPrint("userAuthData: \(userAuthData!)")
  }
  
  func testUserLogin() throws {
    let result: Single<User> = UserService.shared.login(with: TVShowsRxServiceTests.email, TVShowsRxServiceTests.testPassword)
    let blockingResult = try result.toBlocking().toArray()
    
    
  }
}


//dependency 'RxTest' in target 'TVShowsRxServiceTests' requires explicit declaration; reference the package in the target dependency with '.product(name: "RxTest", package: "RxSwift")'
