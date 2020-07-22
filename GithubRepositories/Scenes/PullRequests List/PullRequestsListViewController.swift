//
//  PullRequestsListViewController.swift
//  GithubRepositories
//
//  Created by Junior Silva on 21/07/20.
//  Copyright (c) 2020 Junior Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PullRequestsListDisplayLogic: class {
    
}

class PullRequestsListViewController: UIViewController {
    
    var interactor: PullRequestsListBusinessLogic?
    var router: (NSObjectProtocol & PullRequestsListRoutingLogic & PullRequestsListDataPassing)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = PullRequestsListInteractor()
        let presenter = PullRequestsListPresenter()
        let router = PullRequestsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchPullRequestsList()
    }

}

extension PullRequestsListViewController: PullRequestsListDisplayLogic {

    

}
