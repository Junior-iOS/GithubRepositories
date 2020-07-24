//
//  RepositoriesListInteractorMock.swift
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

class RepositoriesListInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("RepositoriesListInteractorTest") {
            var sut: RepositoriesListInteractor!
            var mockWorker: RepositoriesListWorkerMock!
            var mockPresenter: RepositoriesListPresenterMock!
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = RepositoriesListWorkerMock()
                mockPresenter = RepositoriesListPresenterMock()
                
                sut = RepositoriesListInteractor(worker: mockWorker)
                sut.presenter = mockPresenter
            }
            
            describe("fetching and populating a list by requesting github data") {
               
                context("first request success") {
                    it("first page returns 30 results") {
                        mockWorker.resultType = .success
                        sut.loadRepositoriesList()
                        
                        expect(sut.repositories.count).to(equal(0))
                        expect(sut.currentPage).to(equal(1))
                        expect(mockPresenter.presentStopsActivityIndicatorCount).to(equal(1))
                        expect(mockPresenter.presentReloadTableViewCount).to(equal(1))
                    }
                    
                    it("fetching more results by infinite scrolling table") {
                        mockWorker.resultType = .success
                        sut.loadRepositoriesList()
                        
                        expect(sut.repositories.count).to(equal(0))
                        expect(sut.currentPage).to(equal(1))
                        expect(mockPresenter.presentStopsActivityIndicatorCount).to(equal(1))
                        expect(mockPresenter.presentReloadTableViewCount).to(equal(1))
                        
                        sut.requestNextPage(index: 20)
                        
                        expect(sut.repositories.count).to(equal(0))
                        expect(sut.currentPage).to(equal(1))
                        expect(mockPresenter.presentStopsActivityIndicatorCount).to(equal(1))
                        expect(mockPresenter.presentReloadTableViewCount).to(equal(1))
                    }
                    
                    it("did select a row and returns the 30 results") {
                        mockWorker.resultType = .success
                        sut.loadRepositoriesList()
                        sut.didSelectRow(at: 0)
                        
                        expect(sut.repositories.count).to(equal(0))
                        expect(sut.currentPage).to(equal(1))
                        expect(mockPresenter.presentStopsActivityIndicatorCount).to(equal(1))
                        expect(mockPresenter.presentReloadTableViewCount).to(equal(1))
                    }
                }
                
            }
            
            afterEach {
                sut = nil
                mockWorker = nil
                mockPresenter = nil
            }
        }
    }
    
}
