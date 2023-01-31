//
//  CategoryesHomeModel.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import Foundation
import Combine

// MARK: - Products
struct Products: Codable {
    let productID: String
    let thumb: String
    let name, model, jan, parentID: String
    let description, price: String
    let special: Bool
    let tax, minimum: String
    let rating: Int
    let href: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case thumb, name, model, jan
        case parentID = "parent_id"
        case description, price, special, tax, minimum, rating, href
    }
}





struct PrdFetch: Codable {
    let products: [Products]
}

struct Categories: Codable {
    let cats: [Category2]
}


struct Category2: Codable {
    let level, pathID, sortOrder, statuss: String
    let parentID, categoryID, name: String

    enum CodingKeys: String, CodingKey {
        case level
        case pathID = "path_id"
        case sortOrder = "sort_order"
        case statuss
        case parentID = "parent_id"
        case categoryID = "category_id"
        case name
    }
}



enum ApiError: Error {
    case noResponse
    case no200
    case noData
}

enum ApiError2: Error, CustomStringConvertible {
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "url session \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "decoding error: \(decodingError.debugDescription)"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL,.unknown:
            return "something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "something went wrong"
        case .badResponse(_):
            return "something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "something went wrong"

        }
    }
}

enum StatusFetch: Comparable {
    case initional
    case fetching
    case fetched
    case error(String)
}


class CategoryesHomeModel: ObservableObject {

    @Published var dataCategories: [Category2] = []
    @Published var dataProducts: [Products] = []
    
    private var dataProductsFromCat: PrdAndCatData = PrdAndCatData()
    @Published var dataProductsFromCatFilter: PrdAndCatData = PrdAndCatData()
    @Published var parentId = "70"
    @Published var searchText = ""

    @Published var statusFetch: StatusFetch = .initional {
        didSet {
            print("state statusFetch change to: \(statusFetch)")
        }
    }
    @Published var statusFetchPrd: StatusFetch = .initional {
        didSet {
            print("state statusFetchPrd change to: \(statusFetchPrd)")
        }
    }
//    @Published var messageErr = ""
    @Published var catsFilterWord = ""

    @Published var prevDataCategories: [Category2] = [
        Category2(level: "0", pathID: "1", sortOrder: "0", statuss: "2", parentID: "70", categoryID: "45", name: "tomato")
    ]
    
    var subscriptions = Set<AnyCancellable>()
    var subSearchToolbar = Set<AnyCancellable>()
 
    var session: URLSession!

    init() {
        print("start init CategoryesHomeModel")
        
        $parentId
            .sink { [weak self] parId in
                self?.statusFetchPrd = .fetched
                    
                self?.fetchProductsFromCat(parentId: parId, completion: { error in
                    self?.statusFetchPrd = .error("Error: not fetchPrd1")
                })
        }.store(in: &subscriptions)
        
        $searchText
            .dropFirst()
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .sink { [weak self] searchTxt in
                if let cat23 = self?.dataProductsFromCat[self?.parentId ?? "70"] {
                    self?.dataProductsFromCatFilter[self?.parentId ?? "70"] = searchTxt != "" ? cat23.filter({ cat in
                        cat.name.localizedLowercase.contains(searchTxt.localizedLowercase) || cat.products.filter({ prd in
//                            print(prd.name)
                            return prd.name.localizedLowercase.contains(searchTxt.localizedLowercase)
                        }).count > 0
                    }) :cat23
                    
//                    print(self?.dataProductsFromCatFilter[self?.parentId ?? "70"])
//                    self?.dataProductsFromCatFilter[self?.parentId ?? "70"]?.products = searchTxt != "" ? cat23.products.filter({ prd in
//                        prd.name.localizedLowercase.contains(searchTxt.localizedLowercase)
//                        }) : cat23
                }
                
        }.store(in: &subSearchToolbar)
    }
    func fetchCats () {
        guard let yourUrl = URL(string: SetupApp.urlCatalog) else {
            return
        }
        self.statusFetch = .fetching
        
        var request = URLRequest(url: yourUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        request.setValue(SetupApp.retrieveToken, forHTTPHeaderField: "api_token")
        
        session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { [weak self](  data, res, error)  in

            if let statusCode = (res as? HTTPURLResponse)?.statusCode, statusCode >= 400 {

                DispatchQueue.main.async {
//                    self?.messageErr = "Bad status: \(statusCode)"
                    self?.statusFetch = .error("Error: not decode data1: \(statusCode)")
                }
            }

            
            guard let jsonData = data else {
                print("CategoryesHomeModel: not data from session")
                DispatchQueue.main.async {
                    self?.statusFetch = .error("CategoryesHomeModel: not data from session")
                }
                return  }
            

//            prettyJSONString(jsonData: jsonData)
            
            DispatchQueue.main.async {
                do {
                    let tmpData = try JSONDecoder().decode(Categories.self, from: jsonData)
                    self?.dataCategories = tmpData.cats
//                    self?.loaded = true
                    self?.statusFetch = .fetched
//                    prettyJSONString(jsonData: tmpData.cats)
                    
//                    print(tmpData.cats)
                    print("tmpData.cats -OK")
                } catch {
                    print("CategoryesHomeModel: failed to convert : \(error)")
//                    self?.messageErr = error.localizedDescription
//                    self?.loaded = false
                    self?.statusFetch = .error("Error: not decode data1: \(error)")
                }

                
            }
          
        }
        
        task.resume()
    }
    
    
    func fetchProducts (completion: @escaping (Error?) -> () ) {
        guard let yourUrl = URL(string: SetupApp.urlProducts) else {
            return
        }

        var request = URLRequest(url: yourUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        request.setValue(SetupApp.retrieveToken, forHTTPHeaderField: "api_token")
        
        session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { [weak self](  data, res, error)  in

            if let statusCode = (res as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                DispatchQueue.main.async {
                    self?.statusFetchPrd = .error("Error: bad status response fetchPrd2: \(statusCode)")
//                    self?.messageErr = "Bad status: \(statusCode)"
                }
                completion(error)
            }
            
            guard let jsonData = data else {
                completion(ApiError.noData)
                print("CategoryesHomeModel: not products from session")
                return  }
            
//            prettyJSONString(jsonData: jsonData)

            DispatchQueue.main.async {
                do {
                    let tmpData = try JSONDecoder().decode(PrdFetch.self, from: jsonData)
                    self?.dataProducts = tmpData.products
                    self?.statusFetchPrd = .fetched
                } catch {
                    print("CategoryesHomeModel: failed to convert : \(error)")
//                    self?.messageErr = error.localizedDescription
                    self?.statusFetchPrd = .error("Error: bad decode data fetchPrd3: \(error.localizedDescription)")
                    completion(ApiError.noData)
                }
             }
        }
        
        task.resume()
    }
    

    
    func fetchProductsFromCat (parentId: String, completion: @escaping (Error?) -> () ) {
        guard let yourUrl = URL(string: SetupApp.urlPrdOfCatId + parentId) else {
            return
        }

        var request = URLRequest(url: yourUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        request.setValue(SetupApp.retrieveToken, forHTTPHeaderField: "api_token")
        

        session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { [weak self](  data, res, error)  in

            if let statusCode = (res as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                DispatchQueue.main.async {
                    self?.statusFetchPrd = .error("Error: bad status response fetchPrd4")
//                    self?.messageErr = "Bad status: \(statusCode)"
                }
                completion(error)
            }
            
            guard let jsonData = data else {
                completion(ApiError.noData)
                print("CategoryesHomeModel: not products from session")
                return  }
            
//            prettyJSONString(jsonData: jsonData)
            

            DispatchQueue.main.async {
                do {
                    let tmpData = try JSONDecoder().decode(PrdAndCatFetch.self, from: jsonData)
                    self?.dataProductsFromCat[tmpData.activecat] = tmpData.categories // = [tmpData]
                    self?.dataProductsFromCatFilter[tmpData.activecat] = self?.searchText != "" ? tmpData.categories.filter({ prd in
                        let searchStr  = self?.searchText != "" ? self?.searchText.localizedLowercase : ""
                        return prd.name.localizedLowercase.contains(searchStr!)
                    })
        :tmpData.categories
                    self?.statusFetchPrd = .fetched
//                    print(tmpData.activecat)
//                    print(tmpData.categories)
//                    if let cattt = tmpData.categories[tmpData.activecat] {
//                        prettyJSONString(jsonData: cattt)
//                    }
                    
                } catch {
                    print("CategoryesHomeModel: failed to convert : \(error.localizedDescription)")
//                    self?.messageErr = error.localizedDescription
                    self?.statusFetchPrd = .error("Error: not decode data fetchPrd5: \(error.localizedDescription)")
                    completion(ApiError.noData)
                }
             }
        }
        
        task.resume()
    }
}


let cat2Obj = {}

let cats77 = Category2(level: "0", pathID: "0", sortOrder: "0", statuss: "0", parentID: "0", categoryID: "0", name: "0")

//{
//      "level": "0",
//      "path_id": "67",
//      "sort_order": "3",
//      "statuss": "1",
//      "parent_id": "0",
//      "category_id": "67",
//      "name": "Японская кухня"
//  },
//{
//    "level": "0",
//    "path_id": "67",
//    "sort_order": "1",
//    "statuss": "1",
//    "parent_id": "67",
//    "category_id": "72",
//    "name": "Японская кухня-Роллы "
//},
//{
//    "level": "2",
//    "path_id": "61",
//    "sort_order": "6",
//    "statuss": "1",
//    "parent_id": "72",
//    "category_id": "61",
//    "name": "Японская кухня-Роллы -Роллы 6 шт"
//},

//struct CascadCat: Decodable,Hashable  {
//    var id: String
//    var proParent: String
//    var parent: String
//    var child: String
//
//    var level: String
//    var sort: String
//}



//struct Category  {
//    var prdID: [CatArray]
//}
//struct Category: Codable {
//    var level: String
//    var path_id: String
//    var sort_order: String
//    var statuss: String
//    var parent_id: String
//    var category_id: String
//    var name: String
//}

//        URLSession.shared.dataTask(with: yourUrl) { <#Data?#>, <#URLResponse?#>, <#Error?#> in
//            <#code#>
//        }.resume()


//    @available(iOS 15.0, *)
//    func asyncFetchPrd () async throws {
//        DispatchQueue.main.async {
//            self.statusFetchPrd = .fetching
//        }
//
//        let url = URL(string: SetupApp.urlProducts)!
//        let (data, response) = try await URLSession.shared.data(from: url)
//
//        guard let response = response as? HTTPURLResponse
//        else { throw ApiError.noResponse}
//
//        guard response.statusCode == 200
//        else{ throw ApiError.no200}
//
//        guard let decoded = try? JSONDecoder().decode(PrdFetch.self, from: data)
//        else {throw ApiError.noData}
//
//        DispatchQueue.main.async {
//            self.dataProducts = decoded.products
//            self.statusFetchPrd = .fetched
//        }
//    }
