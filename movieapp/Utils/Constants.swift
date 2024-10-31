//
//  Constants.swift
//  movieapp
//
//  Created by admin on 28/10/24.
//

import Foundation


struct Constants{
    // MARK  - API
    static let URL = "https://api.themoviedb.org/3/movie/upcoming?\(API_KEY)&\(LANGUAGE)page="
    static let LANGUAGE="language=en-US&"
    static let DETAIL_MOVIE = "https://api.themoviedb.org/3/movie/"
    
    static let IMAGE_URL = "https://image.tmdb.org/t/p/w500"
    static let IMAGE_POSTER_URL = "https://image.tmdb.org/t/p/w1280"
    
    static let API_KEY = "api_key=ff3a62ac4d904a8f37c2820a45bd98f2"
}
