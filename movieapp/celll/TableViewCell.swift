import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratedTitle: UILabel!
    @IBOutlet weak var typeTitle: UILabel!
    @IBOutlet weak var yearTitle: UILabel!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func onBind(_ data: Result) {
        mImage.layer.cornerRadius = 16
        mImage.clipsToBounds = true
        guard let url = URL(string: Constants.IMAGE_URL+(data.posterPath)) else { return }
        mImage.load(url: url)
        titleLabel.text = data.title
        ratedTitle.text = String.modifyRate(data.voteAverage)
    
        let genreNames = data.genreIDS.compactMap { GenreUtils.getGenreName(id: $0) }
        typeTitle.text = genreNames[0]
        yearTitle.text = data.releaseDate.components(separatedBy:"-")[0]
    }
    
  
}
