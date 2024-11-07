//
//  SceneDelegate.swift
//  movieapp
//
//  Created by admin on 28/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


/*
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
     func showError(_ e:String)
 }

 class MovieViewModel {
     weak var delegate: MovieViewModelDelegate?
     private(set) var movie: MovieModel?
     
     func initialize(_ page: Int,_ view : UIView) {
         self.delegate?.loading()
         URLSession.shared.dataTask(with: URLRequest(url: URL( string: Constants.URL+String(page))!)){
             (data,req,err) in do{
                 
                 
                 let result = try JSONDecoder().decode(MovieModel.self, from: data!)
                 
                 
                 self.delegate?.initializeMovie(result.results)
                 
                 self.delegate?.loading()
                 
             }catch{
                 self.delegate?.showError(error.localizedDescription)
             }
             self.delegate?.complete()
             
         }.resume()
     }
     
     
     
     
 }

 */
