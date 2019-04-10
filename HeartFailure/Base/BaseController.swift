//
//  BaseController.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/2/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

class BaseController: UIViewController, BuildAppearance, EvaluationEditing {
	

	
	@IBOutlet weak var accessoryBar: UINavigationBar!
	@IBOutlet weak var segmentedControl: UISegmentedControl?
	
	var activeField: UITextField?
	var activeModel: EvaluationItem?
	var isCancelled = false
	
	var modelChain = [EvaluationItem]()
	var pageForm = EvaluationItem()
	
	var createdID: String! { return nil }
	var generatedID: String? { return nil }
	
	weak var styleController: StyleController?
	
	var whiteView: UIView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupAppearance()
		evaluateResponderChain()
		
		if pageForm.form.status == .open {
			pageForm.form.status = .viewed
		}
		
		whiteView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
		whiteView?.backgroundColor = UIColor.white
		whiteView?.isHidden = true
	}
	
	
	func evaluateResponderChain() {
		
		var models = [EvaluationItem]()
		
		for (index, item) in pageForm.items.enumerated() {
			
			if [.textRight, .textLeft, .integerRight, .integerLeft, .decimalRight, .decimalLeft, .mail, .password].contains(where: { $0 == item.form.itemType }) {
				item.modelIndexPath = IndexPath(row: index, section: 0)
				models.append(item)
			}
		}
		
		self.modelChain = models
		self.segmentedControl?.setEnabled(modelChain.count > 1, forSegmentAt: 0)
		self.segmentedControl?.setEnabled(modelChain.count > 1, forSegmentAt: 1)
	}
	
	
	func setupFixedSpace(width: CGFloat) -> UIBarButtonItem {
		let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
		item.width = width
		return item
	}
	
	
	func setupAppearance() {
		
		self.navigationController?.navigationBar.isTranslucent = true
		self.view.backgroundColor = UIColor(palette: ColorPalette.snow)
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:.plain, target:nil, action:nil)
		
		self.accessoryBar?.tintColor = UIColor(palette: ColorPalette.warmGrey)
		
		let applyStyle = { (style: ControllerStyle) -> Void in
			guard let appearanceInfo = style.styleInfo() else { return }
			
			let topSelectors: [Selector?] = [#selector(self.rightButtonAction(_:)), #selector(self.leftButtonAction(_:))]
			let cvdTopbar = CVDTopbar(dict: appearanceInfo, target: self, actions: topSelectors)
			
			if nil != cvdTopbar.title {
				self.navigationItem.title = cvdTopbar.title
			}
			
			if nil != cvdTopbar.tintColor {
				self.navigationController?.navigationBar.tintColor = cvdTopbar.tintColor
			}
			
			if nil != cvdTopbar.rightBarItem {
				self.navigationItem.rightBarButtonItem = cvdTopbar.rightBarItem
			}
			
			if nil != cvdTopbar.leftBarItem {
				self.navigationItem.leftBarButtonItem = cvdTopbar.leftBarItem
			}
			
			let bottomSelectors: [Selector?] = [#selector(self.bottomRightButtonAction(_:)),
				#selector(self.bottomRightButtonAction1(_:)), #selector(self.bottomLeftButtonAction(_:)), nil]
			
			let cvdToolbar = CVDToolbar()
			cvdToolbar.setup(dict: appearanceInfo, target: self, actions: bottomSelectors)
			cvdToolbar.barTintColor = .white
			cvdToolbar.sizeToFit()
			self.toolbarItems = cvdToolbar.barItems
		}
		
		// get  User Interface Info
		if  let styleID = self.createdID , let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
		if let styleID = self.generatedID, let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
	}
	
	func setupAppearanceTable() {
		
		//self.clearsSelectionOnViewWillAppear = true
		self.navigationController?.navigationBar.isTranslucent = true
		self.view.backgroundColor = UIColor(palette: ColorPalette.snow)
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
		
		self.accessoryBar?.tintColor = UIColor(palette: ColorPalette.warmGrey)
		
		//self.navigationItem.title
		
		let applyStyle = { (style: ControllerStyle) -> Void in
			guard let appearanceInfo = style.styleInfo() else { return }
			
			let topSelectors: [Selector?] = [#selector(self.rightButtonAction(_:)), #selector(self.leftButtonAction(_:)), #selector(self.bottomLeftButtonAction(_:))]
			let cvdTopbar = CVDTopbar(dict: appearanceInfo, target: self, actions: topSelectors)
			
			if nil != cvdTopbar.title {
				self.navigationItem.title = cvdTopbar.title
			}
			
			if nil != cvdTopbar.tintColor {
				self.navigationController?.navigationBar.tintColor = cvdTopbar.tintColor
			}
			
			if nil != cvdTopbar.rightBarItem {
				self.navigationItem.rightBarButtonItems = [cvdTopbar.rightBarItem!, cvdTopbar.rightTextBarItem!]
			}
			
			if nil != cvdTopbar.leftBarItem {
				self.navigationItem.leftBarButtonItem = cvdTopbar.leftBarItem
			}
			
			let bottomSelectors: [Selector?] = [#selector(self.bottomRightButtonAction(_:)),
			                                    #selector(self.bottomRightButtonAction1(_:)), #selector(self.bottomLeftButtonAction(_:)), nil]
			
			let cvdToolbar = CVDToolbar()
			cvdToolbar.setup(dict: appearanceInfo, target: self, actions: bottomSelectors)
			cvdToolbar.barTintColor = .white
			cvdToolbar.sizeToFit()
			self.toolbarItems = cvdToolbar.barItems
			
		}
		
		// get  User Interface Info
		if let styleID = self.generatedID, let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		} else if  let styleID = self.createdID , let style = ControllerStyle(rawValue: styleID) {
			applyStyle(style)
		}
	}
	
	
	func showCVDAlert(title: String, message: String?, actions: [CVDAction]) {
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "CVDAlertControllerID") as! CVDAlertController
		controller.titleMessage = title
		controller.descriptionMessage = message
		controller.addActions(actions)
		
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false)
	}
	
	// MARK: - Actions to override
	
	// MARK: - Actions
	
	
	
	@IBAction func moveToItem(_ sender: UISegmentedControl) {
		guard nil != activeField else { return }
		if self.presentedViewController != nil {
			self.dismiss(animated: false, completion: nil)
		}
	
	}
	
	
	@IBAction func doneAction(_ sender: AnyObject) {
	}
	
	func rightButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func leftButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func bottomRightButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func bottomRightButtonAction1(_ sender: UIBarButtonItem) { /* tooverride */}
	func bottomLeftButtonAction(_ sender: UIBarButtonItem) { /* tooverride */}
	func bottomLeftButtonAction1(_ sender: UIBarButtonItem) { /* tooverride */}
	
	
	//MARK: - EvaluationEditing protocol
	
	func evaluationFieldDidBeginEditing(_ textField: UITextField, model: EvaluationItem) {
		self.activeField = textField
		// from tablw view
		self.activeModel = model
		pageForm.form.status = .valued
	}
	
	func keyboardReturnDidPress(model: EvaluationItem) {
	
	}

	func evaluationValueDidChange(model: EvaluationItem) {
		pageForm.form.status = .valued
	}
	
	func evaluationValueDidEnter(_ textField: UITextField, model: EvaluationItem) {
		
	}
	
	
	
	func evaluationValueDidNotValidate(model: EvaluationItem, message: String, description: String?) {
		
		guard !isCancelled else { return }
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		let controller = storyboard.instantiateViewController(withIdentifier: "MessageControllerID") as! MessageController
		controller.message = message
		controller.descriptionMessage = description
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { controller.showMessage() }
	}
	
	func evaluationFieldTogglesDropDown() {
		// 
	}
}
