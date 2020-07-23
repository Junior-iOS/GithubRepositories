//
//  PullRequestsTableViewHeader.swift
//  GithubRepositories
//
//  Created by Junior Silva on 22/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

class PullRequestsTableViewHeader: UIView {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.isAccessibilityElement = true
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont(name: "Avenir Next", size: 26)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

}

extension PullRequestsTableViewHeader: CustomViewDelegate {
    
    func setupViews() {
        addSubview(contentView)
        contentView.addSubview(typeLabel)
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
                                     contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                                     contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
                
        NSLayoutConstraint.activate([typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([separatorView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16),
                                     separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
                                     separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupConfigurations() {
        UIView.animate(withDuration: 0.5, delay: 0.01 * 1, animations: {
            self.contentView.alpha = 1
        })
    }
    
}
