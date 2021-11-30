import XCTest
@testable import TVShowsRxService
import RxSwift
import RxTest
import RxBlocking
import TVShowsEndpoint

final class ShowServiceTests: XCTestCase {
  
  static var reviewID = 0
  
  func testGetAllShows() throws {
    let result: Single<[Show]> = ShowService.shared.allShows()
    let blockingResult = try result.toBlocking().toArray()
    
    let shows = blockingResult.first
    XCTAssertNotNil(shows)
    
    if let tyShows = shows {
      XCTAssertTrue(!tyShows.isEmpty)
    }
  }
  
  func testGetOneShow() throws {
    let result: Single<Show> = ShowService.shared.show(id: Constants.TestUser.showID)
    let blockingResult = try result.toBlocking().toArray()
    
    let show = blockingResult.first
    XCTAssertNotNil(show)
  }
  
  func testGetTopRated() throws {
    let result: Single<[Show]> = ShowService.shared.topRatedShows()
    let blockingResult = try result.toBlocking().toArray()
    
    let shows = blockingResult.first
    XCTAssertNotNil(shows)
    
    if let tyShows = shows {
      XCTAssertTrue(!tyShows.isEmpty)
    }
  }
  
  func testGetAllReviewsForOneShow() throws {
    let result: Single<[Review]> = ShowService.shared.allReviews(showId: Constants.TestUser.showID)
    let blockingResult = try result.toBlocking().toArray()
    
    let reviews = blockingResult.first
    XCTAssertNotNil(reviews)
    
    if let tyReviews = reviews {
      XCTAssertTrue(!tyReviews.isEmpty)
    }
  }
  
  func testCreateReviewForOneShow() throws {
    let rating = 4
    let result: Single<Review> = ShowService.shared.createReview(showId: Constants.TestUser.showID, rating: rating, comment: "Awesome TV show!")
    let blockingResult = try result.toBlocking().toArray()
    
    let review = blockingResult.first
    XCTAssertNotNil(review)
    
    ShowServiceTests.reviewID = Int(review!.id) ?? 0
    
    XCTAssertEqual(rating, review?.rating)
  }
  
  func testUpdateReviewForOneShow() throws {
    let rating = 5
    let comment = "Amazing, awesome show"
    
    let result: Single<Review> = ShowService.shared.updateReview(reviewId: ShowServiceTests.reviewID, rating: rating, comment: comment)
    let blockingResult = try result.toBlocking().toArray()
    
    //"https://tv-shows.infinum.academy/reviews(reviewId: 9729, rating: 5, comment: \\\"Amazing, awesome show\\\")\")"
    
    //caught error: "invalidURL(url: "https://tv-shows.infinum.academy/reviews(reviewId: 9729, rating: 5, comment: \"Amazing, awesome show\")")"
    
    let review = blockingResult.first
    XCTAssertNotNil(review)
    
    XCTAssertEqual(rating, review?.rating)
    XCTAssertEqual(comment, review?.comment)
  }
  
}
