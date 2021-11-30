import XCTest
@testable import TVShowsRxService
import RxSwift
import RxTest
import RxBlocking
import TVShowsEndpoint

final class UserServiceTests: XCTestCase {
  
  func testRandomUserRegister() throws {
    let randomEmail =  "random+\(Int.random(in: 0..<1000))@gmail.com"
    let randomPassword =  "random+\(Int.random(in: 0..<1000))"
    
    let result: Single<User> = UserService.shared.register(with: randomEmail, randomPassword)
    let blockingResult = try result.toBlocking().toArray()
    
    let userObject = blockingResult.first
    XCTAssertNotNil(userObject)
    XCTAssertEqual(userObject?.email, randomEmail)
    debugPrint("Registered user: \(userObject?.email ?? "none")")
    
    // test `UserAuthAdapter`
    let userAuthData = TVShowsEndpoint.UserAuthData.fromRepository()
    XCTAssertNotNil(userAuthData)
    XCTAssertEqual(userAuthData?.userAuthUID, randomEmail)
    if let data = userAuthData {
      debugPrint("userAuthData: \(data)")
    }
  }
  
  func testUserLogin() throws {
    let result: Single<User> = UserService.shared.login(with: Constants.TestUser.email, Constants.TestUser.password)
    let blockingResult = try result.toBlocking().toArray()
    
    let userObject = blockingResult.first
    XCTAssertNotNil(userObject)
    XCTAssertEqual(userObject?.email, Constants.TestUser.email)
    debugPrint("Logged In user: \(userObject?.email ?? "none")")
    
    // test `UserAuthAdapter`
    let userAuthData = TVShowsEndpoint.UserAuthData.fromRepository()
    XCTAssertNotNil(userAuthData)
    XCTAssertEqual(userAuthData?.userAuthUID, Constants.TestUser.email)
    if let data = userAuthData {
      debugPrint("userAuthData: \(data)")
    }
  }
  
}
