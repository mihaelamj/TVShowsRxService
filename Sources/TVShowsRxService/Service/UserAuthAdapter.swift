//
//  UserAuthAdapter.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import Foundation
import RequestAdapter
import TVShowsEndpoint

public struct UserAuthAdapter : RequestAdapter.Adapter {
  public func onResponse(response: URLResponse?, data: Data?) {
    if let urlResponse = response as? HTTPURLResponse {
      TVShowsEndpoint.UserAuthData.saveToRepositoryFrom(urlResponse: urlResponse)
    }
  }
}
