//
//  TableViewCell.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
class TableViewCell: UITableViewCell {
    lazy var containerView: UIView = {
       let v = UIView()
        v.layer.shadowOpacity = 5
        v.layer.shadowColor = UIColor.lightGray.cgColor
        return v
    }()
    lazy var stackView: UIView = {
     let v = UIView()
     return v
    }()
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    lazy var addressLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    lazy var infoLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    lazy var button: UIButton = {
       let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "Chevron"), for: .normal)
        return butt
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "burritoCell")
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
     setupViews()
    }
    func setupViews() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -8).isActive = true
        
        containerView.addSubview(stackView)
        containerView.addSubview(button)
        stackView.addSubview(titleLabel)
        stackView.addSubview(addressLabel)
        stackView.addSubview(infoLabel)
        
        // set button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // set stackView constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        
        // set labels constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 0).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
}
