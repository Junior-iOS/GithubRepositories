//
//  JSONReaderHelper.swift
//  GithubRepositories
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation

class JSONReaderHelper {
    func read<T: Decodable>(filename: String) -> T? {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let result = data.parse(asObject: T.self, usingKeyDecodingStrategy: .convertFromSnakeCase)
                return result
            } catch {
                return nil
            }
        }
        return nil
    }
}
