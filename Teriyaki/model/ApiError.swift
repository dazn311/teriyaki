//
//  ApiError.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation


enum ApiError: Error, CustomStringConvertible {
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

