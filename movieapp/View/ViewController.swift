//
//  ViewController.swift
//  movieapp
//
//  Created by admin on 28/10/24.
//
import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    private var movieModel = MovieViewModel()
    private var indexPage: Int = 1
    private var isEndOfPage: Bool = false
    private var dataList = [Result]()
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        movieModel.delegate = self
    }
    
    private func initUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        mTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        movieModel.initialize(indexPage)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.onBind(dataList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.data = dataList[(mTableView.indexPathForSelectedRow?.row)!]
        }
    }
}

extension ViewController: MovieViewModelDelegate {
    func loading() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func complete() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func showError(_ e: String) {
        DispatchQueue.main.async{
            let alert = UIAlertController(title: "Error", message: e, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func initializeMovie(_ result: [Result]?) {
        guard let result = result else { return }
        
        if result.isEmpty {
            isEndOfPage = true
            return
        }
        
        self.dataList.append(contentsOf: result)
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height - 100 {
            if !isEndOfPage {
                indexPage += 1
                movieModel.initialize(indexPage)
            }
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
