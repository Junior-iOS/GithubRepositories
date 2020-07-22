//
//  NetworkError.swift
//  GithubRepositories
//
//  Created by Junior Silva on 21/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

enum NetworkError: Error {
    case badUrl
    case unauthorized
    case forbidden
    case notFound
    case mappingError
    case emptyResponseDataError
    case unknownError
}
