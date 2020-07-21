//
//  RepositoriesListViewController.swift
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

protocol RepositoriesListDisplayLogic: class {
    func displaySomething(viewModel: RepositoriesList.Something.ViewModel)
}

class RepositoriesListViewController: UIViewController {
    // MARK: Clean Swift
    var interactor: RepositoriesListBusinessLogic?
    var router: (NSObjectProtocol & RepositoriesListRoutingLogic & RepositoriesListDataPassing)?

    // MARK: IBOutlets


    // MARK: Setup

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Boom")
    }

    private func setup() {
        let viewController = self
        let interactor = RepositoriesListInteractor()
        let presenter = RepositoriesListPresenter()
        let router = RepositoriesListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: Do something

    func doSomething() {
        let request = RepositoriesList.Something.Request()
        interactor?.doSomething(request: request)
    }
}

extension RepositoriesListViewController: RepositoriesListDisplayLogic {

    func displaySomething(viewModel: RepositoriesList.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }

}
