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
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        return v
    }()
    lazy var stackView: UIView = {
     let v = UIView()
     return v
    }()
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor(displayP3Red: 127/255, green: 0, blue: 255/255, alpha: 1)
        lab.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
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
     self.backgroundColor = UIColor(displayP3Red: 239/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    func setupViews() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        
        containerView.addSubview(stackView)
        containerView.addSubview(button)
        stackView.addSubview(titleLabel)
        stackView.addSubview(addressLabel)
        stackView.addSubview(infoLabel)
        
        // set button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // set stackView constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
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
