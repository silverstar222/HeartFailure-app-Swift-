//
//  ObjectLoader.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/8/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

class ObjectLoader: NSObject {
	
	@IBOutlet weak var object: AnyObject!
	
	static func objectFromXib(named name: String) -> AnyObject? {
		
		let loader = ObjectLoader()
		Bundle.main.loadNibNamed(name, owner: loader, options: nil)
		
		return loader.object
	}
}
