//
//  PullRequestsListInteractorTest.swift
//  GithubRepositoriesTests
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import XCTest
import Quick
import Nimble
import PromiseKit
@testable import GithubRepositories

class PullRequestsListInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("PullRequestsListInteractorTest") {
            var sut: PullRequestsListInteractor!
            var mockPresenter: PullRequestsListPresenterMock!
            var mockWorker: PullRequestsListWorkerMock!
            
            let repository = Repository(name: "name", description: "description", stars: 0, forks: 0, owner: Owner(name: "name", avatar: "avatar"))
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = PullRequestsListWorkerMock()
                mockPresenter = PullRequestsListPresenterMock()
                
                sut = PullRequestsListInteractor(worker: mockWorker)
                sut.presenter = mockPresenter
            }
            
            describe("fetching and population a list by making a request") {
                
                context("Request success") {
                    it("Existing pull requests") {
                        mockWorker.resultType = .success
                        sut.repository = repository
                        sut.fetchPullRequestsList()
                        
                        expect(mockPresenter.presentStopActivityIndicatorCount).to(equal(1))
                        expect(mockPresenter.presentReloadTableCount).to(equal(1))
                    }
                    
                    it("Emptyt pull requests") {
                        mockWorker.resultType = .empty
                        sut.repository = repository
                        sut.fetchPullRequestsList()
                        
                        expect(mockPresenter.presentEmptyStateCount).to(equal(1))
                    }
                }
                
            }
        }
    }
    
}
