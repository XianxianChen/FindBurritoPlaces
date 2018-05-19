//
//  PlaceView.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlaceView: UIView {
lazy var mapView: MKMapView = {
    let map = MKMapView()
    map.showsUserLocation = true // default is false
    return map
}()
lazy var userTrackingButton: MKUserTrackingButton = {
    let button = MKUserTrackingButton()
    return button
}()
    lazy var nameLabel: UILabel = {
        let lab = UILabel()
        lab.backgroundColor = .white
        lab.layer.cornerRadius = 10
        lab.backgroundColor = UIColor(displayP3Red: 127/255, green: 0, blue: 255/255, alpha: 1)
        lab.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lab.textColor = .white
        lab.layer.masksToBounds = true
        lab.textAlignment = .center
        return lab
    }()

override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
}


private func commonInit() {
    setupViews()
    
}
    func setupViews() {
        
        addSubview(mapView)
        addSubview(nameLabel)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mapView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
}
