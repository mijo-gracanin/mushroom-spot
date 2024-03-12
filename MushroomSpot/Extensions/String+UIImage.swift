//
//  String+UIImage.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 11.03.2024..
//

import SwiftUI

extension String {
    func getUiImage() throws -> UIImage {
        let base64 = String(self.replacing("data:image/jpeg;base64,", with: "") )
        guard let imageData = Data(base64Encoded: base64),
              let image = UIImage(data: imageData) else {
            throw MushroomSpotError.unexpectedNil
        }
        return image
    }
}
