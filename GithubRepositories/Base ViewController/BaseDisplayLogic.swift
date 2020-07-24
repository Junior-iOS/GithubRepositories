//
//  BaseDisplayLogic.swift
//  GithubRepositories
//
//  Created by Junior Silva on 24/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import UIKit

protocol BaseDisplayLogic {
    func showError(title: String?, message: String?)
}

extension BaseDisplayLogic where Self: UIViewController {
    func showError(title: String?, message: String?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) { [weak self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            alertController.view.accessibilityIdentifier = "errorView"
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}
