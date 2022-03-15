//
//  FinderViewModel.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 14/03/22.
//

import Foundation
import Combine

class FinderViewModel : ObservableObject{
    private var getAllAirportForLocationProvider : GetAllAirportForLocationProvider
    private let finderAssemblerInjector : FinderAssemblerInjector = FinderAssemblerInjector()
    @Published var airports: [Items] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        self.getAllAirportForLocationProvider = finderAssemblerInjector.resolve()
    }
   
    public func onAppear() {
        self.retrieveAllAirportsForLocation(myLat: "19.09641310712031", myLon: "-98.24944295398755", km: "100")
    }
    
    func retrieveAllAirportsForLocation(myLat: String, myLon: String, km: String)  {
        let result = getAllAirportForLocationProvider.providegetAllAirportsForLocationRemote().buildUseCase(params: GetAllAirportForLocationRemoteUseCase.Params.init(myLat: myLat, myLon: myLon, km: km))
        
        result.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.hasError = true
                case .finished: break
                }
            }, receiveValue: { [weak self] airportsResponse in
                self?.airports = airportsResponse.items ?? [Items]()
            }).store(in: &cancellables)
    }
}
