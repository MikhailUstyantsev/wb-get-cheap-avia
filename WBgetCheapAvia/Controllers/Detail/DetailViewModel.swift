//
//  DetailViewModel.swift
//  WBgetCheapAvia
//
//  Created by Михаил on 20.09.2023.
//

import Foundation

protocol DetailViewModelDelegate {
    func updateFavorites(searchToken: String?, isFavorite: Bool)
}

final class DetailViewModel {
    
    var delegate: DetailViewModelDelegate?
    
    var flight: Flight?
    var isFavorite = false
   
    
    func likeButtonTapped() {
        isFavorite = !isFavorite

        delegate?.updateFavorites(searchToken: flight?.searchToken, isFavorite: isFavorite)

        //в userdeafaults будем записывать searchtoken если тапнут лайк и потом проверять его наличие в массиве favorites при конфигурации ячеек
        
    }
    
    
    
    
}
