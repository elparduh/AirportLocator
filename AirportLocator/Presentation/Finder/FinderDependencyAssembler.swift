//
//  FinderAssembler.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation

protocol FinderDependencyAssembler {
    func resolve() -> GetAllAirportForLocationProvider
    func resolve() -> AirportRepository
    func resolve() -> AirportDataSourceRemote
    func resolve() -> NetworkerProtocol
}

extension FinderDependencyAssembler {
    
    func resolve() -> GetAllAirportForLocationProvider {
        return GetAllAirportForLocationProviderImpl(airportRepository: resolve())
    }
    
    func resolve() -> AirportRepository {
        return AirportRepositoryImpl(airportDataSourceRemote: resolve())
    }
    
    func resolve() -> AirportDataSourceRemote {
        return AirportService(networker: resolve())
    }
   
    func resolve() -> NetworkerProtocol {
        return Networker()
    }
    
}

class FinderAssemblerInjector : FinderDependencyAssembler {
    
}
