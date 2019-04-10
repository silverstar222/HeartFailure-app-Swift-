//
//  HexExtention.swift
//  CVDEvaluator
//
//  Created by SilverStar on 1/31/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

public enum ColorPalette: String {
	case black = "#black"
	case almostBlack = "#almostBlack"
	case erieBlack = "#erieBlack"
	case greyishBrown = "#greyishBrown"
	case subtitleGray = "#subtitleGray"
	case warmGrey = "#warmGrey"
	case lighterPurple = "#lighterPurple"
	case purple = "#purple"
	case red = "#red"
	case spanishGray = "#spanishGray"
	case grannySmith = "#grannySmith"
	case geraniumLake = "#geraniumLake"
	case canary = "#canary"
	case snow = "#snow"
	case lightPurple = "#lightPurple"
	case cosmicLatte = "#cosmicLatte"
	case hanPurple = "#hanPurple"
	case white = "#white"
	
	func hexString() -> String? {
		switch self {
		case .black:
			return "#000000"
		case .almostBlack:
			return "#030303"
		case .erieBlack:
			return "#1F1F22"
		case .greyishBrown:
			return "#4A4A4A"
		case .subtitleGray:
			return "#7B7B7B"
		case .warmGrey:
			return "#9B9B9B"
		case .lighterPurple:
			return "#9765F8"
		case .purple:
			return "#9876F1"
		case .red:
			return "#FF0000"
		case .spanishGray:
			return "#555555"
		case .grannySmith:
			return "#98E2A2"
		case .geraniumLake:
			return "#E83030"
		case .canary:
			return "#FEEC9E"
		case .snow:
			return "#FAFAFA"
		case .lightPurple:
			return "#eae4f2"
		case .cosmicLatte:
			return "#FFFCE7"
		case .hanPurple:
			return "#EAE4FC"
		case .white:
			return "#efe4fc"
		}
	}
}

extension UIColor {
	
	public convenience init?(palette: ColorPalette) {
		self.init(hexString: palette.hexString()!)
	}
	
	public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
		let r, g, b: CGFloat
		
		guard hexString.hasPrefix("#") else { return nil }
		
		let start = hexString.index(hexString.startIndex, offsetBy: 1)
		let hexColor = hexString.substring(from: start)
			
		if hexColor.characters.count == 6 {
			let scanner = Scanner(string: hexColor)
			var hexNumber: UInt64 = 0
			
			if scanner.scanHexInt64(&hexNumber) {
				r = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
				g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
				b = CGFloat((hexNumber & 0x0000ff)) / 255.0
				
				self.init(red: r, green: g, blue: b, alpha: alpha)
				return
			}
		}
		
		return nil
	}

	public convenience init?(name: String, alpha: CGFloat = 1.0) {
		
		if name.hasPrefix("#") {
			
			if let hexString = ColorPalette(rawValue: name)?.hexString() {
				self.init(hexString: hexString, alpha: alpha)
				return
			}
		}
		
		return nil
	}
}

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "From Extention")
	}
}
