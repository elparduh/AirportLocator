//
//  AirportRepositoryImpl.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
import Combine

class AirportRepositoryImpl : AirportRepository{
    private var airportDataSourceRemote : AirportDataSourceRemote
    
    init(airportDataSourceRemote : AirportDataSourceRemote){
        self.airportDataSourceRemote = airportDataSourceRemote
    }
    
    func getAllAirportsForLocation(myLat: String, myLon: String, km: String) -> AnyPublisher<AirportModel, Error> {
        return airportDataSourceRemote.getAllAirportsForLocation(myLat: myLat, myLon: myLon, km: km)
    }
}
