//
//  ContainerView.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
class ContainerView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(TableViewCell.self, forCellReuseIdentifier: "burritoCell")
        return tv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: super.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: super.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
    }
}
