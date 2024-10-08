//
//  DetailViewViewController.swift
//  Colors
//
//  Created Vic Rmz on 06/09/24.
//  Template generated by UPAX Zeus
//

import UIKit
import SDWebImage

class DetailViewViewController: UIViewController {
	var presenter: DetailViewPresenterProtocol?
    var info : Photo?
    
    /// Views for this controller
    let mainView = DetailViewView()

	override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        self.title = "Detail View"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        setupGestures()
    }
    
    private func setupGestures() {
        mainView.imageDetailViewColor.sd_setImage(with: URL(string: (info?.thumbnailUrl)!),completed: nil)
        mainView.descriptionDetailViewColor.text = info?.title
    }
    
}

extension DetailViewViewController: DetailViewViewProtocol {
    
}
