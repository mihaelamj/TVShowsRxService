import XCTest
@testable import TVShowsRxService
import RxSwift

final class TVShowsRxServiceTests: XCTestCase {
  
  static let testEmail = "test@test.com"
  static let testPassword = "testtest"
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    //        XCTAssertEqual(TVShowsRxService().text, "Hello, World!")
  }
  
  
  
  func testUserRegister() {
    let result: Single<User> = UserService.shared.register(with: TVShowsRxServiceTests.testEmail, TVShowsRxServiceTests.testPassword)
    result.do { user in
      debugPrint("User: \(user)")
    } onError: { error in
      debugPrint("Error: \(error)")
    } onSubscribe: {
      debugPrint("Subscribed")
    }
    
    
  }
}
