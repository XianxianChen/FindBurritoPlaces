//
//  MapViewController.swift
//  FindNearbyBurrito
//
//  Created by C4Q on 5/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    let placeView = PlaceView()
    var burritoPlace: BurritoPlace!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(placeView)
        // Do any additional setup after loading the view.
    }
    init (burritoPlace: BurritoPlace) {
        super.init(nibName: nil, bundle: nil)
        self.burritoPlace = burritoPlace
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
