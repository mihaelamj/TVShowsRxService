//
//  API+Collection.swift
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
    func getCollection<T>(ofType: T.Type, dataRequest: DataRequest, decodingStrategy: JSONDecoder.KeyDecodingStrategy) -> Single<[T]> where T: Decodable {
      return Single.create { single in
    
        self.adapters.forEach { $0.beforeSend(dataRequest.request) }
        
        dataRequest
          .validate()
          .responseData { data in
            
            self.adapters.forEach { $0.onResponse(response: data.response, data: data.data) }
            
            guard let data = data.data else {
              let error = data.error ?? AFError.explicitlyCancelled // INFO: Maybe change the error type to something decoding related -
              self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
              single(.failure(error))
              return
            }
            
            do {
                let decoder = TVSEndpoint.makeDecoder(decodingStrategy: decodingStrategy)
                let result = try decoder.decode(TVShowsResponseResults.Collection<T>.self, from: data)
              let items: [T] = result.results ?? [] // INFO: Maybe return an error here, if empty -
              self.adapters.forEach { $0.onSuccess(request: dataRequest.request) }
              single(.success(items))
            } catch {
              self.adapters.forEach { $0.onError(request: dataRequest.request, error: error) }
              single(.failure(error))
            }
            
          }
        
        return Disposables.create { dataRequest.cancel() }
      }
    }
}

public extension API {
  func fetchCollectionFrom<T>(endpoint: TVSEndpoint, type: T.Type) -> Single<[T]> where T: Decodable {
    return getCollection(ofType: T.self, dataRequest: endpoint.request, decodingStrategy: endpoint.decodingStrategy)
  }
}
