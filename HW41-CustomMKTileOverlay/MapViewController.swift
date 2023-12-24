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

        /*
         template = "http://wmts.nlsc.gov.tw/wmts/PHOTO_MIX/default/GoogleMapsCompatible/{z}/{y}/{x}"
         template = "http://wmts.nlsc.gov.tw/wmts/PHOTO2/default/GoogleMapsCompatible/{z}/{y}/{x}"
         */

        let template: String       =  "http://wmts.nlsc.gov.tw/wmts/EMAP5_OPENDATA/default/GoogleMapsCompatible/{z}/{y}/{x}"
        // Define the template as overlay so that template could be add in to the MKTileOverlay
        let overlay: MKTileOverlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true                 // Let new layer could be cover the previous layer.
        mapView.addOverlay(overlay, level: .aboveRoads)    // Add the Overlay into the MKTileOverlay
        mapView.delegate = self                   // Add the mapView add the delegate.
        overlay.tileSize = CGSize(width: 300, height: 300)
        overlay.maximumZ = 9
        overlay.minimumZ = 1
    }
//
//    if overlay is MKPolyline {
//        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
//        polylineRenderer.strokeColor = UIColor.orange
//        polylineRenderer.lineWidth = 7.0
//        polylineRenderer.alpha = 1.0
//        return polylineRenderer
//    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let tileOverlay = overlay as? MKTileOverlay else {
            return MKOverlayRenderer()
        }
        return MKTileOverlayRenderer(tileOverlay: tileOverlay)
    }
}
