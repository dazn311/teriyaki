//
//  APIService.swift
//  ItunesSearchApp
//
//  Created by Karin Prater on 25.07.22.
//

import Foundation




class APIService {
    
    func fetchCatalogTop(searchTerm: String, completion: @escaping(Result<CategoriesFetch,ApiError>) -> Void) {
        let url = createURL(for: searchTerm, type: "cat")
        fetch(type: CategoriesFetch.self, url: url, completion: completion)
    }
    
    func fetchPrd(searchTerm: String, completion: @escaping(Result<PrdAndCatFetch,ApiError>) -> Void) {
        let url = createURL(for: searchTerm, type: "prd")
        fetch(type: PrdAndCatFetch.self, url: url, completion: completion)
    }
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T,ApiError>) -> Void) {
        
        guard let url = url else {
            let error = ApiError.badURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error as? URLError {
                
                completion(Result.failure(ApiError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ApiError.badResponse(response.statusCode)))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }
    
    func createURL(for searchTerm: String, type: String = "") -> URL? {
        // https://teriyaki.su/index.php?route=api/category&path=
        // https://teriyaki.su/index.php?route=api/zstore3/catstoplevel
        
        let baseURL = "https://teriyaki.su/index.php"
        var queryItems = [] as [URLQueryItem]
        
        if (type == "cat") {
//            queryItems.append(URLQueryItem(name: "path", value: String(type)))
            queryItems = [URLQueryItem(name: "route", value: "api/zstore3\(searchTerm)")]
        }
        if (type == "prd") {
            queryItems = [URLQueryItem(name: "route", value: "api/category")]
            queryItems.append(URLQueryItem(name: "path", value: searchTerm))
        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}




//    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<SongResult,APIError>) -> Void) {
//        let url = createURL(for: searchTerm, type: .song, page: page, limit: limit)
//        fetch(type: SongResult.self, url: url, completion: completion)
//    }
//
//    func fetchMovies(searchTerm: String, completion: @escaping(Result<MovieResult,APIError>) -> Void) {
//        let url = createURL(for: searchTerm, type: .movie, page: nil, limit: nil)
//        fetch(type: MovieResult.self, url: url, completion: completion)
//    }
