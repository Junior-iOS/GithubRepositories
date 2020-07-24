//
//  PullRequestsListWorkerMock.swift
//  GithubRepositoriesTests
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import PromiseKit
@testable import GithubRepositories

class PullRequestsListWorkerMock: PullRequestsListNetworkLogic {
    
    var resultType: ResultTypes = .success
    
    func searchPullRequestsList(_ repository: Repository) -> Promise<[PullRequestsList.RequestList]> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: [PullRequestsList.RequestList] = helper.read(filename: "pull-requests") {
                return Promise { seal in
                    seal.fulfill(response)
                }
            }
            
        case .error:
            return Promise { seal in
                seal.reject(NetworkError.notFound)
            }
            
        case .empty:
            let response: [PullRequestsList.RequestList] = []
            return Promise { seal in
                seal.fulfill(response)
            }
        }
        
        return Promise { seal in
            seal.reject(NetworkError.mappingError)
        }
    }
    
}
