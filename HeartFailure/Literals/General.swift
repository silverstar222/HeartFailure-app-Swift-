//
//  General.swift
//  CVDEvaluator
//
//  Created by SilverStar on 3/6/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

struct General {
	static let minPasswordLength = 3
	
	static let registration = "#type:#model| #title: Sign Up| #id: registration"
	
	static let separator1 = "#type:#separator| #title: Provide Personal Data | #id: separator"
	static let separator2 = "#type:#separator| #title: Provide Password | #id: separator"
	static let mail = 		"#id:mail|        #title:Email|    #type:#mail |  #placeholder:Enter your Email Address | #maxLength: 80 | #mandatory: 1"
	static let screenName = "#id:screenName | #title:Name |    #type: #textLeft|  #placeholder: Enter yor Name |      #maxLength: 80 | #mandatory: 1"
	static let password = 	"#id:password|  #title:Password|  #type: #password|  #placeholder: Enter Password |       #maxLength: 80 | #mandatory: 1"
	static let repeatPass = "#id:repeatPass|  #title:Repeat| #type: #password|  #placeholder: Repeat your Password |  #maxLength: 80 | #mandatory: 1"
	
	
	static let settings = "#type:#model| #title:Settings| #id: settings"

	static let about = 		   "#id:about|    #title:About|    #type:#disclosureSimple"
	static let separator3 =		"#type:#separator| #title: Profile | #id: separator"
	static let profile = 	   "#id:profile|  #title:Doctor's Profile|    #type:#disclosureSimple"
	static let separator4 =		"#type:#separator| #title: Terms and Conditions | #id: separator"
	static let privacyPolicy = "#id:privacyPolicy|        #title:Privacy Policy|    #type:#disclosureSimple"
	static let termsOfUse = 	"#id:termsOfUse | #title:Terms Of Use |    #type:#disclosureSimple"
	static let helpSupport =	"#id:helpSupport| #title:Help & Support|   #type:#disclosureSimple"
	static let separator5 =		"#type:#separator|#title: Log Out | #id: separator"
	static let logOut =			"#id:logOut|      #title:Log Out|   #type:#simple"
	
	static let helpSupportPage = "#type:#model| #title: Help & Support| #id: supportPage"
	
	
	static let medicalSupport =  "#id:medicalSupport|    #title:Write for Medical Support|    #type:#disclosureSimple"
	static let technicalSupport = "#id:technicalSupport| #title: Write for Technical Support |    #type:#disclosureSimple"

	
	static let doctorProfile = "#type:#model| #title: Profile| #id: doctorProfile"
	
	static let pSeparator1 = "#type:#separator| #title: Personal Data | #id: separator"
	static let pSeparator2 = "#type:#separator| #title: Password | #id: separator"
	static let pMail = 		"#id:mail|        #title:Email|    #type:#mail |  #placeholder:Enter your Email Address | #maxLength: 80 | #mandatory: 0"
	static let pScreenName = "#id:screenName | #title:Name |    #type: #textLeft|  #placeholder: Enter yor Name |      #maxLength: 80 | #mandatory: 0"
	static let pPassword = 	"#id:password|  #title:Password|  #type: #password|  #placeholder: Enter Password |       #maxLength: 80 | #mandatory: 0"
	static let pRepeatPass = "#id:repeatPass|  #title:Repeat| #type: #password|  #placeholder: Repeat your Password |  #maxLength: 80 | #mandatory: 0"

	
	
	static let aboutPage = "#type:#model| #title:AboutYep| #id: aboutPage"
	
	static let version = "#id:version | #title: Version | #subtitle: AppVersion | #type:#simple"
	static let appCell = "#id:appCell | #title: CVDEvaluator | #subtitle: Subtitle text| #type:#simple | #height: 140"
	static let rateApp = "#id:rateApp | #title: Rate App | #type:#simple"
	static let writeAReview = "#id:writeAReview | #title: Write A Review | #type:#simple"
	
	static let review = "#id:rateApp | #title: Rate App | #type:#simple"

	static let rateAppCell = "#id:rateAppCell | #title: Rate App | #type:#custom"



}
