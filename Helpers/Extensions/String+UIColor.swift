//
//  String+UIColor.swift
//  SimpleHelpers
//
//  Created by David Martin on 1/9/18.
//  Copyright © 2018 dm Apps. All rights reserved.
//

import Foundation
import UIKit

extension String {
	var hexColor: UIColor {
		let hex = self.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		let a, r, g, b: UInt32
		var int = UInt32()
		Scanner(string: hex).scanHexInt32(&int)
		
		switch hex.count {
		case 3: // RGB (12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB (32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			return UIColor.clear
		}
		return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
	}
}
