//
//  API.swift
//
//
//  Created by iMacPro on 22.11.2021..
//

import RequestAdapter
import TVShowsResponseResults
import TVShowsEndpoint

// MARK: - API -

public struct API {
    
    // MARK: Properties -
  
    var adapters: [RequestAdapter.Adapter]
    
    // MARK: Init -
    
    public init(adapters: [RequestAdapter.Adapter] = []) {
        self.adapters = adapters
    }
}
