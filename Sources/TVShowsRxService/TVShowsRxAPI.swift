
//import Alamofire
import RequestAdapter
import TVShowsResponseResults
import TVShowsEndpoint

// MARK: - TVShowsRxAPI -

public struct TVShowsRxAPI {
    
    typealias ReqAdapter = RequestAdapter.Adapter
    
    typealias TVSEndpoint = TVShowsEndpoint.Endpoint
    
    // MARK: Properties -
    
    var adapters: [ReqAdapter]
    
    // MARK: Init -
    
    public init(adapters: [RequestAdapter.Adapter] = []) {
        self.adapters = adapters
    }
}
