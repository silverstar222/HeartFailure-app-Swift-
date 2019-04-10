//
//  BuildAppearance.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/9/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import Foundation
import UIKit

protocol BuildAppearance {
	
	var pageForm: EvaluationItem {get set}
	
	var createdID: String!  {get}
	var generatedID: String?  {get}
	
	func setupAppearance()
	
	func rightButtonAction(_ sender: UIBarButtonItem)
	func leftButtonAction(_ sender: UIBarButtonItem)
	
	func bottomRightButtonAction(_ sender: UIBarButtonItem)
	func bottomRightButtonAction1(_ sender: UIBarButtonItem)
	func bottomLeftButtonAction(_ sender: UIBarButtonItem)
	func bottomLeftButtonAction1(_ sender: UIBarButtonItem)
}

protocol FontChanging {
	func userDidChoose(font: UIFont, withSize size: CGFloat)
}
