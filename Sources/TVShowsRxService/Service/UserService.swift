//
//  UserService.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import Foundation
import TVShowsEndpoint
import RxSwift

public class UserService {
  
  // MARK: - Properties -
  
  public static let shared = UserService()
  
  public private(set) var api = Service.userAPI()
  
  // MARK: - API -
  
  public func register(with email: String, _ password: String) -> Single<User> {
    let result = api.fetchOneFrom(endpoint: .register(email: email, password: password), type: User.self)
    return result
  }
  
  public func login(with email: String, _ password: String) -> Single<User> {
    let result = api.fetchOneFrom(endpoint: .login(email: email, password: password), type: User.self)
    return result
  }
  
  public func updateUser(with email: String, imageURLString: String) -> Single<User>  {
    let result = api.fetchOneFrom(endpoint: .updateUserImage(email: email, imageURLString: imageURLString), type: User.self)
    return result
  }
  
  // MARK: - App -
  
  public func saveRememberMe() {
    UserDefaults.standard.set(true, forKey: Constants.UserData.rememberMe)
  }
  
  public func deleteRememberMe() {
    TVShowsEndpoint.UserAuthData.deleteFromRepository()
  }
  
}
