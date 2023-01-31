//
//  prettyJSONString.swift
//  Teriyaki
//
//  Created by dazn311 on 27.01.2023.
//

import Foundation
import Combine

func prettyJSONString(jsonData: Data) {
    if let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers),
       let jsonData2 = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
        print(String(decoding: jsonData2, as: UTF8.self))
    } else {
        print("json data malformed")
    }
}

