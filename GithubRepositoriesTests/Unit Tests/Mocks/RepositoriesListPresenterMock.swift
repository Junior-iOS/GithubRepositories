//
//  RepositoriesListPresenterMock.swift
//  GithubRepositoriesTests
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
@testable import GithubRepositories

class RepositoriesListPresenterMock: RepositoriesListPresentationLogic {
    
    var presentReloadTableViewCount = 0
    var presentStopsActivityIndicatorCount = 0
    var presentPullRequestLitCount = 0
    
    func reloadTableView() {
        presentReloadTableViewCount += 1
    }
    
    func stopsActivityIndicator() {
        presentStopsActivityIndicatorCount += 1
    }
    
    func presentPullRequestsList() {
        presentPullRequestLitCount += 1
    }
    
}
