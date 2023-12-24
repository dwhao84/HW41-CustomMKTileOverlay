//
//  MapViewController.swift
//  HW41-CustomMKTileOverlay
//
//  Created by Dawei Hao on 2023/12/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let template: String       =  "http://tile.openstreetmap.org/{z}/{x}/{y}.png"
        // Define the template as overlay so that template could be add in to the MKTileOverlay
        let overlay: MKTileOverlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true                 // Let new layer could be cover the previous layer.
        mapView.addOverlay(overlay, level: .aboveLabels)    // Add the Overlay into the MKTileOverlay
        mapView.delegate = self                             // Add the mapView add the delegate.
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let tileOverlay = overlay as? MKTileOverlay else {
            return MKOverlayRenderer()
        }
        return MKTileOverlayRenderer(tileOverlay: tileOverlay)
    }
}
