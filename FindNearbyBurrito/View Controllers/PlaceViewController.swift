//
//  ViewController.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {

    let containerView = ContainerView()
    var places = [BurritoPlace]() {
        didSet {
            containerView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(containerView)
        self.navigationItem.title = "Burrito Places"
        containerView.tableView.delegate = self
        containerView.tableView.dataSource = self
        // ask user for permition to access location
        let _ = LocationService.manager.checkForLocationServices()
        
        loadPlaces()
        

    }

    func loadPlaces() {
        let lat = UserDefaultsHelper.manager.getLatitude()
        let lng = UserDefaultsHelper.manager.getLongitude()
        print()
        print(lat, lng)
        BurritoPlaceAPIClient.manager.getBurritoPlaces(lat: lat, lng: lng, completionHandler: {self.places = $0}, errorHandler: {_ in
            print("error getting burrito places")})
    }

}
extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "burritoCell", for: indexPath) as! TableViewCell
        let place = places[indexPath.row]
       cell.titleLabel.text = place.name
        cell.addressLabel.text = place.vicinity
        var priceLev = ""
        if let price = place.priceLevel {
        for _ in 0...price {
            priceLev = priceLev + "$"
        }
        cell.infoLabel.text = priceLev
        }
        return cell
    }
}
extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlace = places[indexPath.row]
        self.navigationController?.pushViewController(MapViewController(burritoPlace: selectedPlace), animated: true)
    }
}
