//
//  DemoView.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/8/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

class DemoView: UIView {

	@IBOutlet weak var demoImageView: UIImageView!
	@IBOutlet weak var demoLabel: UILabel!
	
	static func extract(name: String, description: String) -> DemoView? {
		guard let view = ObjectLoader.objectFromXib(named: "DemoView") as? DemoView else { return nil }
		view.demoLabel.text = description
		view.demoImageView.image = UIImage(named: name)
		
		return view

	}
}
