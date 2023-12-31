//
//  MapView.swift
//  GeenDorstInLimburg
//
//  Created by Ivans Mihailovs on 28/06/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var locations: [Fountain]
    
    @State private var region = MKCoordinateRegion()
    @State private var tracking = MapUserTrackingMode.follow
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: $tracking,
            annotationItems: locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.locationCoordinate) {
                    LocationMapAnnotationView(location: location)
                        .scaleEffect(locations.first == location ? 1 : 0.7)
                        .shadow(radius: 10)
                }
            }
        )
        .onAppear {
            if let firstFountain = locations.first {
                setRegion(firstFountain.locationCoordinate)
            }
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locations: ModelData().fountains)
    }
}
