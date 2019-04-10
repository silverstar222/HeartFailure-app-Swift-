//
//  EvaluationController.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/3/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//
//  Updated by EvrimGuler 4/5/2017, 5,17/2017

import UIKit
import SwiftyJSON
import NVActivityIndicatorView

class EvaluationCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var icon: UIImageView!
	
	var cellModel: EvaluationItem! {
		didSet{
			if cellModel != nil {
				setupCell()
			}
		}
	}
	
	func setupCell() {
		
		self.titleLabel?.textColor = CVDStyle.style.defaultFontColor
		self.titleLabel?.font = CVDStyle.style.currentFont
		
		if cellModel.form.status == .valued {
			self.icon?.image = UIImage(named: "FullIcon")
		} else if cellModel.form.status == .viewed {
			self.icon?.image = UIImage(named: "HalfIcon")
		} else if cellModel.form.status == .locked {
			self.icon?.image = UIImage(named: "lock")
		} else {
			self.icon?.image = nil
		}
	}
}


class EvaluationController: BaseTableController {
	
	weak var shortcutModel: EvaluationItem?
	override var createdID: String! { return "evaluation" }
	
	var activityIndicatorView: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
    
		
		// adding activity indicator in the background of TableViewer
		activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
		tableView.backgroundView = activityIndicatorView
		
		if self.navigationItem.leftBarButtonItem == nil {
			self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon"),
			  style: .plain, target: self, action: #selector(self.leftButtonAction(_:)))
		}
		
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setToolbarHidden(false, animated: false)
		
		checkAndUpdateLocks()
		//shortcutModel = DataManager.manager.evaluation!.heartSpecialistManagement
		self.tableView.reloadData()
		
	}
	
	override func viewWillDisappear(_ animated : Bool) {
		super.viewWillDisappear(animated)
		//DataManager.manager.saveCurrentEvaluation()
	}

	private func lockItems(array: [EvaluationItem]) {
		for item in array {
			item.form.status = .locked
		}
	}
	
	
	private func unlockItems(array: [EvaluationItem]) {
		for item in array {
			if item.form.status == .locked {
				item.form.status = .open
			}
		}
	}
	
	private func checkAndUpdateLocks() {
		let model = DataManager.manager.evaluation!
		model.completeScreen()
		
		unlockItems(array: [model.heartFailure, model.coronaryHeartDisease, model.atrialFibrillation, model.thromboembolicVKA, model.bradyarrthymiaSyncope,
			model.ventricularTachyarrthymias, model.riskFactors, model.laboratories, model.diagnostics])
		
		switch model.evaluationStatus {
		case .initialized:
			lockItems(array: [model.riskFactors, model.laboratories, model.diagnostics])
		case .bioCompleted:
			lockItems(array: [model.laboratories, model.diagnostics])
		case .riskCompleted:
			()
//			lockItems(array: [model.nsr])
//		case .diagnosticCompleted, .therapieCompleted:
//			()
		default:
			()
		}
		
		self.tableView.reloadData()
	}
	
	func backButtonConfirmAlert(){
		
		let alertTitle: String = "Do you want to leave this evaluation?".localized
		
		var actions = [CVDAction] ()
		
		actions.append(CVDAction(title: "Leave".localized, type: CVDActionType.cancel, handler: {
			self.navigationController?.popViewController(animated: true)
		}, short: true))
		
		
		actions.append(CVDAction(title: "Stay".localized, type: CVDActionType.cancel, handler: nil, short: true))
		
		
		self.showCVDAlert(title: alertTitle, message: nil, actions: actions)
	}
	
	
	// MARK: - Override Actions
	
	override func leftButtonAction(_ sender: UIBarButtonItem) {
		backButtonConfirmAlert()
	}
	
	override func rightButtonAction(_ sender: UIBarButtonItem) {
		_ = self.navigationController?.popViewController(animated: true)
	}
	
	override func bottomLeftButtonAction(_ sender: UIBarButtonItem) {
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		let controller = storyboard.instantiateViewController(withIdentifier: "StyleControllerID") as! StyleController
		controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		self.present(controller, animated: false) { () }
		styleController = controller
	}
	
	@IBAction func unwindToEvaluation(segue: UIStoryboardSegue) { /* return to this point after press list icon*/ }
	

	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataManager.manager.evaluation!.items.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationCell", for: indexPath) as! EvaluationCell
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		cell.titleLabel.text = itemModel.title
		cell.selectionStyle = .gray
		cell.cellModel = itemModel
		if indexPath.row == 0 {
			DataManager.manager.evaluation!.bio.form.status = .open
		}
		itemModel.processStatus()
		cell.setupCell()
		
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		
		let storyboard = UIStoryboard(name: "Medical", bundle: nil)
		
		switch indexPath.row {
		case 0:
			let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as! BioController
			controller.pageForm = itemModel
			self.navigationController?.pushViewController(controller, animated: true)
		default:
			
			if itemModel.form.status == .locked {
				showLockedScreenAlert(for: itemModel)
			} else {
				let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = itemModel
				self.navigationController?.pushViewController(controller, animated: true)
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let itemModel = DataManager.manager.evaluation!.items[indexPath.row]
		return itemModel.calculateCellHeight(forWidth: self.view.frame.size.width)
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		
		let view = UIView(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 300) )
		
		let button = UIButton(frame: CGRect(x: 50.0, y: 500.00, width: 300.00, height: 100.00))
		button.titleLabel?.text = "Compute"
		button.tintColor = UIColor.purple
		
		view.addSubview(button)
		
		return view
		
	}
	
	override func bottomRightButtonAction(_ sender: UIBarButtonItem) {
		
		let model = DataManager.manager.evaluation!
		
		let alertTitle = "Cannot open output screen".localized
		
		if DataManager.manager.evaluation!.evaluationStatus == .initialized {
			let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
			
			let storyboard = UIStoryboard(name: "Medical", bundle: nil)
			let alertDescription = "Please fill out the Bio form first".localized
			let handler1 = {() in
				if let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as? BioController {
					controller.pageForm = model.bio
					self.navigationController?.pushViewController(controller, animated: true)
				}
			}
			
			let navigateAction = CVDAction(title: "Open ".localized + model.bio.title, type: CVDActionType.done, handler: handler1, short: false)
			self.showCVDAlert(title: alertTitle, message: alertDescription, actions: [navigateAction, cancelAction])
			
		} else if DataManager.manager.evaluation!.evaluationStatus == .bioCompleted  {
			let alertDescription = "Please fill out the form \(model.riskFactors.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.riskFactors])
			
		} else {
			
			// whiteView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
			// whiteView?.backgroundColor = UIColor.white
			self.navigationController?.view.addSubview(whiteView!)
			
			/*
			let activity_view = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
			activity_view.center = self.view.center
			self.navigationController?.view.addSubview(activity_view)
			// activity_view.bringSubview(toFront: self.view)
			activity_view.startAnimating()
			*/
			
			let betterActivityView = NVActivityIndicatorView(frame: CGRect(x: (self.view.bounds.width/2 - 50), y:((self.navigationController?.view.bounds.height)!/2 - 50) , width:100, height:100) ) //, type: ..ballSpinFadeLoader , color: , padding: padding)
			betterActivityView.type = .ballPulse
			betterActivityView.color = UIColor(palette: ColorPalette.purple)!
			self.navigationController?.view.addSubview(betterActivityView)
			betterActivityView.startAnimating()
			
			
			// convert pah as false if we are not in the HMS section
			DataManager.manager.setPAHValue(pah: false)
			print(model)
      

			let client: RestClient = RestClient.client
			let inputs = DataManager.manager.getEvaluationItemsAsRequestInputsString()
			let evaluation = EvaluationRequest(isSave: false, age: Int((model.bio.age.storedValue?.value)!)!, isPAH:String(DataManager.manager.getPAHValue()), name: (model.bio.name.storedValue?.value) ?? "None", gender: model.bio.gender.female.isFilled ? 2:1, SBP: Int((model.bio.sbp.storedValue?.value)!)!, DBP: Int((model.bio.dbp.storedValue?.value)!)!, inputs: inputs)
			print("PAH:\t" + evaluation.isPAH + "\t Inputs:\t " + evaluation.inputs)
			client.computeEvaluation(evaluationRequest: evaluation, success: {
				(response) in print(response)
				
				let result = DataManager()
				result.setOutputEvaluation(response: response)
				
				let storyboard = UIStoryboard(name: "Medical", bundle: nil)
				let controller = storyboard.instantiateViewController(withIdentifier: "GeneratedControllerID") as! GeneratedController
				controller.pageForm = DataManager.manager.evaluation!.outputInMain
				controller.outputFlag = true
                
            self.navigationController?.pushViewController(controller, animated: false)
				// self.navigationController?.present(controller, animated: true, completion: nil)
				
				self.whiteView?.removeFromSuperview()
				
				// activity_view.stopAnimating()
				betterActivityView.stopAnimating()
				self.tableView.setNeedsLayout()
				self.tableView.layoutIfNeeded()
				self.tableView.estimatedRowHeight = 40
				self.tableView.rowHeight = UITableViewAutomaticDimension
				self.tableView.sizeToFit()
				self.tableView.reloadData()
				// add pah value false
				DataManager.manager.setPAHValue(pah: false)

				
			}, failure: {
				error in print(error)
				var actions = [CVDAction] ()
				var alertTitle: String?
				var alertDescription : String?
				actions.append(CVDAction(title: "OK".localized, type: CVDActionType.cancel, handler: nil, short: true))
				alertTitle = "Network Connection".localized
				alertDescription = "Check network connection before computing the evaluation.".localized
				self.whiteView?.removeFromSuperview()
				// activity_view.stopAnimating()
				betterActivityView.stopAnimating()
				self.showCVDAlert(title: alertTitle!, message: alertDescription, actions: actions)
				
			})


		}
		
		
	// Removed because of task CVD-220 [IOS] Unable to compute evaluation
	//	else if DataManager.manager.evaluation!.evaluationStatus == .riskCompleted {
	//	let alertDescription = "Please fill out the form \(model.diagnostics.title)"
	//	showAlert(title: alertTitle, description: alertDescription, models: [model.diagnostics])
	//
	//	} else if DataManager.manager.evaluation!.evaluationStatus == .diagnosticCompleted {
	//	let alertDescription = "Please fill out the form \(model.nsr.title)"
	//	showAlert(title: alertTitle, description: alertDescription, models: [model.nsr])
	//	
	//	}
		
		
	}
	
	func showAlert(title: String, description: String?, models: [EvaluationItem]) {

		var alertActions = [CVDAction] ()
		for item in models {
			let handler1 = createHandler(model: item, navigation: self.navigationController)
			let navigateAction = CVDAction(title: item.title, type: CVDActionType.done, handler: handler1, short: false)
			alertActions.append(navigateAction)
		}
		let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
		alertActions.append(cancelAction)
		
		self.showCVDAlert(title: title, message: description, actions: alertActions)

	}
	
	private func showLockedScreenAlert(for item: EvaluationItem) {
		
		let model = DataManager.manager.evaluation!
		
		let alertTitle = "Cannot open form \(item.title)"
		
		if DataManager.manager.evaluation!.evaluationStatus == .initialized {
			let storyboard = UIStoryboard(name: "Medical", bundle: nil)
			let alertDescription = "Please fill out the Bio form first.".localized
			let handler1 = {() in
				if let controller = storyboard.instantiateViewController(withIdentifier: "BioControllerID") as? BioController {
					controller.pageForm = model.bio
					self.navigationController?.pushViewController(controller, animated: true)
				}
			}
			let cancelAction = CVDAction(title: "Cancel".localized, type: CVDActionType.cancel, handler: nil, short: false)
			let navigateAction = CVDAction(title: "Open " + model.bio.title, type: CVDActionType.done, handler: handler1, short: false)
			self.showCVDAlert(title: alertTitle, message: alertDescription, actions: [navigateAction, cancelAction])
			
		}
        else if DataManager.manager.evaluation!.evaluationStatus == .bioCompleted  {
			
			let alertDescription = "Please fill out the form \(model.riskFactors.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.riskFactors])
		}
		
		else if DataManager.manager.evaluation!.evaluationStatus == .riskCompleted {
			let alertDescription = "Please fill out the form \(model.diagnostics.title)"
			showAlert(title: alertTitle, description: alertDescription, models: [model.diagnostics])
			
		}
		
	}
	
}
