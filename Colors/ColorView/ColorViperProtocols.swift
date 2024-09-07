//
//  ColorViperProtocols.swift
//  Colors
//
//  Created Vic Rmz on 04/09/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import Foundation

//MARK: Presenter -> Router
protocol ColorViperWireframeProtocol: AnyObject {
    func goToDetailView(info : Photo)
}

//MARK: View -> Presenter
protocol ColorViperPresenterProtocol: AnyObject {
    var interactor: ColorViperInteractorInputProtocol? { get set }
    
    func getData()
    func goToDetailView(info : Photo)
    
}

//MARK: Interactor -> Presenter
protocol ColorViperInteractorOutputProtocol: AnyObject {
    
    func gettedData(data: [Photo])
}

//MARK: Presenter -> Interactor
protocol ColorViperInteractorInputProtocol: AnyObject {
    var presenter: ColorViperInteractorOutputProtocol?  { get set }
    
    func getData()
}

//MARK: Presenter -> View
protocol ColorViperViewProtocol: AnyObject {
    var presenter: ColorViperPresenterProtocol?  { get set }
    
    func gettedData(data: [Photo])
}
