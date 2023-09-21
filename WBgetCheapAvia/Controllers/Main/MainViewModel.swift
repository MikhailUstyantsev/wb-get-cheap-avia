//
//  MainViewModel.swift
//  WBgetCheapAvia
//
//  Created by Михаил on 20.09.2023.
//

import Foundation

final class MainViewModel {
    
    var flights = [Flight]()
    var onUpdate: () -> Void = {}
    
    func getData() {
        WBService.instance.getCheapFlights { result in
            switch result {
            case .success(let flights):
                self.flights = flights.flights
                self.onUpdate()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}
