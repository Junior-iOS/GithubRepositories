//
//  Data+Extension.swift
//  GithubRepositories
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation

extension Data {
    func parse<T: Decodable>(asObject model: T.Type, usingKeyDecodingStrategy strategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = strategy
            let resp = try decoder.decode(T.self, from: self)
            return resp
        } catch {
            print("Error: \(#function) - \(error)")
            return nil
        }
    }
}
