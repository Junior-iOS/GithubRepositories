//
//  RepositoriesListWorkerMock.swift
//  GithubRepositoriesTests
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import PromiseKit
@testable import GithubRepositories

enum ResultTypes {
    case success
    case error
    case empty
}

class RepositoriesListWorkerMock: RepositoriesListNetworkLogic {
    
    var resultType: ResultTypes = .success
    
    func searchRepositoriesList(page: Int) -> Promise<RepositoriesList.Response> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: RepositoriesList.Response = helper.read(filename: "repositories-stars-page-\(page)") {
                return Promise { seal in
                    seal.fulfill(response)
                }
            }
            
        case .error:
            return Promise { seal in
                seal.reject(NetworkError.notFound)
            }
            
        default:
            return Promise { seal in
                seal.reject(NetworkError.mappingError)
            }
        }
        
        return Promise { seal in
            seal.reject(NetworkError.mappingError)
        }
    }
    
}
