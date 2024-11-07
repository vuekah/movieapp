//
//  DetailViewModel.swift
//  movieapp
//
//  Created by admin on 30/10/24.
//

import Foundation
import MBProgressHUD

protocol DetailViewModelDelegate: AnyObject {
    func loading()
    func didUpdateDetail(_ runtime: Int)
    func completed()
    func showError(_ e: String)
}

class DetailViewModel {
    weak var delegate: DetailViewModelDelegate?
    private(set) var detail: DetailModel?
    
    func fetchDetail(id: Int) {
        guard let url = URL(string: "\(Constants.DETAIL_MOVIE)\(id)?\(Constants.LANGUAGE)&\(Constants.API_KEY)") else {
            print("sai URL")
            return
        }
        self.delegate?.loading()
        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] (data, response, error) in
            do {
                let result = try JSONDecoder().decode(DetailModel.self, from: data!)
                self?.delegate?.didUpdateDetail(result.runtime)
            } catch {
                self?.delegate?.showError(error.localizedDescription)
            }
            self?.delegate?.completed()
        }.resume()
    }
}
