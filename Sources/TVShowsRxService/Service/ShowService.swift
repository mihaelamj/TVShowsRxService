//
//  ShowService.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import TVShowsEndpoint
import RxSwift

public class ShowService {
  
  public static let shared = ShowService()
  
  // TODO: allShows -
  
  public func allShows() -> Single<[Show]> {
    let result = RxService.showsAPI().fetchCollectionFrom(endpoint: .shows, type: Show.self)
    return result
  }
  
  // TODO: oneShow(showId) -
  
  public func show(id: Int) -> Single<Show> {
    let result = RxService.showsAPI().fetchOneFrom(endpoint: .show(id: id), type: Show.self)
    return result
  }
  
  // TODO: topRatedShows -
  
  public func topRatedShows() -> Single<[Show]> {
    let result = RxService.showsAPI().fetchCollectionFrom(endpoint: .topRated, type: Show.self)
    return result
  }
  
  // TODO: allReviews(showId) -
  
  public func allReviews(showId: Int) -> Single<[Review]> {
    let result = RxService.showsAPI().fetchCollectionFrom(endpoint: .reviews(showId: showId), type: Review.self)
    return result
  }
  
  // TODO: createReview(showId) -
  
  public func createReview(showId: Int, rating: Int, comment: String) -> Single<Review> {
    let result = RxService.showsAPI().fetchOneFrom(endpoint: .createReview(showId: showId, rating: rating, comment: comment), type: Review.self)
    return result
  }
  
  // TODO: deleteReview(reviewId) -
  
//  public func deleteReview(reviewId: Int) -> Single<Void> {
//    let result = RxService.showsAPI().fetchOneFrom(endpoint: .deleteReview(reviewId: reviewId), type: Void.self)
//    return result
//  }
  
  // TODO: updateReview(reviewId) -
  
  public func updateReview(reviewId: Int, rating: Int, comment: String) -> Single<Review> {
    let result = RxService.showsAPI().fetchOneFrom(endpoint: .updateReview(reviewId: reviewId, rating: rating, comment: comment), type: Review.self)
    return result
  }
  
}
