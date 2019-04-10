//
//  LoginController.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/6/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//
//  Updated by EvrimGuler on 4/5/2017

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var panelView: UIView!
	@IBOutlet weak var splashView: UIView!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var registerButton: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var logoSheet: UIImageView!
	
	
	static let loginSegueID = "loginSegueID"
	static let registerSegueID = "registerSegueID"
	static let resetSegueID = "resetSegueID"
	
	override func viewDidLoad() {
		super.viewDidLoad()
    
    nameField.isHidden = true
    passwordField.isHidden = true
    loginButton.isEnabled = false
    registerButton.isEnabled = false
    resetButton.isEnabled = false
		
		let (imageUp, imageDown) = resizibleImage(named: "red", highlighted: "red pressed")
		loginButton.setBackgroundImage(imageUp, for: UIControlState.normal)
		loginButton.setBackgroundImage(imageDown, for: UIControlState.highlighted)
		
		let (registerUp, registerDown) = resizibleImage(named: "outline", highlighted: "outline")
		registerButton.setBackgroundImage(registerUp, for: UIControlState.normal)
		registerButton.setBackgroundImage(registerDown, for: UIControlState.highlighted)
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.hideKeyboard))
		self.view.addGestureRecognizer(tapRecognizer)
		
		
		//TODO this login should be adapted to rest of this class
    
		
//		let client: RestClient = RestClient.client
//		client.login(username: "demo", password: "demo1", success:{(responseObject) in
//			print(responseObject)
//			client.retrieveSavedEvaluations(success: {(responseObject) in
//				print(responseObject)
//			}, failure: {(error) in
//				print(error)
//			})
//		}, failure: {(error) in
//			print(error)
//		})
    
    
//		client.register(registerRequest: RegisterRequest(name: "kemal", username: "kemal92@gmail.com", password: "test1234", confirmPassword: "test1234"), success: { (response) in
//			print(response)
//		}, failure: { (error) in
//			print(error)
//		})

	}
  
  
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		NotificationCenter.default.addObserver(self, selector: #selector(LoginController.keyboardWillShow(_:)),
			name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(LoginController.keyboardWillBeHidden(_:)),
			name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    
    perform(#selector(singIN), with: self, afterDelay: 1)
		
		let defaults = UserDefaults.standard
		if let userName = defaults.string(forKey: "loginName") {
			nameField.text = userName
			passwordField.text = ""
		}
		
//		if self.view.frame.size.height > 570.0 {
//			logoSheet?.removeFromSuperview()
//		}
    
    
	}
	
	
	// MARK: - Methods
	
	func hideKeyboard() {
		self.nameField.resignFirstResponder()
		self.passwordField.resignFirstResponder()
	}
	
	
	func keyboardWillShow(_ notification: Notification) {
		guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
		
		let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
		var currentRect = self.view.frame
		
		currentRect.size.height -= keyboardSize.height
		if !currentRect.contains(panelView.frame) {
			scrollView.scrollRectToVisible(panelView.frame, animated: false)
		}
	}
	
	
	func keyboardWillBeHidden(_ notification: Notification) {
		let contentInsets = UIEdgeInsets.zero
		scrollView.contentInset = contentInsets
		scrollView.scrollIndicatorInsets = contentInsets
	}
	
  
  func  singIN () {
    //self.hideKeyboard()
//    guard let name = nameField.text, !name.isEmpty ,
//      let pass = passwordField.text, !pass.isEmpty else {
//        let alertController = UIAlertController(title: "The username or password field is empty".localized,
//                                                message: nil, preferredStyle: .alert)
//        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) -> Void in
//          self.passwordField.text = ""
//        }  )
//        alertController.addAction(defaultAction)
//        present(alertController, animated: true, completion: nil)
//        
//        return
//    }
    
    let name = "demo"
    let pass = "demo1"
    
    let activity_view = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    activity_view.center = self.view.center
    self.view.addSubview(activity_view)
    activity_view.bringSubview(toFront: self.view)
    activity_view.startAnimating()
    
    let completionHandler = { [unowned self] (data : String?, error: NSError?) -> Void in
      
      activity_view.stopAnimating()
      guard error == nil else {
        print("Server returned error \(String(describing: error))")
        
        let alertController = UIAlertController(title: "Cannot Login".localized,
                                                message: error!.userInfo["message"] as? String, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) -> Void in
          self.passwordField.text = ""
        }  )
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        return
      }
      
      if data == "success" {
        UserDefaults.standard.set(name, forKey: "loginName")
        let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
        let destination = medicalStoriboard.instantiateInitialViewController()
        
        UIApplication.shared.keyWindow?.rootViewController = destination
      }
    }
    
    
    let client: RestClient = RestClient.client
    
    
    client.login(username: name, password: pass, success: { (json) in
      print(json)
      DispatchQueue.main.async {
        DataManager.manager.signIn(with: name, password: pass, completionHandler: completionHandler)
        let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
        let destination = medicalStoriboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = destination
      }
    }) { (error) in
      
    }
    

    
   
  }

	// MARK: - Actions
	
	@IBAction func signInAction(_ sender: AnyObject) {
    singIN()
  }
	
	@IBAction func skipLoginPressed(_ sender: Any) {
		UserDefaults.standard.set("test user", forKey: "loginName")
		let medicalStoriboard = UIStoryboard(name: "Medical", bundle: nil)
		let destination = medicalStoriboard.instantiateInitialViewController()
		UIApplication.shared.keyWindow?.rootViewController = destination
	}
	
	@IBAction func registerAction(_ sender: AnyObject) {
		hideKeyboard()
		self.performSegue(withIdentifier: LoginController.registerSegueID, sender: nil)
	}
	
	
	@IBAction func resetAction(_ sender: AnyObject) {
		hideKeyboard()
		self.performSegue(withIdentifier: LoginController.resetSegueID, sender: nil)
	}
	
	
	// MARK: - UITextField delegates
	
	func textFieldDidEndEditing(_ textField: UITextField) {
	}
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		hideKeyboard()
		signInAction(self)
		
		return true
	}
}
