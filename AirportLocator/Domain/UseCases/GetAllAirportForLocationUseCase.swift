//
//  GetAllAirportForLocationUseCase.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
import Combine

protocol GetAllAirportForLocationRemote {
    func buildUseCase(params: GetAllAirportForLocationRemoteUseCase.Params) -> AnyPublisher<AirportModel, Error>
}

class GetAllAirportForLocationRemoteUseCase :  GetAllAirportForLocationRemote {
    private var airportRepository : AirportRepository
    
    init(airportRepository : AirportRepository) {
        self.airportRepository = airportRepository
    }
    
    func buildUseCase(params: Params) -> AnyPublisher<AirportModel, Error> {
        return airportRepository.getAllAirportsForLocation(myLat: params.myLat, myLon: params.myLon, km: params.km)
    }
    
    public struct Params {
        let myLat : String
        let myLon : String
        let km : String
        
        init(myLat : String,  myLon : String, km : String) {
            self.myLat = myLat
            self.myLon = myLon
            self.km = km
        }
    }
}
