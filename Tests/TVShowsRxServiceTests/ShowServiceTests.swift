import XCTest
@testable import TVShowsRxService
import RxSwift
import RxTest
import RxBlocking
import TVShowsEndpoint

final class ShowServiceTests: XCTestCase {
  
  func testGetAllShows() throws {
    let result: Single<[Show]> = ShowService.shared.allShows()
    let blockingResult = try result.toBlocking().toArray()
    
    let shows = blockingResult.first
    XCTAssertNotNil(shows)
    
    let typedShows = shows as? [Show]
    XCTAssertNotNil(typedShows)
//    XCTAssertTrue(shows is [Show].self)
    
    // test `UserAuthInterceptor`
    
    
  }
  
}
