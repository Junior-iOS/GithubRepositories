//
//  PullRequestsListPresenterMock.swift
//  GithubRepositoriesTests
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
@testable import GithubRepositories

class PullRequestsListPresenterMock: PullRequestsListPresentationLogic {
    
    var presentReloadTableCount = 0
    var presentStopActivityIndicatorCount = 0
    var presentEmptyStateCount = 0
    var presentRequestOwnerCount = 0
    var presentGithugPageForCount = 0
    
    func reloadTable() {
        presentReloadTableCount += 1
    }
    
    func stopActivityIndicator() {
        presentStopActivityIndicatorCount += 1
    }
    
    func presentEmptyState() {
        presentEmptyStateCount += 1
    }
    
    func presentRequestOwner(_ repo: Repository) {
        presentRequestOwnerCount += 1
    }
    
    func presentGithubPageFor(_ html: String) {
        presentRequestOwnerCount += 1
    }
    
}
