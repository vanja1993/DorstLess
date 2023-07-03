//
//  DrinkingWaterFountain.swift
//  GeenDorstInLimburg
//
//  Created by Ivans Mihailovs on 30/06/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Fountain: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var zipCode: String
    var isFavorite: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
