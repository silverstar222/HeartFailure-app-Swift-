//
//  CVDAction.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/22/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

enum CVDActionType {
	case cancel
	case done
	case destruct
	case navigate
}

typealias CVDHandler = () -> Void

struct CVDAction {
	
	let title: String
	let handler: CVDHandler?
	let actionType: CVDActionType
	var isShort: Bool
	
	init (title: String, type: CVDActionType, handler: CVDHandler?, short: Bool = true) {
		self.title = title
		self.actionType = type
		self.handler = handler
		self.isShort = short
	}
}
