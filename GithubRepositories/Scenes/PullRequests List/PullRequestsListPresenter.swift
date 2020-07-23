//
//  PullRequestsListPresenter.swift
//  GithubRepositories
//
//  Created by Junior Silva on 21/07/20.
//  Copyright (c) 2020 Junior Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit

protocol PullRequestsListPresentationLogic {
    func reloadTable()
    func stopActivityIndicator()
    func presentEmptyState()
    func presentRequestOwner(_ repo: Repository)
    func presentGithubPageFor(_ html: String)
}

class PullRequestsListPresenter: PullRequestsListPresentationLogic {
    weak var viewController: PullRequestsListDisplayLogic?
    
    func reloadTable() {
        viewController?.reloadTable()
    }
    
    func stopActivityIndicator() {
        viewController?.stopActivityIndicator()
    }
    
    func presentEmptyState() {
        viewController?.displayEmptyState()
    }
    
    func presentRequestOwner(_ repo: Repository) {
        viewController?.displayRequestOwner(repo)
    }
    
    func presentGithubPageFor(_ html: String) {
        viewController?.displayGithubPageFor(html)
    }
}
