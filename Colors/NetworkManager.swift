//
//  NetworkManager.swift
//  Colors
//
//  Created by Vic Rmz on 05/09/24.
//

import Foundation
protocol NetworkManagerDelegate{
    func responseSuccess(response : [Photo])
    func responseError(error : Error)
}

class NetworkManager : NSObject, URLSessionDelegate, URLSessionDataDelegate {
    
    var delegate : NetworkManagerDelegate?
    
    func getColorsList(page : Int){
        let urlString = "https://jsonplaceholder.typicode.com/photos?_page=\(page)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        
        let task = defaultSession.dataTask(with: request){[self] data, response, error in
            //print("Data: \(data)")
            //print("response: \(response)")
            //print("error: \(error)")
            
            
            if let error = error {
                delegate?.responseError(error: error)
                print("Error")
            }else {
                if let data = data {
                    let json = String(data: data, encoding: .utf8)
                    //print("JSON data : \(json)")
                    do{
                        let photoObject = try JSONDecoder().decode([Photo].self, from: data)
                        print(photoObject)
                        delegate?.responseSuccess(response: photoObject)
                    }catch{
                        print(error.localizedDescription)
                        delegate?.responseError(error: error)
                    }
                }
            }
        }
        task.resume()
    }
}
