//
//  UserService.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import Foundation
import RequestAdapter
import TVShowsEndpoint
import RxSwift

class UserService {
  
  static let shared = UserService()
  
  // MARK: - API -
  
  func register(with email: String, _ password: String) -> Single<User> {
    let result = RxService.userAPI().fetchOneFrom(endpoint: .register(email: email, password: password), type: User.self)
    return result
  }
  
  func login(with email: String, _ password: String) -> Single<User> {
    let result = RxService.userAPI().fetchOneFrom(endpoint: .login(email: email, password: password), type: User.self)
    return result
  }
  
  // MARK: - App -
  
  func saveRememberMe() {
    UserDefaults.standard.set(true, forKey: Constants.UserData.rememberMe)
  }
  
  func deleteRememberMe() {
    TVShowsEndpoint.UserAuthData.deleteFromRepository()
  }
  
}
