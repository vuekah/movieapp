//
//  MovieViewModel.swift
//  movieapp
//
//  Created by admin on 28/10/24.
//

import Foundation
import UIKit
import MBProgressHUD


protocol MovieViewModelDelegate: AnyObject {
    func initializeMovie(_ result: [Result]?)
}

class MovieViewModel {
    weak var delegate: MovieViewModelDelegate?
    private(set) var movie: MovieModel?
    
    func initialize(_ page: Int,_ view : UIView) {
        URLSession.shared.dataTask(with: URLRequest(url: URL( string: Constants.URL+String(page))!)){
            (data,req,err) in do{
                DispatchQueue.main.async {
                    MBProgressHUD.showAdded(to: view, animated: true)
                }
                
                let result = try JSONDecoder().decode(MovieModel.self, from: data!)
                DispatchQueue.main.async {
                    
                    self.delegate?.initializeMovie(result.results)
                    
                }
                
            }catch{
                //                print(error)
            }
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: view, animated: true)
            }
        }.resume()
    }
    
    
    
    
}
