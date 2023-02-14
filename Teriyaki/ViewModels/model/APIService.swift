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
    
    func fetchCartData(completion: @escaping(Result<CartFetch,ApiError>) -> Void) {
        let url = createURL(for: "", type: "cartPrd")
        print("url: \(url!)")
        fetch(type: CartFetch.self, url: url, completion: completion)
    }
    
    func addToCart(data: [PrdFetchQuery], completion: @escaping(Result<AddToCartRequest,ApiError>) -> Void) {
        let request = createURL(for: "POST", data: data)
        fetch(type: AddToCartRequest.self, request: request as URLRequest?, completion: completion)
    }
    
    func fetch<T: Decodable>(type: T.Type, request: URLRequest?, completion: @escaping(Result<T,ApiError>) -> Void) {
        
        guard let request = request else {
            let error = ApiError.badURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
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
        //GET: //teriyaki.su/index.php?route=api/category&path=
        //GET: //teriyaki.su/index.php?route=api/zstore3/catstoplevel
        //GET: //teriyaki.su/index.php?route=api/cart/products
        
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
        
        if (type == "cartPrd") {
            queryItems = [URLQueryItem(name: "route", value: "api/cart/products")]
        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    func createURL(for postType: String, data: [PrdFetchQuery] = []) -> NSMutableURLRequest? {
        // POST: //teriyaki.su/index.php?route=api/cart/add
        var baseURL = "https://teriyaki.su/index.php"
        
        if (postType == "POST") {
            baseURL = baseURL + "?route=api/cart/add"
        }
        
        let request = NSMutableURLRequest(url: URL(string: baseURL)!)
//        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "POST"
        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: [PrdFetchQuery].self, options: .prettyPrinted)
//            print("[124] \(request.httpBody)")
//        }catch {
//            print("[125] \(error)")
//        }
        
        var postString = "" //"param_name_one=\( value_1 )&param_name_two=\(value_2)&........."
        data.forEach { query1 in
            postString = postString + "&\(query1.keyQuery)=\(String(describing: query1.valQuery))"
        }
        if postString != "" {
            request.httpBody = postString.data(using: String.Encoding.utf8)
        }
        return request
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
