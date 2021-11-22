
import Alamofire
import RequestAdapter
import TVShowsResponseResults
import TVShowsEndpoint

//import RxSwift

public struct TVShowsRxService {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}


// MARK: - RxAPI -

public struct RxAPI {
  
  // MARK: Properties -
  
    private var adapters: [RequestAdapter.RequestAdapter]
  
  // MARK: Init -
  
    public init(adapters: [RequestAdapter.RequestAdapter] = []) {
    self.adapters = adapters
  }
}
