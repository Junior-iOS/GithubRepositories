//
//  BaseNavigationController.swift
//  GithubRepositories
//
//  Created by Junior Silva on 21/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

public class BaseNavigationController: UINavigationController {
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBarAppearence = UINavigationBarAppearance()
        navigationBarAppearence.shadowColor = .clear
        navigationBar.scrollEdgeAppearance = navigationBarAppearence
        navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
}
