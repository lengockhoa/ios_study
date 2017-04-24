//
//  ViewController.swift
//  Chapter4
//
//  Created by Le NK on 4/11/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var mapView: MKMapView!
    
    override func loadView(){
        // Create a mapview
        mapView = MKMapView()
        // Set it as the view of the view controller
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybred map view")
        let segmentedControl = UISegmentedControl(items: [standardString,hybridString,satelliteString])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
       
        let zoomButton = UIButton()
        zoomButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        zoomButton.backgroundColor = UIColor.blue
        view.addSubview(zoomButton)
        
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
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        zoomButton.addTarget(self, action: #selector(MapViewController.zoomLocation), for: .touchUpInside)
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    func zoomLocation(){
        let homeLocation = CLLocation(latitude: self.mapView.userLocation.coordinate.latitude, longitude: self.mapView.userLocation.coordinate.longitude)
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(homeLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }


}

