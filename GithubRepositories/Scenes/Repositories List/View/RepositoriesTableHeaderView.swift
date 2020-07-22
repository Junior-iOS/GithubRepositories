//
//  RepositoriesTableHeaderView.swift
//  GithubRepositories
//
//  Created by Junior Silva on 21/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import UIKit

class RepositoriesTableHeaderView: UIView {
    
    init() {
        super.init(frame: .zero)
        //setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        
        //label.text = .starred
        //label.font = .rounded(fontSize: 26, weight: .heavy)
        //label.textColor = .heavyGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryLabel: UILabel = {
        let label = UILabel()
        
        //label.text = .repositories
        //label.font = .rounded(fontSize: 26, weight: .regular)
        //label.textColor = .heavyGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var listView: UIView = {
        let view = UIView()
        
        //view.backgroundColor = .veryLightGray
        view.layer.borderWidth = 3
        //view.layer.borderColor = UIColor.veryLightGray!.cgColor
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 19
        view.clipsToBounds = true
        //view.accessibilityLabel = .repositoryFilterButton
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var listImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "list.bullet")
        //imageView.tintColor = .heavyGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        
        //view.backgroundColor = .veryLightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        //listView.layer.borderColor = UIColor.veryLightGray!.cgColor
    }
    
}
