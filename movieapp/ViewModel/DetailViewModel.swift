//
//  DetailViewModel.swift
//  movieapp
//
//  Created by admin on 30/10/24.
//

import Foundation
import MBProgressHUD

protocol DetailViewModelDelegate: AnyObject {
    func didUpdateDetail(_ runtime: Int)
}

class DetailViewModel {
    weak var delegate: DetailViewModelDelegate?
    private(set) var detail: DetailModel?

    func fetchDetail(id: Int,_ view:UIView) {
        
//        print("\(Constants.DETAIL_MOVIE)\(id)?\(Constants.LANGUAGE)&\(Constants.API_KEY)")
        
        guard let url = URL(string: "\(Constants.DETAIL_MOVIE)\(id)?\(Constants.LANGUAGE)&\(Constants.API_KEY)") else {
            print("sai URL")
            return
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] (data, response, error) in
            do {

                let result = try JSONDecoder().decode(DetailModel.self, from: data!)
//                print(result.runtime)
                DispatchQueue.main.async {
//                    MBProgressHUD.showAdded(to: view, animated: true)
//
                    self?.delegate?.didUpdateDetail(result.runtime)
                }
            } catch {
                print(error)
            }
//            DispatchQueue.main.async {
//                MBProgressHUD.hide(for:view , animated: true)
//            }
            
        }.resume()
    }
}
