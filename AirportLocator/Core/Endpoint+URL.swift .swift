//
//  Endpoint+URL.swift .swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 11/03/22.
//

import Foundation
extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = Constants.SCHEME_URL
        components.host = Constants.HOST
        components.path = Constants.BASE_PATH + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "x-rapidapi-key": Constants.API_KEY,
            "x-rapidapi-host": Constants.HOST
        ]
    }
}
