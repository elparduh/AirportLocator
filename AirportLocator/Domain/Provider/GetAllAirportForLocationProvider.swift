//
//  GetAllAirportForLocationProvider.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation

protocol GetAllAirportForLocationProvider  {
    func providegetAllAirportsForLocationRemote() -> GetAllAirportForLocationRemoteUseCase
}

class GetAllAirportForLocationProviderImpl : GetAllAirportForLocationProvider{
    private var airportRepository : AirportRepository
    
    init(airportRepository : AirportRepository) {
        self.airportRepository = airportRepository
    }
    
    func providegetAllAirportsForLocationRemote() -> GetAllAirportForLocationRemoteUseCase {
        return GetAllAirportForLocationRemoteUseCase(airportRepository: self.airportRepository)
    }
}
