//
//  StatusFetch.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine

enum StatusFetch: Comparable {
    case initional
    case fetching
    case fetched
    case error(String)
}

