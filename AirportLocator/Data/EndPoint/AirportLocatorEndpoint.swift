//
//  AirportLocatorEndpoint.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
extension Endpoint {
    static func getAirportsForLocation(myLat : String , myLon : String, km : String) -> Self{
        return Endpoint(path: "/location/\(myLat)/\(myLon)/km/\(km)/20")
    }
}
