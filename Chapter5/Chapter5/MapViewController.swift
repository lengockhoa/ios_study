//
//  ViewController.swift
//  Chapter4
//
//  Created by Le NK on 4/11/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!
    
    override func loadView(){
        // Create a mapview
        mapView = MKMapView()
        // Set it as the view of the view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
       
        /*
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        let margin = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margin.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        */
        
        
        let exTopConstraint = NSLayoutConstraint(item: segmentedControl, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 8)
        let exLeadingConstraint = NSLayoutConstraint(item: segmentedControl, attribute: .leading, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .leading, multiplier: 1, constant: 0)
        let exTrailingConstraint = NSLayoutConstraint(item: segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .trailing, multiplier: 1, constant: 0)
        
        exTopConstraint.isActive = true
        exLeadingConstraint.isActive = true
        exTrailingConstraint.isActive = true
        
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }


}

