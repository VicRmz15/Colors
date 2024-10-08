//
//  DetailViewRouter.swift
//  Colors
//
//  Created Vic Rmz on 06/09/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by UPAX Zeus
//

import UIKit

class DetailViewRouter: DetailViewWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(info: Photo) -> UIViewController {
        let view = DetailViewViewController()
        let interactor = DetailViewInteractor()
        let router = DetailViewRouter()
        let presenter = DetailViewPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
    
        view.info = info
        
        return view
    }

}
