//
//  PullRequestsListRouter.swift
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

@objc protocol PullRequestsListRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PullRequestsListDataPassing {
    var dataStore: PullRequestsListDataStore? { get }
}

class PullRequestsListRouter: NSObject, PullRequestsListRoutingLogic, PullRequestsListDataPassing {
    weak var viewController: PullRequestsListViewController?
    var dataStore: PullRequestsListDataStore?

    // MARK: Routing

    //func routeToSomewhere(segue: UIStoryboardSegue?) {
    //  if let segue = segue {
    //      let destinationVC = segue.destination as! SomewhereViewController
    //      var destinationDS = destinationVC.router!.dataStore!
    //      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //      let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //      var destinationDS = destinationVC.router!.dataStore!
    //      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //      navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    //func navigateToSomewhere(source: PullRequestsListViewController, destination: SomewhereViewController) {
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: PullRequestsListDataStore, destination: inout SomewhereDataStore) {
    //  destination.name = source.name
    //}
}
