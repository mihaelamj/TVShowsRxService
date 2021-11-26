import XCTest
@testable import TVShowsRxService
import RxSwift
import RxTest
import RxBlocking

final class TVShowsRxServiceTests: XCTestCase {
  
  static let testEmail = "test@test.com"
  static let testPassword = "testtest"
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    //        XCTAssertEqual(TVShowsRxService().text, "Hello, World!")
  }
  
  
  
  func testUserRegister() throws {
    let result: Single<User> = UserService.shared.register(with: "mihaelamj@gmail.com", "123456")
    let blockingResult = try result.toBlocking().toArray()
    
    let userObject = blockingResult.first
    XCTAssertNotNil(userObject)
    let user = userObject as? User
    XCTAssertNotNil(user)
    
//    result.do { user in
//      debugPrint("User: \(user)")
//    } onError: { error in
//      debugPrint("Error: \(error)")
//    } onSubscribe: {
//      debugPrint("Subscribed")
//    }
    
    
  }
}


//dependency 'RxTest' in target 'TVShowsRxServiceTests' requires explicit declaration; reference the package in the target dependency with '.product(name: "RxTest", package: "RxSwift")'
