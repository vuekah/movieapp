//
//  DetailViewController.swift
//  movieapp
//
//  Created by admin on 29/10/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data:Result?
    private var detailModel = DetailViewModel()
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var layerRated: UIStackView!
    @IBOutlet weak var mPosterImg: UIImageView!
    @IBOutlet weak var mAvatarImg: UIImageView!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        detailModel.delegate = self
        fillData()
        
    }
    
    private func fillData(){
        if let data = data{
            
            let urlPoster = URL(string: "\( Constants.IMAGE_POSTER_URL)\(data.backdropPath)")
            let urlAvatar = URL(string: "\( Constants.IMAGE_URL)\(data.posterPath)")
            let genreNames = data.genreIDS.compactMap { GenreUtils.getGenreName(id: $0) }
            
            mPosterImg.load(url:urlPoster!)
            mAvatarImg.load(url: urlAvatar!)
            mAvatarImg.layer.cornerRadius = 8
            mAvatarImg.clipsToBounds = true
            titleLabel.text = data.title
            ratedLabel.text = String.modifyRate(data.voteAverage)
            dateLabel.text = data.releaseDate.components(separatedBy: "-")[0]
            typeLabel.text = genreNames[0]
            descriptionLabel.text = data.overview
            detailModel.fetchDetail(id: data.id,self.view)
        }
    }
    
    private func initUI(){
        self.navigationItem.title="Detail"
        runtimeLabel.text=""
        let backButtonImage = UIImage(systemName: "chevron.backward")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        let rightButtonImage = UIImage(named: "bookmark")
        let rightButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = backButton
        
        self.layerRated.layer.cornerRadius=8
        self.layerRated.clipsToBounds=true
        
    }
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DetailViewController:DetailViewModelDelegate{
    func didUpdateDetail(_ runtime: Int)
    {
        runtimeLabel.text = "\(runtime) minutes"
        
        self.updateViewConstraints()
        
    }
}
