//
//  PullRequestsTableViewFooter.swift
//  GithubRepositories
//
//  Created by Junior Silva on 23/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

class PullRequestsTableViewFooter: UIView {

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
    
    lazy var emptyStateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "emptyState")
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var emptyStateLabel: UIView = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.text = "Nenhuma Request localizada! =("
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

}

extension PullRequestsTableViewFooter: CustomViewDelegate {
    func setupViews() {
        addSubview(contentView)
        contentView.addSubview(emptyStateImage)
        contentView.addSubview(emptyStateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
                                     contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                                     contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([emptyStateImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
                                     emptyStateImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     emptyStateImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     emptyStateImage.widthAnchor.constraint(equalToConstant: 300),
                                     emptyStateImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([emptyStateLabel.topAnchor.constraint(equalTo: emptyStateImage.bottomAnchor, constant: 8),
                                     emptyStateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
                                     emptyStateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
                                     emptyStateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupConfigurations() {
        UIView.animate(withDuration: 0.5, delay: 0.01 * 1, animations: {
            self.contentView.alpha = 1
        })
    }
}
