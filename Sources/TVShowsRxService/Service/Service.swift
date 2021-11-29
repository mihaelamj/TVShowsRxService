//
//  RxService.swift
//  
//
//  Created by iMacPro on 22.11.2021..
//

import Foundation
import RequestAdapter

public struct Service {
  
  public static func showsAPI() -> API {
    return API(adapters: [LogAdapter(logLevel: .debug), UserAuthAdapter()])
  }
  
  public static func userAPI() -> API {
    return API(adapters: [LogAdapter(logLevel: .debug), UserAuthAdapter()])
  }
}
