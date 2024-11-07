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
    func loading()
    func complete()
    func showError(_ e:String)}

class MovieViewModel {
    weak var delegate: MovieViewModelDelegate?
    private(set) var movie: MovieModel?
    
    func initialize(_ page: Int) {
        self.delegate?.loading()
        URLSession.shared.dataTask(with: URLRequest(url: URL( string: Constants.URL+String(page))!)){
            (data,req,err) in do{
                let result = try JSONDecoder().decode(MovieModel.self, from: data!)
                self.delegate?.initializeMovie(result.results)
            }catch{
                self.delegate?.showError(error.localizedDescription)
            }
            self.delegate?.complete()
        }.resume()
        
    }
    
    
    
    
}
