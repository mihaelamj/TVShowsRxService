//
//  ShowService.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import TVShowsEndpoint
import RxSwift

public class ShowService {
  
  // MARK: - Properties -
  
  public static let shared = ShowService()
  public private(set) var api = Service.showsAPI()
  
  // INFO: allShows -
  
  public func allShows() -> Single<[Show]> {
    let result = api.fetchCollectionFrom(endpoint: .shows, type: Show.self)
    return result
  }
  
  // INFO: oneShow(showId) -
  
  public func show(id: Int) -> Single<Show> {
    let result = api.fetchOneFrom(endpoint: .show(id: id), type: Show.self)
    return result
  }
  
  // INFO: topRatedShows -
  
  public func topRatedShows() -> Single<[Show]> {
    let result = api.fetchCollectionFrom(endpoint: .topRated, type: Show.self)
    return result
  }
  
  // INFO: allReviews(showId) -
  
  public func allReviews(showId: Int) -> Single<[Review]> {
    let result = api.fetchCollectionFrom(endpoint: .reviews(showId: showId), type: Review.self)
    return result
  }
  
  // INFO: createReview(showId) -
  
  public func createReview(showId: Int, rating: Int, comment: String) -> Single<Review> {
    let result = api.fetchOneFrom(endpoint: .createReview(showId: showId, rating: rating, comment: comment), type: Review.self)
    return result
  }
  
  // INFO: deleteReview(reviewId) -
  
  public func deleteReview(reviewId: Int) -> Single<Errors> {
    let result = api.fetchOneFrom(endpoint: .deleteReview(reviewId: reviewId), type: Errors.self)
    return result
  }
  
  // INFO: updateReview(reviewId) -
  
  public func updateReview(reviewId: Int, rating: Int, comment: String) -> Single<Review> {
    let result = api.fetchOneFrom(endpoint: .updateReview(reviewId: reviewId, rating: rating, comment: comment), type: Review.self)
    return result
  }
  
}
