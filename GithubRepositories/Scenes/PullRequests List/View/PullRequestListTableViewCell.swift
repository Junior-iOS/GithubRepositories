//
//  PullRequestListTableViewCell.swift
//  GithubRepositories
//
//  Created by Junior Silva on 22/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class PullRequestListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier = "PullRequestCell"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.accessibilityHint = "Pull Requests"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next", size: 13)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension PullRequestListTableViewCell: CustomViewDelegate {
    
    func configure(_ model: PullRequestsList.ViewModel) {
        titleLabel.text = model.title
        bodyLabel.text = model.body
        userLabel.text = model.author
        dateLabel.text = model.date

        if let photoUrl = URL(string: model.authorImage) {
            userImageView.sd_setImage(with: photoUrl)
        }
    }

    func setupViews() {
        contentView.addSubview(containerView)

        containerView.addSubview(userImageView)
        containerView.addSubview(userLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(bodyLabel)
        containerView.addSubview(dateLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                                     containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                                     containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
        
        NSLayoutConstraint.activate([userImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
                                     userImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                                     userImageView.widthAnchor.constraint(equalToConstant: 40),
                                     userImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([userLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 4),
                                     userLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                                     userLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 4),
                                     titleLabel.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: userLabel.trailingAnchor)
        ])

        NSLayoutConstraint.activate([bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                                     bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                                     bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])

        NSLayoutConstraint.activate([dateLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 4),
                                     dateLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
                                     dateLabel.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
                                     dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6)
        ])
    }

    func setupConfigurations() {
        backgroundColor = .clear
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }

}
