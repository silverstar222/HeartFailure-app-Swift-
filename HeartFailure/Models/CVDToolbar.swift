//
//  CVDToolbar.swift
//  CVDEvaluator
//
//  Created by Ihor on 2/24/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

func setupFixedSpace(width: CGFloat) -> UIBarButtonItem {
	let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
	item.width = width
	return item
}

class CVDToolbar: UIToolbar {
	var barItems = [UIBarButtonItem]()
	
	override func sizeThatFits(_ size: CGSize) -> CGSize {
		
		var newSize: CGSize = super.sizeThatFits(size)
		newSize.height = 80  // there to set your toolbar height
		
		return newSize
	}
	
	func viewDidLoad() {
		self.barTintColor = UIColor.white
	}
	
	func setup (dict: Dictionary<String, Any>, target: UIViewController, actions: [Selector?]) {
		
		// super.init()
		
		var items = [UIBarButtonItem] ()
		let item = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		items.append(item)
		
		if let rightBottom = dict["rightBottom"] as? String {
			
			let button = UIButton(frame: CGRect(x: 0, y: 0, width: 210, height: 35) )
			button.setTitle(rightBottom, for: .normal)
			button.backgroundColor = UIColor(palette: ColorPalette.lighterPurple)
			button.layer.cornerRadius = 5
			// button.layer.borderWidth = 1
			button.addTarget(target, action: actions[0]!, for: .touchUpInside)
			
			let rightBarItem = UIBarButtonItem(customView: button)
			
			/// let rightBarItem = UIBarButtonItem(title: rightBottom, style: .plain, target: target, action: actions[0])
			
			items.append(rightBarItem)
			
			if let rightBottom1 = dict["rightBottom1"] as? String {
				
				let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 210, height: 35) )
				button1.setTitle(rightBottom1, for: .normal)
				button.backgroundColor = UIColor(palette: ColorPalette.lighterPurple)
				button.layer.cornerRadius = 5
				// button.layer.borderWidth = 1
				button.addTarget(target, action: actions[1]!, for: .touchUpInside)
				
				let rightBarItem1 = UIBarButtonItem(customView: button)
				
				// let rightBarItem1 = UIBarButtonItem(title: rightBottom1, style: .plain, target: target, action: actions[1])
				items.insert(rightBarItem1, at: 2)
			}
		}
		
		let item1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		items.append(item1)
		
		self.isTranslucent = false
		self.barTintColor = UIColor.white
		self.barItems = items
		
	}
	
	
	func setup  (dict: Dictionary<String, Any>, target: UIViewController, action: Selector?) {
		
		// super.init()
		
		var items = [UIBarButtonItem] ()
		let item = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		items.append(item)
		
		if let rightBottom = dict["rightBottom"] as? String {
			
			let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 25) )
			button.setTitle(rightBottom, for: .normal)
			// button.
			
			let rightBarItem = UIBarButtonItem(customView: button)
			
			// let rightBarItem = UIBarButtonItem(title: rightBottom, style: .plain, target: target, action: action)
			
			items.append(rightBarItem)
			
		}
		
		let item1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		items.append(item1)
		
		self.isTranslucent = false
		self.barTintColor = UIColor.white
		self.barItems = items
	}
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		
		
	}
	
	override func draw(_ rect: CGRect) {
		self.backgroundColor = UIColor.white
	}
	
}

