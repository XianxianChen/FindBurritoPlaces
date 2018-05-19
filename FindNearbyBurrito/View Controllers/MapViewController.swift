//
//  MapViewController.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let placeView = PlaceView()
    var burritoPlace: BurritoPlace!
    //var annotation: MKAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(placeView)
        configureAnnotation()
        setupInfoLabel()
        self.placeView.mapView.delegate = self
        let _ = LocationService.manager.checkForLocationServices()
    }
    // a burritoPlace is required when initialize the ViewController
    init (burritoPlace: BurritoPlace) {
        super.init(nibName: nil, bundle: nil)
        self.burritoPlace = burritoPlace
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func setupInfoLabel() {
        self.navigationItem.title = self.burritoPlace.name
        var priceLev = ""
        if let price = burritoPlace.priceLevel {
            for _ in 0...price {
                priceLev = priceLev + "$"
            }
            let address = self.burritoPlace.vicinity.components(separatedBy: ",")
            
            self.placeView.nameLabel.text =  address[0] + " " + priceLev
        }
    }
    func configureAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(self.burritoPlace.geometry.location.lat, self.burritoPlace.geometry.location.lng)
        annotation.title = self.burritoPlace.name
        
        // adding annotation to mapView - update UI
        DispatchQueue.main.async {
            self.placeView.mapView.addAnnotation(annotation)
            self.placeView.mapView.showAnnotations([annotation], animated: true)
        }
    }


}
extension MapViewController: MKMapViewDelegate {
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //show user blue default dot
        // if the place is user current location, return nil
        if annotation is MKUserLocation {
            return nil
        }
        // setup annotation view for map
        //fully customize the marker annotation view
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "burritoAnnotationView")
        if annotationView == nil {
            // create annotationView
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "burritoAnnotationView") // The most efficient way to provide the content for an annotation view is to set its image property. The annotation view sizes itself automatically to the image you specify and draws that image for its contents
          // while MKMarkerAnnotationView always comes with a default red Balloon.
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView?.image = #imageLiteral(resourceName: "Pin") 
            
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}









