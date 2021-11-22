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
  
  public func show(id: Int) -> Single<[Show]> {
    let result = RxService.showsAPI().fetchOneFrom(endpoint: .show(id: id), type: Show.self)
    return result
  }
  
  // TODO: topRatedShows -
  
  // TODO: allReviews(showId) -
  // TODO: createReview(showId) -
  // TODO: deleteReview(reviewId) -
  // TODO: updateReview(reviewId) -
  
}
