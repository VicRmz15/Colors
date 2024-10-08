//
//  ColorViperViewController.swift
//  Colors
//
//  Created Vic Rmz on 04/09/24.
//  Template generated by UPAX Zeus
//

import UIKit

class ColorViperViewController: UIViewController {

	var presenter: ColorViperPresenterProtocol?
    var dataSource = [Photo]()
    
    /// Views for this controller
    let mainView = ColorViperView()
    
    var isLoading = false
    
	override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        self.title = "Photos"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black]
    
        setupGestures()
        presenter?.getData()
        setUpTable()
    }
    
    private func setupGestures() {
        
    }
    
    func setUpTable () {
        mainView.colorList.delegate = self
        mainView.colorList.dataSource = self
    }
    
    func showProgressView() {
        mainView.progressView.isHidden = false
        mainView.progressView.progress = 0.0
        UIView.animate(withDuration: 1.0) {
            self.mainView.progressView.setProgress(1.0, animated: true)
        }
    }
    
    func hideProgressView() {
        mainView.progressView.isHidden = true
        mainView.progressView.progress = 0.0
    }
    
}

extension ColorViperViewController: ColorViperViewProtocol {
    
    func gettedData(data: [Photo]) {
        
        hideProgressView()
        isLoading = false
        dataSource.append(contentsOf: data)
        mainView.colorList.reloadData()
    }
}

extension ColorViperViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = dataSource[indexPath.row]
        let cell = ColorListTableViewCell(photo: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPhoto = dataSource[indexPath.row]
        presenter?.goToDetailView(info: selectedPhoto)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height - 100 && !isLoading {
            isLoading = true
            showProgressView()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.presenter?.getData()
            }
        }
        
    }
}
