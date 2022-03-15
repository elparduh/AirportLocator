//
//  AirportDataSourceRemote.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
import Combine
protocol AirportDataSourceRemote{
    var networker: NetworkerProtocol { get }
    func getAllAirportsForLocation(myLat : String , myLon : String, km : String) -> AnyPublisher<AirportModel, Error>
}
