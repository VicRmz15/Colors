//
//  ColorViperInteractor.swift
//  Colors
//
//  Created Vic Rmz on 04/09/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class ColorViperInteractor: ColorViperInteractorInputProtocol {
    
    
    weak var presenter: ColorViperInteractorOutputProtocol?
    
    var dataSource = [Photo]()
    
    var isLoading = false
    var isLastPage = false
    var currentPage = 1
    
    func getData (){
        
        let networkManager = NetworkManager()
        networkManager.delegate = self
        networkManager.getColorsList(page: currentPage)
        
        guard !isLoading && isLastPage else {return}
        isLoading = true
        
    }
    
}

extension ColorViperInteractor: NetworkManagerDelegate{
    func responseSuccess(response: [Photo]) {
        print("responseSuccess : \(response)")
        
        if response.isEmpty {
            isLastPage = true
        }else{
            currentPage += 1
        }
        
        dataSource.append(contentsOf: response)
        presenter?.gettedData(data: response)
        isLoading = false
    }
    
    func responseError(error: Error) {
        print("responseError: \(error)")
        isLoading = false
    }
}
