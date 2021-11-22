//
//  API+Item.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import Foundation
import Alamofire
import RequestAdapter
import TVShowsEndpoint
import TVShowsResponseResults
import RxSwift

public extension API {
  func getItem<T>(dataRequest: DataRequest, decodingStrategy: JSONDecoder.KeyDecodingStrategy) -> Single<T> where T: Decodable {
    
    return Single.create { single in
      
      self.adapters.forEach { $0.beforeSend(dataRequest.request) }
      
      dataRequest
        .validate()
        .responseData { data in
          
          self.adapters.forEach { $0.onResponse(response: data.response, data: data.data) }
          
          guard let data = data.data else {
            let error = data.error ?? AFError.explicitlyCancelled // INFO: Maybe change the error type to something decoding related -
            self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
            
            single(.failure(data.error ?? AFError.explicitlyCancelled))
            return
          }
          
          do {
            let decoder = TVSEndpoint.makeDecoder(decodingStrategy: decodingStrategy)
            
            if let item = try decoder.decode(TVShowsResponseResults.Item<T>.self, from: data).item {
              self.adapters.forEach { $0.onSuccess(request: dataRequest.request) }
              single(.success(item))
            } else {
              let error = AFError.explicitlyCancelled // INFO: MAybe change the error type to something decoding related -
              self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
              single(.failure(error))
            }
            
          } catch {
            single(.failure(error))
          }
          
        }
      
      return Disposables.create { dataRequest.cancel() }
    }
  }
}

public extension API {
  func fetchOneFrom<T>(endpoint: TVSEndpoint, type: T.Type) -> Single<T> where T: Decodable {
    return getItem(dataRequest: endpoint.request, decodingStrategy: endpoint.decodingStrategy)
  }
}
