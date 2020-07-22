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
    func reloadData()
    func stopsActivityIndicator()
    func displayPullRequestsList()
}

class RepositoriesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var interactor: RepositoriesListBusinessLogic?
    var router: (NSObjectProtocol & RepositoriesListRoutingLogic & RepositoriesListDataPassing)?

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
        setupTableView()
        interactor?.loadRepositoriesList(1)
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
    
    private func setupTableView() {
        tableView.prefetchDataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        //tableView.refreshControl = customRefreshControl
        tableView.register(RepositoriesListTableViewCell.self, forCellReuseIdentifier: RepositoriesListTableViewCell.identifier)
    }
    
}

extension RepositoriesListViewController: RepositoriesListDisplayLogic {

    func reloadData() {
        tableView.reloadData()
    }
    
    func stopsActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func displayPullRequestsList() {
        router?.routeToPullRequestsList()
    }

}

extension RepositoriesListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            interactor?.requestNextPage(index: indexPath.row)
        }
    }
}

extension RepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectRow(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesListTableViewCell.identifier) as? RepositoriesListTableViewCell,
            let viewModel = interactor?.cellForRow(at: indexPath.row) else { return UITableViewCell() }
        
        cell.configureCell(viewModel: viewModel)
        //cell.accessibilityLabel = .repositoryRow
        
        return cell
    }
    
}
