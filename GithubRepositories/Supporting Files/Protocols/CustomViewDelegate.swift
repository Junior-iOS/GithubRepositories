//
//  CustomViewDelegate.swift
//  GithubRepositories
//
//  Created by Junior Silva on 22/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation

protocol CustomViewDelegate {
    func setupViews()
    func setupConstraints()
    func setupConfigurations()
    func setup()
}

extension CustomViewDelegate {
    func setup() {
        setupViews()
        setupConstraints()
        setupConfigurations()
    }
}
