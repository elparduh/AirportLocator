//
//  AirportService.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
import Combine

class AirportService : AirportDataSourceRemote{
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getAllAirportsForLocation(myLat: String, myLon: String, km: String) -> AnyPublisher<AirportModel, Error> {
        let endpoint = Endpoint.getAirportsForLocation(myLat: myLat, myLon: myLon, km: km)
        let _airports = networker.get(type: AirportModel.self, url: endpoint.url, headers: endpoint.headers)
        return _airports
    }
}
