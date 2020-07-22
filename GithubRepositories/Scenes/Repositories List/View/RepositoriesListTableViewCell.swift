//
//  RepositoriesListTableViewCell.swift
//  GithubRepositories
//
//  Created by Junior Silva on 22/07/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoriesListTableViewCell: UITableViewCell {
    
    let primaryColor: UIColor = .black
    static let identifier = "RepositoriesListCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var repositoryView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var repositoryPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryOwnerLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 13)
        label.textColor = UIColor.brown
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryStarsImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "star")
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryStarsAmountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var repositoryForksImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "fork")
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var repositoryForksAmountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func configureCell(viewModel: RepositoriesList.ViewModel) {
        repositoryNameLabel.text = viewModel.name
        repositoryOwnerLabel.text = viewModel.ownerName
        repositoryStarsAmountLabel.text = "\(viewModel.stars)"
        repositoryForksAmountLabel.text = "\(viewModel.forks)"
        
        if let photoUrl = URL(string: viewModel.ownerAvatar) {
            repositoryPhotoImageView.sd_setImage(with: photoUrl)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        repositoryView.layer.shadowColor = UIColor.black.cgColor
    }
    
}

extension RepositoriesListTableViewCell: CustomViewDelegate {
    
    func setupViews() {
        contentView.addSubview(repositoryView)
        
        repositoryView.addSubview(repositoryPhotoImageView)
        repositoryView.addSubview(repositoryNameLabel)
        repositoryView.addSubview(repositoryOwnerLabel)
        repositoryView.addSubview(repositoryStarsImage)
        repositoryView.addSubview(repositoryStarsAmountLabel)
        repositoryView.addSubview(repositoryForksImage)
        repositoryView.addSubview(repositoryForksAmountLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([repositoryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
                                     repositoryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                                     repositoryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                                     repositoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)])
        
        NSLayoutConstraint.activate([repositoryPhotoImageView.topAnchor.constraint(equalTo: repositoryView.topAnchor, constant: 16),
                                     repositoryPhotoImageView.leadingAnchor.constraint(equalTo: repositoryView.leadingAnchor, constant: 16),
                                     repositoryPhotoImageView.widthAnchor.constraint(equalToConstant: 40),
                                     repositoryPhotoImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([repositoryNameLabel.topAnchor.constraint(equalTo: repositoryPhotoImageView.topAnchor, constant: 2),
                                     repositoryNameLabel.leadingAnchor.constraint(equalTo: repositoryPhotoImageView.trailingAnchor, constant: 8),
                                     repositoryNameLabel.trailingAnchor.constraint(equalTo: repositoryStarsAmountLabel.leadingAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([repositoryStarsImage.topAnchor.constraint(equalTo: repositoryNameLabel.topAnchor, constant: 0),
                                     repositoryStarsImage.leadingAnchor.constraint(equalTo: repositoryNameLabel.trailingAnchor, constant: 8),
                                     repositoryStarsImage.trailingAnchor.constraint(equalTo: repositoryStarsAmountLabel.leadingAnchor, constant: 8),
                                     repositoryStarsImage.bottomAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor),
                                     repositoryStarsImage.widthAnchor.constraint(equalToConstant: 15),
                                     repositoryStarsImage.heightAnchor.constraint(equalToConstant: 15)
        ])

        NSLayoutConstraint.activate([repositoryStarsAmountLabel.topAnchor.constraint(equalTo: repositoryStarsImage.topAnchor),
                                     repositoryStarsAmountLabel.trailingAnchor.constraint(equalTo: repositoryView.trailingAnchor, constant: -16),
                                     repositoryStarsAmountLabel.widthAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([repositoryOwnerLabel.topAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor, constant: 2),
                                     repositoryOwnerLabel.leadingAnchor.constraint(equalTo: repositoryNameLabel.leadingAnchor),
                                     repositoryOwnerLabel.trailingAnchor.constraint(equalTo: repositoryNameLabel.trailingAnchor),
                                     repositoryOwnerLabel.bottomAnchor.constraint(equalTo: repositoryView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([repositoryForksImage.topAnchor.constraint(equalTo: repositoryOwnerLabel.topAnchor, constant: 0),
                                     repositoryForksImage.leadingAnchor.constraint(equalTo: repositoryOwnerLabel.trailingAnchor, constant: 8),
                                     repositoryForksImage.trailingAnchor.constraint(equalTo: repositoryStarsImage.trailingAnchor),
                                     repositoryForksImage.widthAnchor.constraint(equalToConstant: 15),
                                     repositoryForksImage.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([repositoryForksAmountLabel.topAnchor.constraint(equalTo: repositoryForksImage.topAnchor, constant: 0),
                                     repositoryForksAmountLabel.trailingAnchor.constraint(equalTo: repositoryView.trailingAnchor, constant: -16), //????
                                     repositoryForksAmountLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
