//
//  Presentation.swift
//  CVDEvaluator
//
//  Created by SilverStar on 2/10/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit


func identifierBy(literal: String) -> String {
	let components: [String] = literal.components(separatedBy: "|")
	
	var identifier: String = "unsupported"
	
	for strItem in components {
		
		let strTrimmed = strItem.trimmingCharacters(in: .whitespacesAndNewlines)
		guard strTrimmed.hasPrefix("#") else { continue }
		
		let components: [String] = strTrimmed.components(separatedBy: ":")
		guard components.count == 2 else { continue }
		
		let trimmedKeyComponent = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
		guard let key = PresentationKey(rawValue: trimmedKeyComponent) else { continue }
		
		let storedValue = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
		
		switch key {
		case .id:
			identifier = storedValue
		default:
			()
		}
	}
	return identifier
}


enum PresentationKey: String {
	case id = "#id"
	case title = "#title"
	case subtitle = "#subtitle"
	case type = "#type"
	case height = "#height"
	case placeholder = "#placeholder"
	case min = "#min"
	case max = "#max"
	case maxLength = "#maxLength"
	case value = "#value"
	case group = "#group"
	case mandatory = "#mandatory"
	case selected = "#selected"
	case text = "#text"
	case alert = "#alert"
	case dependsOn = "#dependsOn"
	case dependMin = "#dependMin"
	case dependMax = "#dependMax"
	case subItems = "#subItems"
}


struct Presentation {
	
	// Global:
	static let separator = "#type:#separator| #title: untitled| #id: separator"
	static let evaluation = "#type:#model| #title: Evaluation| #id: evaluation"
	
	// Evaluation: https://zpl.io/Z1WoemX
	static let bio = 			"#id:bio |      #title:Bio |  #type:#disclosureVieved | #mandatory: 1"
	static let symptoms = 	"#id:symptoms|  #title:Symptoms|  #type:#disclosureVieved"
	
	static let reviewOfSystem = 	"#id:reviewOfSystem|  #title:Review of Systems|  #type:#disclosureVieved"
	
	static let physicalExam = "#id:currentPastCVProfile| #title:Physical Exam| #type:#disclosureVieved"
	static let cvProfile = 	"#id:cvProfile| #title:Current/Past CV Profile| #type:#disclosureVieved"
	static let riskFactors = 	"#id:riskFactors| #title:Major CV Risk Factors| #type:#disclosureVieved"
	static let surgicalRisk = 	"#id:surgicalRisk| #title:Noncardiac Surgical Risk| #type:#disclosureVieved"
	static let laboratories = "#id:laboratories| #title:Laboratories| #type:#disclosureVieved"
	static let diagnostics = "#id:diagnostics| #title:Diagnostics| #type:#disclosureVieved"
	static let hsr = "#id:nsr| #title:Current Therapies| #type:#disclosureVieved"
	
	static let poMeds = "#id:poMeds| #title:PO Meds| #type:#disclosureWeather"
	static let inHospital = "#id:inHospital| #title:In Hospital/IV Therapies| #type:#disclosureWeather"
	static let heartSpecialistManagement = "#id:heartSpecialistManagement| #title:Heart Specialist Management | #type:#disclosureVieved"
	static let outputInMain = "#id:outputInMain| #title:Results | #type:#disclosureVieved"
	
	
	
	// Evaluation -> Bio: https://zpl.io/27Yx0I
	static let name = 		"#id:name|      #title:Name|      #type:#textLeft |  #placeholder:  | #maxLength: 50 | #mandatory: 1"
	static let age = 			"#id:age |      #title:Age|       #type:#integerLeft|   #min:20|  #max:100| #placeholder:  | #mandatory: 1"
	//static let gender = 		"#id:gender|    #title:Gender*|    #type:#disclosureSimple | #height: 60"
	static let gender = 		"#id:gender|    #title:Gender*|    #type:#disclosureSimpleExpandable | #height: 60"
	
	static let height = 		"#id:txtheight|    #title:Height|    #type:#integerLeft|   #min:100|  #max:220| #placeholder: "
	static let weight = 		"#id:weight|    #title:Weight|    #type:#integerLeft|   #min:40|  #max:400| #placeholder: Weight/Kg"
	static let heartRate = 	"#id:HR| #title:Heart Rate| #type:#integerLeft| #min:30|  #max:300| #placeholder: "
	static let bioSBP = 		"#id:sbp|       #title:SBP|  #type:#decimalLeft| #min:60|  #max:300| #placeholder: SBP mmHg | #mandatory: 1"
	static let bioDBP = 		"#id:dbp|       #title:DBP|  #type:#decimalLeft| #min:30|  #max:160| #placeholder: DBP mmHg | #mandatory: 1"
	static let bioOrthostaticSBP = 		"#id:orthostaticSBP|       #title:Orthostatic SBP|  #type:#decimalLeft| #min:0|  #max:240| #placeholder: DBP mmHg"
	static let bioOrthostaticSymptoms = "#id:chkSymptomatic|    #title:Orthostatic Symptoms | #type:#check"
	static let bioWaistCirc = "#id:txtwaist | #title:Waist Circ. |  #type:#decimalLeft| #min:20|  #max:60| #placeholder: DBP mmHg "
	static let bioAA = "#id:chkAAsianCode  |  #title:AA |    #type:#check"
	static let bioPregnancy = "#id:chkpreg |    #title:Pregnancy |    #type:#check"
	//static let bioO2sat = "#id:txtO2sat | #title:O2sat% |  #type:#decimalLeft| #min:50|  #max:100| #placeholder:  "
	
	
	
	/*
	// Evaluation -> Bio: https://zpl.io/27Yx0I
	static let name = 		"#id:name|      #title:Name|      #type:#textLeft |  #placeholder:Enter Patient Name | #maxLength: 50 | #mandatory: 1"
	static let age = 			"#id:age |      #title:Age|       #type:#integerLeft|   #min:20|  #max:100| #placeholder: Enter Patient age | #mandatory: 1"
	static let gender = 		"#id:gender|    #title:Gender*|    #type:#disclosureSimple | #height: 60"
	static let height = 		"#id:txtheight|    #title:Height|    #type:#integerLeft|   #min:100|  #max:220| #placeholder: Enter height in cm"
	static let weight = 		"#id:weight|    #title:Weight|    #type:#integerLeft|   #min:40|  #max:400| #placeholder: Enter weight in kilos"
	static let heartRate = 	"#id:HR| #title:Heart Rate| #type:#integerLeft| #min:30|  #max:300| #placeholder: Enter the Heart Rate"
	static let bioSBP = 		"#id:sbp|       #title:SBP|  #type:#decimalLeft| #min:60|  #max:300| #placeholder: Enter SBP value | #mandatory: 1"
	static let bioDBP = 		"#id:dbp|       #title:DBP|  #type:#decimalLeft| #min:30|  #max:160| #placeholder: Enter DBP value | #mandatory: 1"
	static let bioOrthostaticSBP = 		"#id:orthostaticSBP|       #title:Orthostatic SBP|  #type:#decimalLeft| #min:0|  #max:240| #placeholder: DBP mmHg value"
	static let bioOrthostaticSymptoms = "#id:chkSymptomatic|    #title:Orthostatic Symptoms | #type:#check"
	static let bioWaistCirc = "#id:txtwaist | #title:Waist Circ. |  #type:#decimalLeft| #min:20|  #max:60| #placeholder: Enter DBP value "
	static let bioAA = "#id:chkAAsianCode  |  #title:AA |    #type:#check"
	static let bioPregnancy = "#id:chkpreg |    #title:Pregnancy |    #type:#check"
	static let bioO2sat = "#id:txtO2sat | #title:O2sat% |  #type:#decimalLeft| #min:50|  #max:100| #placeholder: Value "
	*/
	
	
	// Evaluation -> Bio -> Gender: https://zpl.io/Z16UrC4
	static let male = 		"#id:male|    #title:Male|    #type:#radio | #group: (male, female)"
	static let female = 		"#id:female|    #title:Female|    #type:#radio | #group: (male, female)"
	
	static let maleInHMS = 		"#id:maleInHMS|    #title:Male|    #type:#radio | #group: (maleInHMS, femaleInHMS)"
	static let femaleInHMS = 		"#id:femaleInHMS|    #title:Female|    #type:#radio | #group: (maleInHMS, femaleInHMS)"
	
	
	// Evaluation -> Symptoms: https://zpl.io/gVaLh
	static let dyspnea = "#id: chkDyspnea | #title: Dyspnea | #type: #disclosureControl"
	static let chestPain = "#id: chkCP | #title: Chest Pain | #type: #disclosureControl"
	static let syncope = "#id: chkTestSyncope | #title: Syncope/Presyncope | #type: #disclosureControl"
	static let edemaInSymptoms = "#id:chkedema | #title:Edema | #type:#disclosureControl"
	static let weakness = "id:chkmalaise | #title:Weakness | #type:#disclosureControlExpandable"
	static let palpitationsInSymptoms = "#id:chkp| #title:Palpitations| #type:#disclosureControl"
	static let abdominalPain = "#id:chkplaceholderone | #title:Abdominal Pain | #type:#disclosureControl"
	static let shock = "#id:chkss | #title:Shock | #type:#disclosureControl"
	
	// Evaluation -> Symptoms -> Dyspnea: https://zpl.io/Z1jN2eH
	static let outpatient = "#id:chkD5| #title:Ambulatory / Outpatient|    #type:#check|"
	static let emergencyRoom = "#id:chkD4| #title:Escalating / Emergency Room|    #type:#check"
	
	static let inHospitalLabel = "#id:inHospitalLabel|    #title:Decompensated/Hospitalized|    #type:#disclosureControlExpandable"
	
	static let day1 = "#id:chkD1|    #title:Day 1|    #type:#check"
	static let day2 = "#id:chkD2|    #title:Day 2|    #type:#check"
	static let day3 = "#id:chkD3|    #title:Day 3|    #type:#check"
	
	static let pleaseSelectOneLabel = "#id:pleaseSelectOneLabel|    #title:Please select one|    #type:#label "
	
	static let chronicHFWithKnownEtiology = "#id:chkHFPLVF|    #title:Chronic HF with Known Etiology|    #type:#radio | #group: (chronicHFWithKnownEtiology, newOnsetSuspectedHF) | #selected: 1"
	static let newOnsetSuspectedHF = "#id:chknewHF|    #title:New Onset/Suspected HF|    #type:#radio | #group: (chronicHFWithKnownEtiology, newOnsetSuspectedHF) | #selected: 1"
	
	static let dyspneaOnExertionNotAtRest = "#id:chkDOE|    #title:Dyspnea on Exertion|    #type:#disclosureControlExpandable"
	static let dyspneaAtRestOrphopnea = "#id:chkdysp|    #title:Dyspnea at Rest|    #type:#check"
	static let weightGain = "#id:chkWeight|    #title:Weight Gain|    #type:#check"
	static let hfDiagnosisDurationPerWeek = "#id:txtdur|    #title:Duration / Week | #type:#integerRight|   #min:0|  #max:999|  #placeholder: "
	
	static let previousHFHospitalization = "#id:chkfoutput|    #title:Previous HF Hospitalization|    #type:#check"
	static let spicd = "#id:chkICD |    #title:S/P AICD|    #type:#check"
	static let lvef = "#id:txtCHF | #title:LVEF | #type:#integerRight|   #min:1|  #max:80|  #placeholder: "
	
	static let nyhaClass = "#id:nyhaClass|#title:Heart Failure Stage |#type:#disclosureSimple"
	
	// Evaluation -> Symptoms -> Dyspnea -> Dyspnea on Exertion https://zpl.io/xTF0A
	
	static let strenousExertion = "#id:chkclass1|    #title:Strenous Exertion|    #type:#check"
	static let moreThanDailyRoutine = "#id:chkclass2|    #title:More than Daily Routine|    #type:#check"
	static let dailyRoutineMinimalActivities = "#id:chkclass3|    #title:Daily Routine/Minimal Activities |  #type:#check"
	
	// Evaluation -> Symptoms -> Dyspnea -> NYHA Class https://zpl.io/Z1p4tKO
	static let atHighRiskOfHF = "#id:chkA|    #title:At High Risk for HF, but without Structural Heart Disease or Symptoms of HF NYHA/CCVS Class 0|    #type:#check"
	static let structuralHeartDeseaseNoSymptoms = "#id:chkB| #title:Structural Heart Disease, but without signs/symptoms of HF|    #type:#check"
	static let structuralHeartDeseaseSymptoms = "#id:chkC| #title:Structural Heart Diseasewith prior or current symptoms of HF|    #type:#check"
	static let refactoryHFInterventions = "#id:chkD | #title:Refactory HF Requiring Specialized Interventions | #type:#disclosureControl"
	static let NYHACCSVClass1 = "#id:chkNYHA1 | #title:NYHA/CCSV Class1 | #type:#check"
	static let NYHACCSVClass2 = "#id:chkNYHA2 | #title:NYHA/CCSV Class2 | #type:#check"
	static let NYHACCSVClass3 = "#id:chkNYHA3 | #title:NYHA/CCSV Class3 | #type:#check"
	static let NYHACCSVClass4 = "#id:chkNYHA4 | #title:NYHA/CCSV Class4 | #type:#check"
	
	// Evaluation -> Symptoms -> Dyspnea -> NYHA Class -> Refactory HF Requiring Specialized Interventions https://zpl.io/Z1LXV1U
	static let calculateHFSS = "#id:CalculateHFSS | #title:Calculate HFSS, enter NAmeq, VO₂ max, Heart Rate, and ECG QRS Duration | #type:#label"
	static let noSignificantComorbidities = "#id:chkcom | #title:No Significant Comorbidities |#type:#disclosureWeather | #alert: Refer to Heart Failure Specialist for Management"
	static let vo2maxkg = "#id:vo2maxkg | #title:VO₂ max kg/ | #type:#decimalRight | #min:6 | #max:40 | #placeholder: "
	
	// Evaluation -> Symptoms -> Chest Pain https://zpl.io/xUvxt
	static let emergencyRoomInChestPain = "#id:chkER | #title:Emergency Room | #type:#disclosureControl"
	static let typicalAnginaNewInChestPain = "#id:chkTA | #title:Typical Angina  | #type:#disclosureControlExpandable"
	static let probablyAnginaNewInChestPain = "#id:chkPA | #title:Probable Angina | #type:#disclosureControlExpandable"
	static let undeterminedCPNewInChestPain = "#id:chkNCP | #title:Undetermined Chest Pain | #type:#disclosureControl"
	static let unableToExerciseInChestPain = "#id:chkunable | #title:Unable To Exercise | #type:#check"
	static let lastingLabelInChestPaint = "#id: chkLastingLabel|    #title: Lasting|    #type:#disclosureControl"
	
	// Evaluation -> Symptoms -> Chest Pain -> Emergency Room https://zpl.io/ZwjY5c
	static let more2TypicalOrProbableAngina = "#id:chkangina | #title:≥ 2 Typical or Probable Angina | #type:#check"
	static let typicalOrProbableAnginaMore20Min = "#id:chkangina20 | #title:Typical Or Probable Angina > 20 Min | #type:#check"
	static let ASAUseInPast1Week = "#id:chkASAuse | #title:ASA Use in Past 1 Week | #type:#check"
	static let positiveTroponin = "#id:chkpositivetrop | #title:Positive Troponin | #type:#disclosureControlExpandable"
	
	// Evaluation -> Symptoms -> Chest Pain -> Emergency Room -> Positive Troponin
	static let blntrop2 = "#id:chktrop2 | #title:Troponin X ≥ 3 Above Normal | #type:#check"
	static let blntrop3 = "#id:chktrop3 | #title:Troponin X 1-3 Above Normal | #type:#check"
	
	
	//	Evaluation -> Symptoms -> Chest Pain -> Typical Angina  https://zpl.io/ZwjYrj
	static let escalatingInFrequency = "#id:chkescTA| #title:Escalating in Frequency, Duration or Severity | #type:#check"
	
	//	Evaluation -> Symptoms -> Chest Pain -> Probale Angina https://zpl.io/ZwjYrj
	static let probableEscalatingInFrequency = "#id:chkescTA| #title:Escalating in Frequency, Duration or Severity | #type:#check"
	
	
	//	Evaluation -> Symptoms -> Chest Pain -> Undetermined CP, New https://zpl.io/25x7ix
	static let sideSemithorax = "#id:chkpleur | #title:Side/Hemithorax | #type:#disclosureControl"
	static let intercostalCP = "#id:chkbreath | #title:Intercostal CP | #type:#disclosureControl"
	static let сentralPrecordialCP = "#id:chkPrecordial| #title:Central/Precordial CP | #type:#disclosureControl"
	
	// Evaluation -> Symptoms -> Chest Pain -> Undetermined CP, New -> Details
	static let qualityLabel = "#id: qualityLabel|    #title: Quality|    #type:#label"
	static let blnCPSharp = "#id: chkCPSharp|    #title: Sharp|    #type:#check"
	static let blnCPPressure = "#id: chkCPPressure|    #title: Pressure|    #type:#check"
	static let blnCPTightness = "#id: chkCPTightness|    #title: Tightness|    #type:#check"
	static let blnCPSoreness = "#id: chkCPSoreness|    #title: Soreness|    #type:#check"
	static let blnTearing = "#id: chktearing|    #title: Heaviness|    #type:#check"
	
	static let aggravatedByLabel = "#id: aggravatedByLabel|    #title: Aggravated By|    #type:#label"
	static let blnCPLying = "#id: chkCPLying|    #title: Lying|    #type:#check"
	static let blnCPBreathing = "#id: chkCPBreathing|    #title: Breathing|    #type:#check"
	static let blnCPCoughing = "#id: chkCPCoughing|    #title: Coughing|    #type:#check"
	static let blnCPExertion = "#id: chkCPExertion|    #title: Exertion|    #type:#check"
	static let blnCPPalpation = "#id: chkCPPalpation|    #title: Palpation|    #type:#check"
	
	static let relievedByLabel = "#id: relievedByLabel|    #title: Relieved By|    #type:#label"
	static let blnCPNTG = "#id: chkCPNTG|    #title: NTG|    #type:#check"
	static let blnCPRest = "#id: chkCPRest|    #title: Rest|    #type:#check"
	static let blnCPSitting = "#id: chkCPSitting|    #title: Sitting|    #type:#check"
	static let blnCPlyingside = "#id: chkCPlyingside|    #title: Lying On-Side|    #type:#check"
	static let blnCPAnalgesics = "#id: chkCPAnalgesics|    #title: Analgesics|    #type:#check"
	
	static let radiationLabel = "#id: radiationLabel|    #title: Radiation|    #type:#label"
	static let blnCPJaw = "#id: chkCPJaw|    #title: Jaw|    #type:#check"
	static let blnCPBack = "#id: chkCPBack|    #title: Back|    #type:#check"
	static let blnCPArm = "#id: chkCPArm|    #title: Arm|    #type:#check"
	
	static let associatedWithLabel = "#id: associatedWithLabel|    #title: Associated With|    #type:#label"
	static let blnCPDyspnea = "#id: chkCPDyspnea|    #title: Dyspnea|    #type:#check"
	static let blnCPNausea = "#id: chkCPNausea|    #title: Nausea|    #type:#check"
	static let blnCPDiaph = "#id: chkCPDiaph|    #title: SICD|    #type:#check"
	static let blnCPFaint = "#id: chkCPFaint|    #title: Faintness|    #type:#check"
	static let blnCPPalpitations = "id: chkCPPalpitations | #title: Palpitations| #type: #check"
	
	// Evaluation -> Symptoms -> Lasting
	static let lastingLabel = "#id: lastingLabel|    #title: Lasting|    #type:#label"
	static let blnCPseconds = "#id: chkCPseconds|    #title: Seconds|    #type:#check"
	static let blnCPminutes = "#id: chkCPminutes|    #title: Minutes|    #type:#check"
	static let blnCPhours = "#id: chkCPhours|    #title: Hours|    #type:#check"
	static let blnCPconstant = "#id: chkCPconstant|    #title: Constant|    #type:#check"
	
	//	Evaluation -> Symptoms -> Syncope/Presyncope https://zpl.io/14EXv7
	static let circumstanceLabel = "#id:circumstanceLabel | #title:Circumstance | #type:#label"
	static let uprightPositionPostExertion = "#id:chkSynStanding | #title:Upright Position, Post Exertion, Duration or Severity | #type:#check"
	static let suddenNoiseOrEmotion = "#id:chkSynOther | #title:Sudden noise or emotion | #type:#check"
	static let neckMovementManipulation = "#id:chkSynneck | #title:Neck movement, Manipulation | #type:#check"
	static let exertional = "#id:chkSynProSitting | #title:Exertional | #type:#check"
	static let sporadic = "id:chkSynSporadic| #title: Sporadic| #type:#check"
	
	static let prodromalSymptoms = "#id:prodromalSymptoms | #title:Prodromal Symptoms | #type:#label"
	static let nausea = "#id:chkSynNausea | #title:Nausea | #type:#check"
	static let dizziness = "#id:chkSynDizziness | #title:Dizziness | #type:#check"
	static let palpitations = "#id:chkSynPalpitations | #title:Palpitations | #type:#check"
	static let chestPainInProdromalSymptoms = "#id:chkSynProCP | #title:Chest Pain | #type:#check"
	static let aura = "#id:chkSynaura | #title:Aura | #type:#check"
	
	static let syncopeDurationDuringSyncope = "#id:txtSynMin | #title:Syncope Duration/During Syncope | #type:#label | #height:65"
	// MARK: minutes seconds custom cell
	static let durationMinutesSeconds = "#id:txtSynSec | #title: Duration | #type:#minutesSeconds | #min:0|  #max:1000|"
	//static let cyanosis = "#id:chkSynNone | #title:Cyanosis | #type:#check"
	static let pallorDiaphoresis = "#id:chkSynpallor | #title:Pallor, Diaphoresis | #type:#check"
	static let unusualPosture = "#id:chkSynposture | #title:Unusual Posture | #type:#check"
	
	static let postictalSymptoms = "#id:postictalSymptoms | #title:Postictal Symptoms | #type:#label"
	static let disorientation = "#id:chkSynDisor | #title:Disorientation | #type:#check"
	static let paralysis = "#id:chkSynPara | #title:Paralysis | #type:#check"
	static let chestPainInPostictalSymptoms = "#id:chkSynPosCP | #title:Chest Pain | #type:#check"
	static let prolongedFatigue = "#id:chkSynfatigue | #title:Prolonged Fatigue | #type:#check"
	static let traumaticInjury = "#id:chkTraumaticInj | #title:Traumatic Injury | #type:#check"
	
	
	// Physical Exam -> Edema
	static let pittingEdema = "#id:chkpitting | #title:Pitting  | #type:#check"
	static let nonpittingEdema = "#id:chknonpitting | #title:Nonpitting  | #type:#check"
	static let localizedEdema = "#id:chklocaledema | #title:Localize  | #type:#check"
	static let diffuseEdema = "#id:chkdiffusedema | #title:Diffuse  | #type:#check"
	
	
	//	Evaluation -> Symptoms -> Weakness
	static let malaiseFatigue = "#id:malaiseFatigue | #title:Malaise/Fatigue | #type:#check"
	
	
	// Evaluation -> Symptoms  -> Palpitations ->Frequency
	static let frequencyPalpitationsLabel = "#id: frequencyLabel| #title:Frequency | #type:#label"
	static let dailyFreqPalpitations = "#id:chkpalday | #title:Daily | #type:#check"
	static let weeklyFreqPalpitations = "#id:chkpalweek | #title:Weekly | #type:#check"
	static let monthlyFreqPalpitations = "#id:chkpalmonth | #title:Monthly | #type:#check"
	static let yearlyFreqPalpitations = "#id:chkpalyear | #title:Yearly| #type:#check"
	
	// Evaluation -> Symptoms -> Palpitations ->Type
	static let typePalpitationsLabel = "#id: typePalpitations | #title:Type | #type:#label"
	static let extrasystolicTypePalpitations = "#id:chkextrasys | #title:Extrasystolic | #type:#check"
	static let tachycardicTypePalpitations = "#id:chktachycardic | #title:Tachycardic | #type:#disclosureControlExpandable"
	static let anxietyTypePalpitations = "#id:chkanxiety | #title:Anxiety | #type:#check"
	static let pulsationTypePalpitations = "#id:chkpulsation | #title:Pulsation| #type:#check"
	
	// Evaluation -> Symptoms -> Palpitations -> Type -> Tachycardic
	static let abruptTachycardicTypePalpitations = "#id:chkvagalabrupt | #title:Abrupt termination | #type:#check"
	static let gradualTachycardicTypePalpitations = "#id:chkvagalgradual | #title:Gradual termination | #type:#check"
	static let noresponseTachycardicTypePalpitations = "#id:chkvagalnoresponse | #title:No response | #type:#check"
	
	// Evaluation -> Symptoms -> Palpitations -> Duration
	static let durationPalpitationsLabel = "#id: durationPalpitations | #title:Symptom Duration | #type:#label"
	static let secondsDurationPalpitations = "#id:txtpalseconds | #title:Seconds | #type:#check"
	static let minutesDurationPalpitations = "#id:txtpalminutes | #title:Minutes | #type:#check"
	static let hoursDurationPalpitations = "#id:txtpalhours | #title:Hours | #type:#check"
	
	// Evaluation -> Symptoms -> Palpitations ->  Syncope
	static let syncopePalpitationsLabel = "#id: syncopePalpitations | #title:Syncope | #type:#label"
	static let palSyncopePalpitations = "#id:chkpalday | #title:Syncope | #type:#check"
	static let anginaSyncopePalpitations = "#id:chkpalangina | #title:Angina or dyspnea | #type:#check"
	static let polyuriaSyncopePalpitations = "#id:chkpalpolyuria | #title:Polyuria| #type:#check"
	static let pulsationsSyncopePalpitations = "#id:chkpalneck | #title:Pulsations in neck | #type:#check"
	
	
	// Evaluation -> Symptoms -> Palpitations -> Ekg
	static let ekgPalpitationsLabel = "#id: ekgPalpitations | #title:EKG During Symptoms | #type:#label"
	static let nsrEkgPalpitations = "#id:chkpalNSR | #title:NSR | #type:#check"
	static let regularEkgPalpitations = "#id:chkpalregRR | #title:Other rhtym,regular RR | #type:#check"
	static let irregularEkgPalpitations = "#id:chkpalirregRR | #title:Other rhtym,irregular RR | #type:#check"
	
	
	// Evaluation -> Symptoms -> Palpitations -> Onset, trigger
	static let onsetPalpitationsLabel = "#id: onsetPalpitations | #title:Onset, Trigger | #type:#label"
	static let suddenOnsetPalpitations = "#id:chkpalsudden | #title:Sudden onset | #type:#check"
	static let positionOnsetPalpitations = "#id:chkpalposition | #title:Position change | #type:#check"
	static let exertionOnsetPalpitations = "#id:chkpalexertion | #title:Exertional | #type:#check"
	static let postexertionOnsetPalpitations = "#id:chkpalpostexertion | #title:Post exertion| #type:#check"
	
	
	
	
	//	Evaluation -> Symptoms -> Abdominal Pain
	
	// Physical Exam -> Symptoms ->Abdominal Pain -> Quality
	static let qualityAbdominalPainLabel = "#type:#label | #title: Quality | #id: qualityAbdominalPain"
	static let sharpQualityAbdominalPain = "#id:chkAbsharp | #title:Sharp | #type:#check"
	static let colickyQualityAbdominalPain = "#id:chkAbcolic | #title:Colicky | #type:#check"
	static let achingQualityAbdominalPain = "#id:chkAbaching | #title:Aching or spasm | #type:#check"
	// Physical Exam -> Symptoms ->Abdominal Pain -> Location
	static let locationAbdominalPainLabel = "#type:#label | #title: Location | #id: locationAbdominalPain"
	static let theperiumbilicalLocationAbdominalPain = "#id:chkperiumbilical | #title:Periumbilical | #type:#check"
	static let epigastricLocationAbdominalPain = "#id:chkepigastric | #title:Epigastric | #type:#check"
	static let suprapubicLocationAbdominalPain = "#id:chksuprapubic | #title:Suprapubic | #type:#check"
	static let refferedAbdominalPain = "#id:chkAbspasm | #title:Referred shoulder pain | #type:#check"
	// Physical Exam -> Symptoms ->Abdominal Pain -> Associated Findings
	static let associatedFindingsAbdominalPainLabel = "#type:#label | #title: Associated Findings | #id: associatedFindingsAbdominalPainL"
	
	// Physical Exam -> Symptoms ->Abdominal Pain -> Associated Symptoms
	static let associatedSymptomsAbdominalPainLabel = "#type:#label | #title: Associated Findings | #id: associatedSymptomsAbdominalPain"
	
	
	
	// Review of System
	static let weightChangeInROS = "#id:chkweightchange | #title:Weight Gain | #type:#check"
	static let thyrotoxicosisInROS = "#id:chkThyro | #title:Thyrotoxicosis | #type:#check"
	static let palpitationsInROS = "#id:chkpalpitations | #title:Palpitations | #type:#check"
	static let osaSymptomsInROS = "#id:chkOSA | #title:OSA Symptoms | #type:#check"
	static let previousDVTPEInROS = "#id:chkPVTE | #title:Previous pulmonary embolism | #type:#check"
	static let activePepticUlcerDiseaseInROS = "#id:chkPUD | #title:Active Peptic Ulcer Disease | #type:#check"
	static let liverDiseaseInROS = "#id:chkliver | #title:Liver Disease | #type:#check"
	static let tiaInROS = "#id:chkTIA| #title:TIA | #type:#check"
	static let bleedInThePast3MonthsInROS = "#id:chkbleed | #title:Bleed in the Past 3 Months | #type:#check"
	static let hypothyroidismInROS = "#id:chkHypoThyro | #title:Hypothyroidism | #type:#check"
	static let claudicationInROS = "#id:chkclaudication| #title:Claudication | #type:#check"
	static let ulcerInROS = "#id:chkulcer | #title:Lower Extremity Ulceration | #type:#check"
	static let rheumInROS = "#id:chkrheum | #title:Rheumatic Disease | #type:#check"
	static let pndInROS = "id:chkPND| #title: Paroxysmal nocturnal dyspnea| #type:#check"
	static let orthopneaInROS = "id:chkorthopnea| #title: Orthopnea| #type:#check"
	static let previousDVTEInROS = "id:chkDVTE| #title: Previous DVT| #type:#check"
	
	
	// Physical Exam https://zpl.io/29sOGH
	static let hepatojulularRefluxInPhysicalExam = "#id:chkHJR | #title:Hepatojulular Reflux | #type:#check"
	static let jugularVenousDistentionInPhysicalExam = "#id:chkJVD | #title:Jugular Venous Distention | #type:#check"
	static let displacedPMIInPhysicalExam = "#id:chkPMI | #title:Displaced PMI | #type:#check"
	static let leftSidedS3S4Gallop = "#id:chkS3 | #title:Left Sided Gallop | #type:#check"
	static let leftSidedS4Gallop = "#id:chkS4 | #title:Left Sided S4 Gallop | #type:#check"
	static let frictionRubInPhysicalExam = "#id:chkrub | #title:Friction Rub| #type:#check"
	static let distantInPhysicalExam = "#id:chkdistant | #title:Distant Heart Sounds| #type:#check"
	static let heartMurmurInPhysicalExam = "#id:chkheartMurmur | #title:Heart Murmur | #type:#disclosureControl"
	static let newRalesInPhysicalExam = "#id:chkMR | #title:New Rales | #type:#check"
	static let pulmonaryEdemaInPhysicalExam = "#id:chkPEd | #title:Pulmonary Edema | #type:#check"
	
	static let rhonchiInPhysicalExam = "#id:chkrhonchi | #title:Dry rales, rhonchi | #type:#check"
	static let thoraxInPhysicalExam = "#id:chkthorax | #title:Increased thorax AP diameter  | #type:#check"
	static let percussionInPhysicalExam = "#id:chkpercussion| #title:Abnormal resonance to percussion | #type:#check"
	
	
	static let diminishedBreathSoundsInPhysicalExam = "#id:chkbreath | #title:Diminished Breath Sounds | #type:#check"
	static let abdominalTendernessInPhysicalExam = "#id:chkabdominal | #title:Abdominal Tenderness | #type:#check"
	static let anyCNSSymptomsInPhysicalExam = "#id:chkAMS | #title:Any CNS Symptoms | #type:#check"
	static let coldClammyExtremitiesInPhysicalExam = "#id:chkshock | #title:Cold Clammy Extremities | #type:#check"
	static let edemaInPhysicalExam = "#id:chkedema | #title:Edema/Ascites | #type:#check"
	static let differenceinSBPInPhysicalExam = "#id:txtDiffInSBP | #title:Difference in SBP | #type:#integerRight | #min:0 | #max:50 | #placeholder: "
	static let neckveins = "#id:chkhepato | #title:Neck veins not assesable | #type:#check"
	static let ascitesInPhysicalExam = "#id:chkascites | #title:Ascites | #type:#check"
	static let bruitInPhysicalExam = "id:chkbruit| #title:Carotid bruit| #type:#check"
	
	// new stuff?
	static let weaknessInPhysicalExam = "id:chkmalaise | #title:Fatigue /Malaise/ Weakness | #type:#check"
	static let abdominalPainInPhysicalExam = "#id:chkplaceholderone | #title:Abdominal Pain | #type:#disclosureControl"
	static let associatedFindingsInPhysicalExam = "#id:chkplaceholdertwo | #title:Associated Findings | #type:#disclosureControl"
	static let associatedSymptomsInPhysicalExam = "#id:chkplaceholdethree | #title:Associated Symptoms | #type:#disclosureControl"
	
	static let palpitationsInPhysicalExam = "#id:chkp| #title:Section Palpitations| #type:#disclosureControl"
	static let shockInPhysicalExam = "#id:chkss | #title:Section Shock | #type:#disclosureControl"
	static let cyanosisInPhysicalExam = "#id:chkCyanosis | #title:Cyanosis | #type:#check"
	
	
	// Physical Exam -> Heart Murmur https://zpl.io/SNRzD
	
	static let murmur = "#id:murmur | #title:Murmur | #type:#disclosureSimple"
	
	static let abnormalAuscultationLabel = "#id:abnormalAuscultationLabel | #title:Focus on the most abnormal auscultation foci | #type:#label | #height: 70"
	static let s1Mitral = "#id:chkS1Mitral | #title:S1 Mitral | #type:#disclosureControl"
	static let s2Aortic = "#id:chkS2Aortic | #title:S2 Aortic | #type:#disclosureControl"
	static let p2Pulmonic = "#id:chkP2Pulmonic | #title:P2 Pulmonic | #type:#disclosureControl"
	static let s1Tricuspid = "#id:chkS1Tricuspid | #title:S1 Tricuspid | #type:#disclosureControl"
	
	static let systolicMurmur = "#id:chkSystolicMurmur | #title:Systolic Murmur | #type:#disclosureControlExpandable"
	static let diastolicMurmur = "#id:chkDiastolicMurmur | #title:Diastolic Murmur | #type:#disclosureControlExpandable"
	static let mitralOpeningSnap = "#id:mitralOpeningSnap | #title:Mitral Opening Snap | #type:#check"
	
	// Physical Exam -> Heart Murmur -> S1 Mitral https://zpl.io/1Fzz76
	static let blnS1MitralLoud = "#id:chkS1MitralLoud | #title:Loud | #type:#radio | #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	static let blnS1MitralNormal = "#id:chkS1MitralNormal | #title:Normal | #type:#radio| #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	static let blnS1MitralSoft = "#id:chkS1MitralSoft | #title:Soft | #type:#radio| #group: (blnS1MitralLoud, blnS1MitralNormal, blnS1MitralSoft)"
	
	// Physical Exam -> Heart Murmur -> S2 Aortic https://zpl.io/2uy66u
	static let blnS2AorticLoud = "#id:chkS2MitralLoud | #title:Loud | #type:#radio | #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	static let blnS2AorticNormal = "#id:chkS2MitralNormal | #title:Normal | #type:#radio| #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	static let blnS2AorticSoft = "#id:chkS2MitralSoft | #title:Soft | #type:#radio| #group: (blnS2AorticLoud, blnS2AorticNormal, blnS2AorticSoft)"
	
	// Physical Exam -> Heart Murmur -> P2 Pulmonic https://zpl.io/2vXwsT
	static let blnP2PulmonicLoud = "#id:chkP2PulmonicLoud | #title:Loud | #type:#radio | #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	static let blnP2PulmonicNormal = "#id:chkP2PulmonicNormal | #title:Normal | #type:#radio| #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	static let blnP2PulmonicSoft = "#id:chkP2PulmonicSoft | #title:Soft | #type:#radio| #group: (blnP2PulmonicLoud, blnP2PulmonicNormal, blnP2PulmonicSoft)"
	
	// Physical Exam -> Heart Murmur -> S1 Tricuspid
	static let blnP2TricuspidLoud = "#id:chkS1TricuspidLoud | #title:Loud | #type:#radio | #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	static let blnP2TricuspidNormal = "#id:chkT1TricuspidNormal | #title:Normal | #type:#radio| #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	static let blnP2TricuspidSoft = "#id:chkT1TricuspidSoft | #title:Soft | #type:#radio| #group: (blnP2TricuspidLoud, blnP2TricuspidNormal, blnP2TricuspidSoft)"
	
	
	// Physical Exam -> Heart Murmur -> Systolic Murmur https://zpl.io/Z12Jxq3
	static let blnCresDecres = "#id:chkCresDecres | #title:Crescendo-Decrescendo | #type:#disclosureControlExpandable"
	static let blnPlateuShaped = "#id:chkPlateuShaped | #title:Plateau Shaped | #type:#disclosureControlExpandable"
	static let blnsquat = "#id:chksquat | #title:Softer with Squat | #type:#check"
	static let blnejectionsound = "#id:chkejectionsound | #title:Ejection sound | #type:#check"
	static let blnsystolicclick = "#id:chksystolicclick | #title:Systolic click | #type:#check"
	
	// Physical Exam -> Heart Murmur -> Systolic Murmur -> Crescendo Decrescendo https://zpl.io/Z5eqOE
	static let blnEarlyMidSysPeak = "#id:chkEarlyMidPeak | #title:Early-Mid Systolic Peaking | #type:#check"
	static let blnLateSysPeak = "#id:chkLatePeak | #title:Late Systolic Peaking | #type:#check"
	
	// Physical Exam -> Heart Murmur -> Systolic Murmur -> Plateu Shaped https://zpl.io/1ACSlS
	static let blnHalosystolic = "#id:chkHalosystolic | #title:Halosystolic | #type:#check"
	static let blnPansystolic = "#id:chkPansystolic | #title:Pansystolic | #type:#check"
	static let blnMidsystolic = "#id:chkMidsystolic | #title:Midsystolic | #type:#check"
	
	// Physical Exam -> Heart Murmur -> Diastolic Murmur https://zpl.io/Z1WW9hI
	static let blnDescrescendo = "#id:chkDescrescendo | #title:Decrescendo | #type:#check"
	static let blnRumble = "#id:chkRumble | #title:Rumble | #type:#check"
	
	// ?? should be here i think
	
	// Physical Exam -> Abdominal Pain
	static let typeAbdominalPain = "#id:chkAbsharptop | #title:Type | #type:#disclosureControl"
	static let locationAbdominalPain = "#id:chklocalizedtop| #title:Location | #type:#disclosureControl"
	
	// Physical Exam -> Abdominal Pain -> Type
	static let sharpTypeAbdominalPain = "#id:chkAbsharp | #title:Sharp | #type:#check"
	static let colickyTypeAbdominalPain = "#id:chkAbcolic | #title:Colicky | #type:#check"
	static let achingTypeAbdominalPain = "#id:chkAbaching | #title:Aching or spasm | #type:#check"

	
	// Physical Exam -> Abdominal Pain -> Location
	static let locLocationAbdominalPain = "#id:chklocalized | #title:Localized pain | #type:#check"
	static let diffuseLocationAbdominalPain = "#id:chkdiffuse | #title:Diffuse pain | #type:#check"
	static let epigastricFindAbdominalPain = "#id:chkepigastric | #title:Epigastric | #type:#check"
	static let periumbilicalLocationAbdominalPain = "#id:chkperiumbilical | #title:Periumbilical | #type:#check"
	static let suprapubicEdemaLocationAbdominalPain = "#id:chksuprapubic | #title:Supra pubic | #type:#check"
	static let shoulderAbdominalPain = "#id:chkAbspasm | #title:Referred shoulder pain | #type:#check"
	
	
	// Physical Exam -> Associated findings
	static let abdominalFindings = "#id:chkdistention | #title:Abdominal distention | #type:#check"
	static let reboundFindings = "#id:chkrebound | #title:Rebound tenderness | #type:#check"
	static let pulsatileFindings = "#id:chkpulsatile | #title:Pulsatile mass | #type:#check"
	static let bowelFindings = "#id:chkbowelsounds | #title:Abnormal bowel sounds | #type:#check"
	static let psoasFindings = "#id:chkpsaos | #title:Psoas sign | #type:#check"
	static let mcburneyFindings = "#id:chkMcburney | #title:McBurney | #type:#check"
	static let rovsingsignFindings = "#id:chkRovsing | #title:Rovsing sign | #type:#check"
	static let murphysignFindings = "#id:chkMurphy | #title:Murphy sign | #type:#check"
	static let obturatorFindings = "#id:chkobturator | #title:Obturator sign  | #type:#check"
	static let carnettsignFindings = "#id:chkcarnett | #title:Carnett sign | #type:#check"
	static let costovertebralFindings = "#id:chkcostovertebral | #title:Costovertebral tenderness | #type:#check"
	static let skinfindingsFindings = "#id:chkskin | #title:Skin findings | #type:#disclosureControl"
	
 
	// Physical Exam -> Associated symptons
	static let vomitingSymptoms = "#id:chkvomiting | #title:Vomiting | #type:#disclosureControlExpandable"
	static let anorexiaSymptoms = "#id:chkanorexia | #title:Anorexia | #type:#check"
	static let bowelHabitSymptoms = "#id:chkbowel | #title:Change in bowel habit | #type:#check"
	static let operativeSymptoms = "#id:chkpostoperative | #title:Post operative | #type:#check"
	static let familyhistorySymptoms = "#id:chkfamilyhistoryAA | #title:Family history of AAA | #type:#check"
	static let hematuriaSymptoms = "#id:chkhematuria | #title:Hematuria | #type:#check"
	static let urinarySymptoms = "#id:chkurinary | #title:Change in urinary habit | #type:#check"
	static let obgynSymptoms = "#id:chkobgyn | #title:Ob&gyn history | #type:#check"

	
	
	// Physical Exam ->Associated findings -> Skin findings
	
	static let wallSkinFindings = "#id:chkechymosis | #title:Abdominal wall echymosis | #type:#check"
	static let herpesSkinFindings = "#id:chkherpes | #title:Herpes | #type:#check"
	static let rashSkinFindings = "#id:chkhenoch | #title:Rash | #type:#check"
	static let celulitisSkinFindings = "#id:chkcelulitis | #title:Celulitis | #type:#check"
	static let jaundiceSkinFindings = "#id:chkicterus | #title:Jaundice | #type:#check"
	static let caoutmedusaSkinFindings = "#id:chkcaput | #title:Caput medusa | #type:#check"
	
	
	
	// Physical Exam -> Associated symptons -> Vomit
	
	static let vomitingVomitSymptoms = "#id:chkvomitfirst | #title:Vomiting precedes abdominal pain | #type:#check"
	static let abdominalVomitSymptoms = "#id:chkpainfirst | #title:Abdominal pain precedes vomiting | #type:#check"
	
	
	// Physical Exam -> Section Palpitations
	
	static let frequencyPalpitations = "#id:chkFrequencyPalp  | #title:Frequency | #type:#disclosureControl"
	static let typePalpitations = "#id:chkType | #title:Type | #type:#disclosureControl"
	static let durationPalpitations = "#id:chkDuration  | #title:Duration | #type:#disclosureControl"
	static let syncopePalpitations = "#id:chkSyncope | #title:Caput Syncope | #type:#disclosureControl"
	static let ekgPalpitations = "#id:chkEKGPalpPlaceholder | #title:EKG findings during palpitations | #type:#disclosureControl"
	static let onsetPalpitations = "#id:chkOnset | #title:Onset, trigger | #type:#disclosureControl"
	
	
	// Physical Exam -> Section Shock
	
	static let hypovolemiaSectionShock = "#id:chkhypovolemia | #title:Hypovolemia | #type:#check"
	static let infectiousSectionShock = "#id:chkinfectious | #title:Infectious | #type:#check"
	static let spinalcordSectionShock = "#id:chkspinalcord | #title:Spinal cord | #type:#check"
	static let allergenSectionShock = "#id:chkallergen | #title:Allergen exposure | #type:#check"
	static let pharmacologicSectionShock = "#id:chkpharmacologic | #title:Pharmacological | #type:#check"
	
	// Physical Exam -> Sectioncyanosis
	
	static let centralSectioncyanosis = "#id:chkcentral | #title:Central Cyanosis | #type:#check"
	static let peripheralSectioncyanosis = "#id:chkperipheral | #title:Peripheral Cyanosis | #type:#check"
	
	
	
	// CurrentPast CV Profile https://zpl.io/Z1WoemX
	
	// MARK: Change to disclosureViewed once the cell is done
	static let heartFailure = "#id:heartFailure | #title:Heart Failure | #type:#disclosureWeather"
	static let coronaryHeartDisease = "#id:coronaryHeartDisease | #title:Coronary Heart Disease | #type:#disclosureWeather"
	static let atrialFibrillation = "#id:atrialFibrillation | #title:Atrial Fibrillation | #type:#disclosureWeather"
	static let thromboembolicVKA = "#id:thromboembolicVKA | #title:Thromboembolic Prevention | #type:#disclosureWeather"
	static let ventricularTachyarrthymias = "#id:ventricularTachyarrthymias | #title:Ventricular Tachyarrthymias | #type:#disclosureWeather"
	static let bradyarrthymiaSyncope = "#id:bradyarrthymiaSyncope | #title:Bradyarrthymia/Syncope | #type:#disclosureWeather"
	static let valvularHeartDisease = "#id:valvularHeartDisease | #title:Valvular Heart Disease | #type:#check"
              ///| #alert: Refer to Heart Failure Specialist for Management"
	static let pulmonaryHypertension = "#id:pulmonaryHypertension | #title:Pulmonary Hypertension | #type:#disclosureWeather | #alert: Refer to Heart Failure Specialist for Management"
	static let vascularDisease = "#id:vascularDiseases | #title:Vascular Disease | #type:#disclosureWeather"
	
	//Heart Failure https://zpl.io/Z1oLKLR
    
    static let history = "#id:sechistory|#title:History |#type:#disclosureSimple"
    static let etiology = "#id:secEtiology|#title:Etiology |#type:#disclosureSimple"
    static let clinical = "#id:secclinical|#title:Clinical Presentation |#type:#disclosureSimple"
    static let ahastage = "#id:secahastage|#title:AHA Stage |#type:#disclosureSimple"
    static let hometherapeutics = "#id:sechometherapeutics|#title:Home Therapeutics |#type:#disclosureSimple"
    static let acutely = "#id:secacutely|#title:Acutely Decompensated / Hospitalized |#type:#disclosureSimple"
    static let inhospitaltherapies = "#id:secinhospital|#title:In Hospital / IV Therapies |#type:#disclosureSimple"
    static let discharge = "#id:secdischarge|#title:Discharge Therapeutics |#type:#disclosureSimple"
    
    //Heart Failure -> History
    static let newOnsetHF = "#id:chknewHF |    #title:New onset HF/initial evaluation |    #type:#check"
    static let chronicHF = "#id:chkchronic |    #title:Chronic known HF |    #type:#check"
    static let oneormorehf = "#id:chkHFPLVF |    #title:One or more HF admissions in 12 months |    #type:#check"
    static let twounscheduled = "#id:chkfoutpt |    #title:Two unscheduled ED or clinic visits in 12 months |    #type:#check"
    static let chestpain = "#id:chkTA |    #title:Chest Pain | #type: #check"
    static let dyspneaonexe = "#id:chkDOE | #title:Dyspnea on exertion | #type:#disclosureControl"
    static let spbivppm = "#id:chkCRTI |    #title:S/P BIVPACER | #type: #check"
    static let spppmrv = "#id:chkPPM |    #title:S/P PPM RV LEAD ONLY | #type: #check"
    
    //Heart Failure -> History -> Dyspneaonexe
    static let class1 = "#id:chkclass1 |    #title:Dyspnea on strenous exertion | #type: #check"
    static let class2 = "#id:chkclass2 |    #title:Dyspnea on more than routine activities | #type: #check"
    static let class3 = "#id:chkclass3 |    #title:Dyspnea on minimun activities | #type: #check"
    
    //Heart Failure -> Etiology -> Cardiotoxins
    static let radiationtherapy = "#id:chkXRT | #title:Radiation therapy | #type:#disclosureControl"
    static let antracyclines = "#id:chkantracyclines |  #title:Antracyclines | #type: #check"
    static let antiher2 = "#id:chktrastuzumab |  #title:AntiHER2/ Trastuzumab | #type: #check"
    static let alkylating = "#id:chkhormonal |  #title:Alkylating | #type: #check"
    static let immuno = "#id:chkimmuno |  #title:5-FU | #type: #check"
    static let protease = "#id:chkprotease |  #title:Protease inhibitor | #type: #check"
    static let thyrosine = "#id:chkthyrosine |  #title:Thyrosine kinase inhibitor | #type: #check"
    static let atezo = "#id:chkatezo | #title:PDL/PDL-1 | #type: #check"
    static let vegf = "#id:chkVEGF | #title:VEGF inhibitor | #type: #check"
    
    //Heart Failure -> Etiology -> Cardiotoxins -> RadiationTherapy
    static let anteriorchest = "#id:chkanteriorchest |  #title:Anterior chest | #type: #check"
    static let tumor = "#id:chktumor |  #title:Tumor next to heart | #type: #check"
    static let shield = "#id:chkshield |  #title:No shielding | #type: #check"
    static let highdosert = "#id:chkhighdoseRT |  #title:High dose XRT > 2Gy/day | #type: #check"
    static let cumulative = "#id:chkcumulative |  #title:Cumulative > 30Gy | #type: #check"
    static let concomitant = "#id:chkconchem |  #title:Concomitant chemo | #type: #check"
    
    //Heart Failure -> Etiology -> HOCM
    static let lvmore = "#id:chklvhg |  #title:LVH ≥ 30mm | #type: #check"
    static let historysudden = "#id:chkfamhistsudden |  #title:History of Sudden Death | #type: #check"
    
    
    //Heart Failure -> Clinical
    static let  vo2sat = "#id:txtVo2sat | #title:CV/SVO2sat% | #type:#integerRight|   #min:30|  #max:100|  #placeholder: "
    static let rasat = "#id:txtO2sat | #title:RA O2 SAT | #type:#integerRight|   #min:30|  #max:100|  #placeholder: "
    static let lowurine = "#id:chklowurine |  #title:Low Urine Output < 30ml/hr | #type: #check"
    
    //Heart Failure -> AHAStage
    static let advancedHF = "#id:chkadvancedHF | #title:Advanced HF | #type:#disclosureControl"
    
    //Heart Failure -> Hometherapeutics
    static let vasodilator = "#id:chkvasodilator |  #title:Vasodilator | #type: #check"
    
    //Heart Failure -> Acutely
    static let predischarge = "#id:chkpredischarge |  #title:Pre-discharge or Discharge day  | #type: #check"
    
    //Heart Failure -> InHospitalTherapies
    static let onmaximumtole = "#id:chkonmaximumtole |  #title:On Maximum Tolerated or Intolerant Acel/ARB | #type: #check"
  
    static let onmaximumtoleB = "#id:chkonmaximumtoleB |  #title:On Maximum Tolerated B Blocker | #type: #check"
    static let chronicintro = "#id:chkchronicintro |  #title:Chronic Inotrope Dependence | #type: #check"
    static let intermitt = "#id:chkintermitt |  #title:Intermittent Inotrope Dependence | #type: #check"
    
    //Heart Failure -> Discharge
    static let dischargedaily = "#id:txtdischargedaily | #title:Discharge daily diuretic dose, furosemide equivalent | #type:#integerRight|   #min:10|  #max:240|  #placeholder: "
    static let predischarge6mw = "#id:txtpredischarge6mw | #title:Predischarge 6MW distance | #type:#integerRight|   #min:10|  #max:800|  #placeholder: "
    static let predischargebnp = "#id:txtpredischargebnp | #title:Predischarge BNP pg/ml | #type:#integerRight|   #min:10|  #max:80000|  #placeholder: "
    static let bblockerinto = "#id:chkbblockerinto |  #title:B blocker intolerance | #type: #check"
    static let noncardiac = "#id:chknoncardiac |  #title:Non cardiac morbidities | #type: #check"
    
    
    
    
	static let lvefInHF = "#id:txtCHF | #title:LVEF | #type:#integerRight | #min:10 | #max:80 | #placeholder: "
	static let hfDiagnosisDurationPerWeekInHF = "#id:txtdur |    #title:HF Diagnosis Duration/Week| #type:#integerRight|   #min:0|  #max:999|  #placeholder: "
	
	static let sysemb = "#id:chksysemb |    #title:Systemic Embolism |    #type:#check"
	
	static let previousHFHospitalizationInHF = "#id:txtfoutput |    #title:Previous HF Hospitalization|    #type:#check"
	static let spicdInHF = "#id:chkICD |    #title:Status Post ICD|    #type:#check"
	
	static let cRTI = "#id:chkICD |    #title:Status Post CRTI|    #type:#check"
	static let lVEF = "#id:txtCHF |    #title:LVEF|    #type:#integerRight"
	
	static let idiopathicDCMNonischemic = "#id:chkNonischemicCMP | #title:Idiopathic/DCM/Nonischemic | #type:#check"
	static let postMIMore45Days = "#id:chkMI | #title:Post MI > 45 Days | #type: #check"
	static let ischemicPostMILess45Day = "#id:chkIschemic | #title:Ischemic Post MI < 45 days | #type:#check"
	static let cardiotoxis = "#id:chkCardiotoxins | #title:Cardiotoxins | #type:#disclosureControl"
	static let familiarCMPSuddenDeath = "#id:chkFamHXofCMP | #title:Familial CMP Associated with Sudden Death | #type:#check"
	static let myocarditis = "#id:chkmyocarditis | #title:Myocarditis | #type:#check"
	static let rvDysplasia = "#id:chkSuspectedRVDysplasia | #title:RV Dysplasia | #type:#check"
	static let hocm = "#id:chkIschemicCMP| #title:HOCM | #type:#disclosureControl"
	static let peripartumCMP = "#id:chkrestrictive | #title:Peripartum CMP | #type:#check"
    
	
	//	CurrentPast CV Profile -> Heart Failure -> Post MI>45 Days https://zpl.io/ZcwnUr
	static let lvAneurysm = "#id:chkLVaneurysm | #title:LV Aneurysm | #type:#check"
	
	//	CurrentPast CV Profile -> Heart Failure -> HOCM https://zpl.io/2oywbi
	static let lvh30mm = "#id:chkLVHGreater30| #title:LVH ≥ 30mm | #type:#check"
	static let abnormalBPResponsetoExercise = "#id:chkabnormalBP | #title:Abnormal BP Response to Exercise | #type:#check"
	static let familyHistoryOfSuddenDeath = "#id:chkFamHistSuddenDeath | #title:Family History of Sudden Death | #type:#check"
	static let restDynamicPeakLVOT = "#id:chkLVOT | #title:Rest/Dynamic Peak LVOT Gradient > 50mmHg | #type:#check"
	
	
	
	//	CurrentPast CV Profile -> Coronary Heart Disease https://zpl.io/2weUnk
	static let acuteCoronarySyndrome = "#id:chkACS | #title:Acute Coronary Syndrome | #type:#disclosureControl"
	static let pcicabg = "#id:chkPCI | #title:PCI/CABG | #type:#disclosureControl"
	static let stableAng = "#id:chkSTENUSIS | #title:STABLE ANG | #type:#disclosureControl"
	static let lm = "#id:chkLM | #title:LM | #type:#check"
	static let lad = "#id:chkLAD | #title:LAD | #type:#check"
	static let rca = "#id:chkRCA | #title:RCA | #type:#check"
	static let lcx = "#id:chkLCX | #title:LCX | #type:#check"
	//static let icd10 = "#id:chkICD-10 | #title:ICD-10 | #type:#disclosureControl"
	static let vesselmore50 = "#id:txtNumVessel | #title:# Vessel > 50% | #type:#integerRight | #min:1 | #max:3 | #placeholder: "
	static let lvefInCHD = "#id:txtHF | #title:LVEF | #type:#integerRight | #min:10 | #max:80 | #placeholder: "
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Acute Coronary Syndrome https://zpl.io/1i9sVD
	static let moreAnginaIn24Hours = "#id:chkang24 | #title:≥ 2 Angina/24hr | #type:#check"
	static let anginaMore20min = "#id:chkAn20 | #title:Angina > 20min | #type:#check"
	static let asaUseInPast1Week = "#id:asaUseInPast1Week | #title:ASA Use in Past 1 Week | #type:#check"
	static let postiveTropIorT = "#id:lm | #title:Postive Trop I or T | #type:#check"
	static let moreTwoAntanginal = "#id:chkAnAn | #title:≥ 2 Antanginal | #type:#check"
	static let stemi = "#id:chkSTEMI | #title:STEMI | #type:#disclosureControlExpandable"
	static let refractoryAngina = "#id:chkrefractory | #title:Refractory Angina | #type:#check"
	static let changingTropI = "#id:chkchangetrop | #title:Changing Trop I | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Acute Coronary Syndrome -> STEMI https://zpl.io/Z1Kb0YP
	static let anteriorSTEMI = "#id:chkanterior | #title:Anterior | #type:#check"
	static let inferiorSTEMI = "#id:chkinferior | #title:Inferior | #type:#check"
	static let otherSTEMI = "#id:chkother | #title:Other | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> PCI/CABG https://zpl.io/MV6Br
	static let lastProcedureYearsAgo = "#id:txtprocedure | #title:Last Procedure (years ago) | #type:#integerRight | #min:0|  #max:50|  #placeholder: "
	static let bms = "#id:chkBMS| #title:BMS | #type:#check"
	static let des = "#id:chkDES | #title:DES | #type:#check"
	static let cabg = "#id:chkCABG | #title:CABG | #type:#disclosureControlExpandable"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> PCI/CABG -> CABG https://zpl.io/1H0tEY
	static let autoVein = "#id:chkautovein | #title:Auto Vein | #type:#check"
	static let autoArtery = "#id:chkautoartery | #title:Auto Artery | #type:#check"
	static let nonAuto = "#id:chknonauto | #title:Non Auto | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> Stable Ang https://zpl.io/1nIjn5 (Android)
	static let nyhaccvsClass1 = "#id:nyhaccvsClass1 | #title: NYHA/CCVS Class 1 | #type:#check"
	static let nyhaccvsClass2 = "#id:nyhaccvsClass2 | #title: NYHA/CCVS Class 2 | #type:#check"
	static let nyhaccvsClass3 = "#id:nyhaccvsClass3 | #title: NYHA/CCVS Class 3 | #type:#check"
	static let nyhaccvsClass4 = "#id:nyhaccvsClass4 | #title: NYHA/CCVS Class 4 | #type:#check"
	
	//	CurrentPast CV Profile -> Coronary Heart Disease -> ICD-10 https://zpl.io/Z25IASS (Android)
	static let chronicTotalOcclusion = "#id:chkCTO | #title:Chronic Total Occlusion | #type:#check"
	static let coronoaryAneurysm = "#id:chkcoraneurysm | #title:Coronoary Aneurysm | #type:#check"
	static let coronaryDissection = "#id:chkcordissection | #title:Coronary Dissection | #type:#check"
	static let calcifiedCoronaryLesion = "#id:chkcalcified | #title:Calcified Coronary Lesion | #type:#check"
	static let lipidRichPlaque = "#id:chklipidrich| #title:Lipid Rich Plaque | #type:#check"
	static let documentedVasospasm = "#id:chkvasospasm | #title:Documented Vasospasm | #type:#check"
	
	//	CurrentPast CV Profile ->
	
	//	CurrentPast CV Profile -> Atrial Fibrillation https://zpl.io/1NE0A3
	static let symptomatic = "#id:chkVHD | #title:Symptomatic | #type:#disclosureControlExpandable"
	//static let chronicAF = "#id:chkchronicAF | #title:Chronic AF | #type:#check"
	//static let persistentAF = "#id:chkpersistent | #title:Persistent AF | #type:#check"
	//static let paroxymalAF = "#id:chkparoxysmal | #title:Paroxymal AF | #type:#check"
	static let durationDays = "#id:Txtafd | #title:Duration (Days) | #type:#integerRight | #min:0|  #max:999|  #placeholder: "
	//static let spSuccessfulAblation = "#id:chkablation | #title:S/P Successful Ablation | #type:#check"
	
	static let atrialFibrillationLabel = "#id: AtrialFibrillationLabel | #title: Select V/R Control | #type:#label"
	static let ventricularRateControl = "#id:chkpharm | #title:Ventricular Rate Control | #type:#radio | #group: (ventricularRateControl, rhythmControl)"
	static let rhythmControl = "#id:chkCV | #title:Rhythm Control | #type:#radio | #group: (ventricularRateControl, rhythmControl)"
//		static let ventricularRateControl = "#id:chkPharm | #title:Ventricular Rate Control | #type:#radio | #group: (ventricularRateControl, rhythmControl)| #selected: 1"
//		static let rhythmControl = "#id:chkCV | #title:Rhythm Control | #type:#radio | #group: (ventricularRateControl, rhythmControl)| #selected: 2"
	
	static let previousTIACVA = "#id:chkprevious | #title:Previous TIA/CVA | #type:#check"
	static let thyrotoxicosis = "#id:thyrotoxicosis | #title:Thyrotoxicosis | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Rhythm Control  https://zpl.io/42VGk
	static let blnCAA = "#id:chkCAA | #title:Current Antiarrythmic Therapy | #type:#disclosureControl"
	static let blnliver = "#id:chkliver | #title:Liver Disease | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Rhythm Control -> Current Antiarrythmic Therapy https://zpl.io/Z7iXr7
	static let blnclass1AA = "#id:chkclass1AA | #title:Propofonone, Flecanide | #type:#check"
	static let blnclass3AA = "#id:chkclass3AA | #title:Sotalol, Amiodarone, Multaq, Dofetilide | #type:#check"
	
	//	CurrentPast CV Profile -> Atrial Fibrillation -> Ventricular Heart Control https://zpl.io/Z28fdgd
	static let heartRateWithActivity = "#id:txtCMP| #title:Heart Rate with Activity | #type:#check"
	//static let lastthromboembolicevent = "#id:TxtPrevious| #title:Last embolic event/ months ago | #type:#integerRight | #min:0|  #max:199|  #placeholder: "
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA
  static let clinicalSynscope = "#id:clinicalSynscope | #title:Clinical Synscope | #type:#disclosureWeather"
	static let thromboembolicPrevention = "#id:thromboembolicPrevention | #title:Thromboembolic Prevention Thromboembolic Therapy VKA (Warfarin) Therapy Periprocedural Anticoagulation | #type:#disclosureWeather"
	static let valvularHeartDiseaseThromboembolicPreventionandTherapy = "#id:valvularHeartDiseaseThromboembolicPreventionandTherapy | #title:Valvular Heart Disease Thromboembolic Prevention and Therapy | #type:#disclosureWeather"
	static let otherCardiacSourceOfEmbolism = "#id:otherCardiacSourceOfEmbolism | #title:Other Cardiac Source Of Embolism (Non-Atrial Fibrilation) | #type:#disclosureWeather"
	static let miscellaneous = "#id:miscellaneous | #title:Miscellaneous | #type:#disclosureWeather"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Valvular Heart Disease
	static let blncage  = "#id:chkcage | #title:Mechanical Cageball | #type:#check"
	static let blnmech = "#id:chkmech | #title:Mechanical Disk/Bileaflet Mitral | #type:#check"
	static let blnMdav = "#id:chkMdav | #title:Mechanical Disk/Bileaflet Aortic | #type:#check"
	static let blnRMVD = "#id:chkRMVD | #title:Rheumatic Mitral Valve Disease | #type:#disclosureControl"
	static let blnbiop = "#id:chkbiop | #title:Bioprosthetic Valve | #type:#check"
	static let blnsysemb = "#id:chksysemb | #title:Systematic Embolism | #type:#check | #selected: 1"
	static let blnIE = "#id:chkIE | #title:Infective Endocarditis | #type:#check"
	static let blnLPVT = "#id:chkLPVT | #title:Left Sided PV Thrombosis | #type:#check"
	static let blnRPVT = "#id:chkRPVT | #title:Right Sided PV Thrombosis | #type:#check"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Valvular Heart Disease -> RMVD
	static let blnLAthr = "#id:chkLAthr | #title:LA Thrombus | #type:#check"
	static let txtLAd = "#id:txtLAd | #title:LA Diameter | #type:#integerRight | #min:2 | #max:7 | #placeholder: "
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Other Cardiac Source of Embolism
	static let blnArterialIschemic = "#id:chkArterialIschemic | #title:Non Acute Arterial Ischemic Stroke | #type:#check | #selected: 1"
	static let blnAorticArchAth = "#id:chkAorticArchAth | #title:Aortic Arch Atherosclerosis | #type:#check"
	static let blnLVt = "#id:chkLVt | #title:LV Thrombus | #type:#check"
	static let blnPFO = "#id:chkPFO | #title:PFO | #type:#check"
	static let blnMVP = "#id:chkMVP | #title:MVP | #type:#check"
	static let blnMitralAnnular = "#id:chkMitralAnnular | #title:Mitral Annular Valcification | #type:#check"
	static let blnCalcificAortic = "#id:chkCalcificAortic | #title:Calcific Aortic Valve Disease | #type:#check"
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Miscellaneous
	static let hit = "#id:chkHeparinIndThrom| #title:HIT | #type:#check"
	static let cerebralVenousThrombosis = "#id:chkCerebralVenous| #title:Cerebral Venous Thrombosis | #type:#check"
	static let hypercoagulableState = "#id:chkApoA1 | #title:Hypercoagulable State | #type:#check"
	
	
	//	CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention https://zpl.io/Z1NEKoE
	// REGEX and placeholder
	static let inr = "#id:txtINR | #title:INR | #type:#decimalRight | #min:0.5 | #max:100.0 | #placeholder: "
	static let bleedingRisk = "#id:chkbldrisk | #title:Patient related Bleeding Risk | #type:#disclosureControl"
	static let proceduralBleedingRisk = "#id:chkprocedural_bleed_risk| #title: Procedure related Bleeding Risk| #type:#disclosureControl "
	static let deepVenousThrombosis = "#id:chkDeepVenousThrombosis | #title:Deep Venous Thrombosis | #type:#check"
	static let pulmonaryEmbolism = "#id:chkPE | #title:Pulmonary Embolism | #type:#check"
	static let dvtpeDiagnosisPrevention = "#id:chkDVTprevention | #title:DVT/PE Diagnosis/Prevention | #type:#disclosureControl"
	static let acuteCVA = "#id:acuteCVA | #title:Acute CVA | #type:#disclosureControl"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Bleeding Risk https://zpl.io/ZwpYcp
	static let activeGastroduodenalUlcer = "#id:activeGastroduodenalUlcer | #title:Active Gastroduodenal Ulcer | #type:#check"
	static let bleedIn3MoBeforeAdmission = "#id:bleedIn3MoBeforeAdmission | #title:Bleed in 3 mo before admission | #type:#check"
	static let plateletCountLess50x190L = "#id:chkplt | #title:Platelet Count < 50 x 190/L | #type:#check"
	static let icuOrCCUAdmission = "#id:chkICU | #title:ICU or CCU Admission | #type:#check"
	static let centralVenousCatheter = "#id:chkCVC | #title:Central Venous Catheter | #type:#check"
	static let rheumaticDisease = "#id:chkrheum | #title:Rheumatic Disease | #type:#check"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Procedural Bleeding Risk
	static let priorBleedDuringBridgingSimilar = "#id:chkprior | #title: Prior Bleed During Bridging/Similar | #type:#check"
	static let priorASAUse = "#id:chkpriorASA| #title: Prior ASA Use| #type:#check"
	static let riskClinicallyNotImportant = "#id: chkminorpro| #title: Risk Clinically Not Important| #type:#check"
	static let riskUncertain = "#id:chksurgery| #title: Risk Uncertain| #type:#check"
	static let riskIntermediateHigh = "#id:chkemergencysurgery| #title: Risk Intermediate/High |#type:#check"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> DVT/PE Diagnosis/Prevention https://zpl.io/2ryLo7
	static let blngeneral = "#id:chkgeneral | #title:Major Surgery/Trauma | #type:#check"
	static let blnurology = "#id:chkurology | #title:Major Gyn/Urology | #type:#check"
	static let blnknee = "#id:chkknee | #title:TKR | #type:#check"
	static let blnhip = "#id:chkhip | #title:THR | #type:#check"
	static let blnHPS = "#id:chkHPS | #title:Hip Fracture | #type:#check"
	static let blncancer = "#id:chkcancer | #title:Spine Surgery | #type:#check"
	static let blnspinal = "#id:chkspinal | #title:Spinal Cord Injury | #type:#check"
	static let blnacute = "#id:chkacute | #title:Medical Illness | #type:#disclosureControl"
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> DVT/PE Diagnosis/Prevention -> Medical Illness
	static let blnhemoptysis = "#id:chkhemoptysis | #title:Hemoptysis | #type:#check"
	static let blnunilateral = "#id:chkunilateral | #title:Unilateral Lower Limb Pain | #type:#check"
	static let blnswelling = "#id:chkswelling | #title:Painful Deep Venous Palpation and Edema | #type:#check"
	static let blnactivecancer = "#id:chkactivecancer | #title:Active Cancer | #type:#check"
	static let blnPVTE = "#id:chkPVTE | #title:Previous VTE | #type:#check"
	static let blnRF = "#id:chkRF | #title:Respiratory Failure | #type:#check"
	static let blnthrombo = "#id:chkthrombo | #title:Already Known Thrombophilic Condition | #type:#check"
	static let blnrecent = "#id:chkRecent | #title:Recent (≤ 1mo) Trauma and/or Surgery | #type:#check"
	static let blnreduced = "#id:chkReduced | #title:Reduced Mobility, Anticipated ≥ 3 days | #type:#check"
	static let blnhormone = "#id:chkhormone | #title:Ongoing Hormonal Treatment | #type:#check"
	static let blninfection = "#id:chkinfection | #title:Acute Infection and/or Rheumatologic Disorder | #type:#check"
	
	
	
	// CurrentPast CV Profile -> Thromboembolic/VKA -> Thromboembolic Prevention -> Acute CVA https://zpl.io/2nDyiB (Android)
	static let nihss = "#id:nihss | #title:txtNIHSS | #type:#integerRight | #min:0 | #max:42 | #placeholder: "
	static let unilateralWeakness = "#id:chkunilateral_Weakness | #title:Unilateral Weakness | #type:#check"
	static let speechDisturbance = "#id:chkspeech_disturbance | #title:Speech Disturbance | #type:#check"
	static let durationOfSymptoms = "#id:ssdur | #title:Duration of Symptoms | #type:#integerRight | #min:0 | #max:24 | #placeholder: "
	static let preHospitalCare = "#id:chkpreh | #title:Pre Hospital Care | #type:#check"
	
	// CurrentPast CV Profile -> Ventricular Tachyarrthymias https://zpl.io/Lgyc4
	static let nsvt = "#id:chkNSVT | #title:NSVT | #type:#check"
	static let monomorphicVT = "#id:chkMVT | #title:Monomorphic VT | #type:#check"
	static let repetitiveMonomorphicVT = "#id:chkRMVT | #title:Repetetive Monomorphic VT | #type:#check"
	static let polymorphicVT = "#id:chkPVT | #title:Polymorphic VT | #type:#check"
	static let torsades = "#id:chkTors | #title:Torsades | #type:#check"
	static let incessantVT = "#id:chkIVT | #title:Incessant VT | #type:#check"
	static let idiopathicVT = "#id:chkidioVT | #title:Idiopathic VT | #type:#check"
	
	// CurrentPast CV Profile -> Bradyarrthymia
   static let clinicalSynscopeBradyarrthymia = "#id:clinicalSynscope | #title:Clinical Synscope | #type:#check"
	static let symptomaticSinusNodeDysfunction = "#id:chkSinusNodeDysfunction | #title:Symptomatic Sinus Node Dysfunction | #type:#check"
	static let highGradeAVNodeDisease = "#id:chkAVNodeDisease | #title:High Grade AV Node Disease | #type:#check"
	static let isolatedNeurocardionegicUnexplainedSyncope = "#id:chkVasoDepressorSyncope | #title:Isolated Neurocardionegic / Unexplained Syncope | #type:#check"
	static let carotidSinusHypersensitivity = "#id:chkCarotidSinusHypersensitivity | #title:Carotid Sinus Hypersensitivity | #type:#check"
	static let pots = "#id:chkPosturalOrthostatisTac | #title:POTS (Enter Standing Heart Rate) | #type:#check"
	static let autonomicFailureSyndrome = "#id:chkAutonomicFailureSyndrome | #title:Autonomic Failure Syndrome | #type:#check"
	static let historyOfCardiacArrest = "#id:chkHistCardArrest | #title:History of Cardiac Arrest | #type:#check"
	static let brugadaSyndrome = "#id:chkBrugadaSyndrome | #title:Brugada Syndrome | #type:#check"
	static let longQT = "#id:chkLongQT | #title:LongQT | #type:#check"
	static let sarcoidosisGiantCellChagas = "#id:chksarc | #title:Sarcoidosis / Giant Cell / Chagas | #type:#check"
	
	// CurrentPast CV Profile -> Valvular Heart Disease
	
	static let newonsetAF = "#id:chknewonsetAF | #title:New Onset Atrial Fibrilation | #type:#check"
	static let aorticStenosis = "#id:chkAorticStenosis | #title:Aortic Stenosis | #type:#check"
	static let secvalvular = "#id:secvalvular | #title:Valvular | #type:#check"
	static let calcAortValve = "#id:chkCalcAortValve | #title:Calcified Aortic Valve Reduced Systolic Opening / Giant Cell / Chagas | #type:#check"
	static let reumaticAV = "#id:chkreumaticAV | #title:RHeumatic AV | #type:#check"
	static let congenStenAortValve = "#id:chkCongenStenAortValve | #title:Congenitally Stenotic Aortic Valve | #type:#check"
	static let calcAortValveArea = "#id:txtCalcAortValveArea | #title:Calculated Aortic Valve Area | #type:#check"
	static let aortMeanPressGradient = "#id:txtAortMeanPressGradient | #title:Aortic Mean Pressure Gradient | #type:#check"
	static let aortValveVel = "#id:txtAortValveVel | #title:Aortic Valve Velocity | #type:#check"
	static let strokeVolIndex = "#id:txtStrokeVolIndex | #title:Stroke Volume Index | #type:#check"
	static let indexedValveArea = "#id:txtIndexedValveArea | #title:Indexed Valve Area | #type:#check"
	static let aortRootDiameter = "#id:txtAortRootDiameter | #title:Biscuspid Aortic Root Diameter | #type:#check"
	
	static let mitralStenosis = "#id:chkMitralStenosis | #title:Mitral Stenosis | #type:#check"
	static let mVA  = "#id:txtMVA | #title:MVA | #type:#check"
	static let pHT = "#id:txtPHT | #title:PHT| #type:#check"
	static let rheumaticMV = "#id:chkrheumaticMV | #title:Rheumatic | #type:#check"
	static let favValveMorph = "#id:chkFavValveMorph | #title:Favorable Valve Morphology | #type:#check"
	
	
	static let lAClot = "#id:chkLAClot | #title:La Clot | #type:#check"
	static let pulmonicStenosis = "#id:chkPulmonicStenosis | #title:Pulmonic Stenosis | #type:#check"
	static let tricuspidStenosis = "#id:chkTricuspidStenosis | #title:Tricuspid Stenosis | #type:#check"
	static let pulValveVel = "#id:txtPulValveVel | #title:Pulmonic Valve Velocity | #type:#check"
	static let aorticRegurgitation = "#id:chkAorticRegurgitation | #title:Aortic Regurgitation | #type:#check"
	static let holodiastolicRev = "#id:chkHolodiastolicRev | #title:Holodiasrolic Flow Reversal | #type:#check"
	static let venaContractaWidth2 = "#id:txtVenaContractaWidth2 | #title:Vena Contracta Width | #type:#check"
	static let venaContractaWidth = "#id:txtVenaContractaWidth | #title:Vena Contracta Width Tri | #type:#check"
	static let regurVolume = "#id:txtRegurVolume | #title:Regurgitation Volume | #type:#check"
	static let regurFrac = "#id:txtRegurFrac | #title:Regurgitation Fraction | #type:#check"
	static let eRO = "#id:txtERO | #title:ERO | #type:#check"
	static let lVESd = "#id:txtLVESd | #title:LVESd  | #type:#check"
	static let lVEDd = "#id:txtLVEDd | #title:LVEDd  | #type:#check"
	
	static let aorticRootDiameter = "#id:txtAorticRootDiameter | #title:Aortic Root Diameter | #type:#check"
	static let mitralRegurgitation = "#id:chkMitralRegurgitation | #title:Primary Mitrl Regurgitation | #type:#check"
	static let tricuspidRegurgitation = "#id:chkTricuspidRegurgitation | #title:Tricuspid Regurgitation | #type:#check"
	static let annularDiameter = "#id:txtAnnularDiameter | #title:Annular Diameter | #type:#check"
	static let centralJetArea = "#id:txtCentralJetArea | #title:Central Jet Area | #type:#check"
	static let hepaticVeinFlowRev = "#id:chkHepaticVeinFlowRev | #title:Hepatic Vein Flow Reversal | #type:#check"
	static let abTVleaflet = "#id:chkabTVleaflet | #title:Abornormal TV Leaflets ABNORMAL_TV_LEAFLETS  | #type:#check"
	static let pulmonicRegurgitation = "#id:chkPulmonicRegurgitation | #title:Pulmonic Regurgiation | #type:#check"
	static let wideRegurJet = "#id:chkWideRegurJet | #title:Wide Regurfitant Jet | #type:#check"
	static let abnpulval = "#id:chkabnpulval | #title:Abnormal Pulmonic Valve Leaflets | #type:#check"
	static let valvular_surgery_risk = "#id:secvalvular_surgery_risk | #title:Valvular Surgery Risk | #type:#check"
	
	static let vavularRiskLabel = "#type:#label | #title: Risk Level | #id: checkLVHOnEKGIfApplicable"
	static let lowrisk = "#id:chklowrisk| #title:Low | #type:#check"
	static let intermediaterisk = "#id:chkintermediaterisk | #title:Intermediate| #type:#check"
	static let highrisk = "#id:chkhighrisk | #title:High | #type:#check"
	static let prohibitive = "#id:chkprohibitive | #title:Prohibitive  | #type:#check"
	static let other_surgical_risk = "#id:secother_surgical_risk | #title:Other Surgical Risk | #type:#check"
	
	static let vascular = "#id:chkvascular | #title:High Risk Supra Inguinal Vascular Surgery | #type:#check"
	static let lowriskelec = "#id:chklowriskelec| #title:Low Risk Cataract Plastic | #type:#check"
	static let cardiac = "#id:chkcardiac | #title:Other Cardiac | #type:#check"
	
	
	
	// CurrentPast CV Profile -> Vascular Disease https://zpl.io/Z1M98ld
	static let symptomaticCarotidDisease = "#id:symptomaticCarotidDisease | #title:Symptomatic Carotid Disease | #type:#disclosureWeather"
	static let periphericVascularDisease = "#id:periphericVascularDisease | #title:Peripheric Vascular Disease | #type:#disclosureWeather"
	static let abdomialAoritcAneurysm = "#id:abdomialAoritcAneurysm | #title:Abdomial Aoritc Aneurysm | #type:#disclosureWeather"
	 
	
	// CurrentPast CV Profile -> Vascular Disease -> Symptomatic Carotid Disease https://zpl.io/ZB3jN
	static let noncardioembolicVCATIAAssoicaedWithCarotidPlaque = "#id:chkNoncardioCVA | #title:Noncardioembolic VCA/TIA Assoicaed with Carotid Plaque | #type:#check"
	static let more50CarotidStenosisSPCEA = "#id:chkCEA| #title:≥ 50% Carotid Stenosis/ S/P CEA | #type:#check"
	static let noncardioembolicTIAAssoicaedWithCarotidPlaque = "#id:chkNoncardioTIA |#title:Noncardioembolic TIA Assoicaed with Carotid Plaque | #type:#check"
	
	// CurrentPast CV Profile -> Vascular Disease -> Peripheric Vascular Disease https://zpl.io/Z1UUorp (Android)
	static let abiLess09 = "#id:chkABI | #title:ABI < 0.9 | #type:#check"
	static let claudication = "#id:chkclaudication | #title:Claudication | #type:#check"
	static let criticalLimbIschemia = "#id:chkcritical | #title:Critical Limb Ischemia | #type:#check"
	static let endovascularRevascularization = "#id:chkbypass | #title:Endovascular Revascularization | #type:#check"
	static let peripheralArteryBypassGraft = "#id:chkBKbypass | #title:Peripheral Artery Bypass Graft | #type:#check"
	
	// CurrentPast CV Profile -> Vascular Disease -> Abdomial Aoritc Aneurysm https://zpl.io/Z2mwqrj
	static let aaDiameteMore5cm = "#id:chkAAdiameter| #title:AA Diameter > 5cm | #type:#check"
	static let thoracic = "#id:chkchkthoracic| #title:Thoracic aortic aneurysm | #type:#check"
	static let thoracoabdominal = "#id:chkthoracoabdominal| #title:Thoracoabdominal aortic aneurysm | #type:#check"
	
	// Major CV Risk Factors https://zpl.io/1OuArq
	static let diabetes = "#id:diabetes | #title:Diabetes | #type:#disclosureControl"
	static let systemicArterialHypertension = "#id:chkSAH | #title:Systemic Arterial Hypertension | #type:#disclosureControl" // WithCheck"
	static let tobaccoUse = "#id:chkSmoke | #title:Tobacco Use | #type:#check"
	static let familyHistory = "#id:chkFamily | #title:Family History | #type:#check"
	static let ckd = "#id:chkckd | #title:CKD | #type:#check"
	
	
	// Major CV Risk Factors -> Diabetes https://zpl.io/2lz31S
	static let typeIIDM = "#id:chkDM | #title:Type II DM | #type:#disclosureControl"
	static let typeIDM = "#id:chkDM1 | #title:Type I DM | #type:#disclosureControl"
	static let gestationalDM = "#id:chkgestational | #title:Gestational DM | #type:#check"
	static let retinopathy = "#id:chkRetinopathy | #title:Retinopathy | #type:#check"
	static let DMNP = "#id:chkDMNP | #title:Nephropathy | #type:#check"
	static let DMCKD = "#id:chkDMCKD| #title:CKD | #type:#check"
	static let DMother = "#id:chkDMother | #title:DMother | #type:#check"
	static let DMarthro = "#id:chkDMarthro | #title:Arthropathy | #type:#check"
	static let DMoral = "#id:chkDMoral| #title:Oral | #type:#check"
	static let DMskin = "#id:chkDMskin | #title:Skin| #type:#check"
	static let DMhypo = "#id:chkDMhypo | #title:Hypogycemia wo coma | #type:#check"
	static let DMhypocoma = "#id:chkDMhypocoma| #title:Hypoglycemia w coma | #type:#check"
	static let DMhyper = "#id:chkDMhyper | #title:Hyperglycemia | #type:#check"
	static let DMmono = "#id:chkDMmono | #title:Mononeuropathy| #type:#check"
	static let DMpoly = "#id:chkDMpoly| #title:Polyneuropathy | #type:#check"
	static let DMautonom = "#id:chkDMautonom | #title:Autonom neuro| #type:#check"
	static let DMangio = "#id:chkDMangio | #title:Angiopathy | #type:#check"
	static let DMothercirc = "#id:chkDMothercirc| #title:Other circulatory | #type:#check"
	static let DMgangrene = "#id:chkDMgangrene | #title:Gangrene | #type:#check"
	static let DMothercomp = "#id:chkDMothercomp | #title:Other comp| #type:#check"
	static let DMunspec = "#id:chkDMunspec| #title:Unspecified comp | #type:#check"
	static let DMwithout = "#id:chkDMwithout | #title:Without comp| #type:#check"
	
	// Major CV Risk Factors -> Systemic Arterial Hypertension https://zpl.io/18q0XF
	static let ambSBP = "#id:ASBP | #title:Amb SBP | #type:#integerRight | #min:80 | #max:190 | #placeholder: "
	static let ambDBP = "#id:ADBP | #title:Amb DBP | #type:#integerRight | #min:30 | #max:150 | #placeholder: "
	
	static let checkLVHOnEKGIfApplicableLabel = "#type:#label | #title: Check LVH on EKG if Applicable | #id: checkLVHOnEKGIfApplicable"
	static let sbpTreated = "#id:chkSBPTreated | #title:SBP Treated | #type:#check"
	static let africanAmerican = "#id:chkAA | #title:African American | #type:#check"
	
	static let primaryHypertensionLabel = "#type:#label | #title: Secondary Hypertension | #id: primaryHypertensionLabel"
	static let primaryHyperaldesteronism = "#id:chkaldo| #title:Primary Hyperaldesteronism | #type:#check"
	static let renovascularAtheroscleotic = "#id:chkrenovas| #title:Renovascular, Atheroscleotic | #type:#check"
	static let pheocromocytoma = "#id:chkFMD | #title:Pheocromocytoma | #type:#check"
	static let osa = "#id:chkOSA | #title:OSA | #type:#check"
	
	static let secondaryHypertensionLabel = "#type:#label | #title: Acutely Symptomatic | #id: secondaryHypertensionLabel"
	static let headachedBlurredVisionAMS = "#id:chkhead | #title:Headached, Blurred Vision or AMS | #type:#check"
	static let epistaxis = "#id:chkepis | #title:Epistaxis | #type:#check"
	static let chestBackPainDyspnea = "#id:chkCP | #title:Chest Back Pain/Dyspnea | #type:#check"
	
	// Surgical Risk https://zpl.io/1iVHSg
	static let emergencySurgery = "#id:chkemergency | #title:Emergency Surgery | #type:#check"
	static let intermediateRisk = "#id:chkelective | #title:Intermediate Risk | #type:#check"
	static let highRisk = "#id:chkvascular | #title:High Risk | #type:#check"
	// MARK: Get the full string
	static let familyLowRiskSurgery = "#id:chklowriskelec | #title:Family Low Risk Surgey (Cataract, Plastic) | #type:#check"
	static let unableToExercise = "#id:chkunab | #title:Unable to Exercise | #type:#check"
	// MARK: Need to clarify placeholder's string
	// MARK: 0-21, range
	static let mets = "#id:txtMETS | #title:METS | #type:#integerRight | #min:0 | #max:21 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// Calculated variable
	static let dukeActivityScoreIndex = "#id:txtDASI | #title:Duke Activity Score Index | #type:#integerRight | #min:0 | #max:99 | #placeholder: "
	
	// Laboratories https://zpl.io/2kxbQs
	static let chemBasicLabel = "#id:chemBasicLabel | #title:Chem Basic | #type:#label"
	// MARK: Need to clarify placeholder's string
	// MARK: 99-170, range (Integer)
	// MARK: Need to join two cells once the cell prototype is done
	static let nameqlValue = "#id:txtNameq | #title:Na meq/l |#type:#integerRightExpandable | #min:99 | #max:170 | #placeholder: "
	static let nameql = "#id:txtNa | #title:Na meq/l | #type:#disclosureControl"
	// MARK: Need to clarify placeholder's string
	// MARK: 2-9, range Double(?)
	static let kmeql = "#id:txtHomo | #title:K meq/l |#type:#decimalRight | #min:2.0 | #max:9.0 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 0.4-20, range Double
	static let creatinineMgDl = "#id:txtcreatinine | #title:Creatinine mg/dl |#type:#decimalRight | #min:0.4 | #max:20.0 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 6-200, range (Integer)
	static let bunMgDl = "#id:txtBUN | #title:BUN mg/dl |#type:#integerRight | #min:6 | #max:200 | #placeholder: "
  static let hco3 = "#id:txtHCO3 | #title:HCO3 meg/dl |#type:#integerRight | #min:6 | #max:200 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 35-1000
	static let fastingPlasmaGlucose = "#id:txtGlucose | #title:Glucose mg/dl |#type:#integerRight | #min:35 | #max:1000 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 5-120, (Integer), Set default to 120 if no value
	static let gfrMlMin173M2 = "#id:txtGFR | #title:GFR  |#type:#integerRight | #min:5 | #max:120 | #placeholder: "
	static let worseningRenalFx = "#id:chkWG | #title:Worsening Renal Fx | #type:#check"
	
	static let lipidProfileLabel = "#id:lipidProfileLabel | #title:Lipid Profile | #type:#label"
	static let alreadyOnStatin = "#id:chklready | #title:Already on Statin | #type:#check"
	static let statinIntolerance = "#id:chkstatint | #title:Statin Intolerance | #type:#check"
	
	static let cholesterol = "#id:txtCholesterol | #title:Cholesterol |#type:#integerRight | #min:40 | #max:500 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 25-25000, (Integer).
	static let trg = "#id:txtTRG | #title:TRG |#type:#integerRight | #min:25 | #max:25000 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 0-500, (Integer).
	static let ldlc = "#id:txtLDL | #title:LDL-C |#type:#integerRight | #min:0 | #max:500 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 1-200, (Integer).
	static let hdlc = "#id:txtHDL | #title:HDL-C |#type:#integerRight | #min:1 | #max:200 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 0-400, (Integer).
	static let apoB = "#id:txtApoB | #title:Apo B |#type:#integerRight | #min:0 | #max:400 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 100-5000, (Integer).
	static let ldlp = "#id:txtLDLP | #title:LDL-P |#type:#integerRight | #min:100 | #max:5000 | #placeholder: "
	// MARK: Need to clarify placeholder's string
	// MARK: 1-500, (Integer).
	static let lpaMgdl = "#id:txtLPA | #title:LPa mg/dl |#type:#integerRight | #min:1 | #max:500 | #placeholder: "
	static let ascvdRisk = "#id:txtASCVD | #title:ASCVD Risk |#type:#decimalRight | #min:0.1 | #max:30 | #placeholder: "
	
	static let othersLabel = "#id:othersLabel | #title:Others | #type:#label"
	static let hba1c = "#id:txtHBA1C | #title:HBA1C |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "
  static let albumin = "#id:txtHalbumin | #title:Albumin g/dl |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "
  static let ast = "#id:txtAst | #title:AST U/ml  |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "
  static let bilurubin = "#id:txtHBA1C | #title:Bilurubin mg/dl |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "
  static let hematocrit = "#id:txtHematocrit | #title:Hematocrit % |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "
  static let platelet = "#id:txtHematocrit | #title:Platelet K/ml |#type:#decimalRight | #min:4.9 | #max:19.99 | #placeholder: "

	static let crpMgl = "#id:txtCRP | #title:CRP mg/l |#type:#decimalRight | #min:0.1 | #max:30.0 | #placeholder: "
	static let ntProBNPPgMl = "#id:txtproBNP | #title:NT-proBNP pg/ml |#type:#integerRight | #min:50 | #max:100000 | #placeholder: "
	static let bnpPgMl = "#id:txtBNP | #title:BNP pg/ml |#type:#integerRight | #min:10 | #max:100000 | #placeholder: "
	// Comment: Defaulted in the presence of diabetes
	static let albuminuriaMgGmOrMg24hr = "#id:txtMICRO | #title:Albuminuria Mg.Gm or Mg/24hr |#type:#integerRight | #min:1 | #max:10000 | #placeholder: "
	
	static let urineNaMeql = "#id:txturineNa | #title:Urine Na meq/l |#type:#integerRight | #min:1 | #max:200 | #placeholder:  | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	static let serumOsmolality = "#id:txtsosm | #title:Serum Osmolality |#type:#integerRight | #min:200 | #max:400 | #placeholder:  | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	static let urineOsmolality = "#id:txtuosm | #title:Urine Osmolality |#type:#integerRight | #min:200 | #max:1000 | #placeholder:  | #dependsOn: nameqlValue| #dependMin: 99| #dependMax: 130"
	
	// Diagnostics https://zpl.io/ZcDQES
	static let ekg = "#id:chkEKG | #title:EKG | #type:#disclosureControl"
	static let stressTesting = "#id:chkDTS | #title:Stress Testing | #type:#disclosureControl"
	static let echocardiography = "#id:chkecho | #title:Echocardiography | #type:#disclosureControl"
	static let chestXRay = "#id:chestXRay | #title:Chest X-Ray | #type:#disclosureControl"
	static let rhc = "#id:rhc | #title:RHC | #type:#disclosureControl | #alert: Refer to Heart Failure Specialist for Management"
	// 0-100 range, percent
	static let coronaryCalciumScore = "#id:coronaryCalciumScore | #title:Coronary Calcium Score |#type:#integerRight | #min:0 | #max:100 | #placeholder: "
	// 0-100 range, unit
	static let total = "#id:total | #title:Total |#type:#integerRight | #min:0 | #max:10000 | #placeholder: "
	
	// Diagnostics -> EKG
	static let nsrInEKG = "#id:chkNSR| #title: Normal sinus rhtym| #type:#check"
	static let PSVTInEKG = "#id:chkPSVT| #title: SVT| #type:#check"
	static let urineNaMeqlInEKG = "#id:urineNaMeqlInEKG | #title:Urine Na meq/l |#type:#integerRight | #min:1 | #max:200 | #placeholder: "
	static let serumOsmolalityInEKG = "#id:serumOsmolalityInEKG | #title:Serum Osmolality |#type:#integerRight | #min:200 | #max:400 | #placeholder: "
	static let stDeviation05mm = "#id:chkST| #title:ST Deviation ≥ 0.5mm | #type:#check"
	static let stressTestingInEKG = "#id:stressTestingInEKG | #title:Stress Testing | #type:#check"
	static let tWaveInversion1mm = "#id:chkTWI | #title:T Wave Inversion > 1mm | #type:#check"
	static let lowVoltageQRS = "#id:chklowv | #title:Low Voltage QRS | #type:#check"
	static let abnormalQWaves = "#id:chkabnormq| #title:Abnormal Q Waves | #type:#check"
	static let lbbb = "#id:chkLBBB | #title:LBBB | #type:#check"
	
	static let lvh = "#id:chkLVH| #title:LVH | #type:#check"
	static let atrialPrematureDepolarization = "#id:chkAPCs | #title:Atrial Premature Depolarization | #type:#check"
	static let junctionalPrematureDepolarization = "#id:chkJPCs | #title:Junctional Premature Depolarization | #type:#check"
	static let frequentVentricularPacingOrEctopy = "#id:chkFreqVentPac | #title:Frequent Ventricular Pacing or Ectopy | #type:#check"
	static let infrequentVentricularPacingOrEctopy = "#id:chkinfreqvent  | #title:Infrequent Ventricular Pacing or Ectopy | #type:#check"
	static let wpw = "#id:chkWPW | #title:WPW | #type:#check"
	static let svt = "#id:chkSVT| #title:SVT | #type:#check"
	static let rbbb = "#id:chkRBBB | #title:RBBB | #type:#check"
	static let intraventicularBlock = "#id:chkIVCD| #title:Intraventicular Block | #type:#check"
	static let atrialFibrillationInEKG = "#id:chkatrialfib | #title:Atrial Fibrillation | #type:#check"
	static let atrialFlutter = "#id:chkflutter | #title:Atrial Flutter | #type:#disclosureControlExpandable"
	
	//n-----<<<---->>>----- new need the ids
	static let prDuration  = "#id:prDuration | #title:PR Duration |#type:#integerRight | #min:0 | #max:10000 | #placeholder: "
	static let qrsDuration = "#id:prDuration | #title:QRS Duration |#type:#integerRight | #min:0 | #max:10000 | #placeholder: "
	
	static let nonspecificSTAbnormality = "#id:chknonspesific | #title:Nonspecific ST Abnormality | #type:#check"
	
	static let firstDegreeAVBlock = "#id:chkfirstdegree | #title:1st Degree AV Block | #type:#check"
	static let secondDegreeAVBlock = "#id:chkseconddegree | #title:2nd Degree AV Block | #type:#disclosureControlExpandable"
	static let thirdDegreeAVBlock = "#id:chkthirdegree | #title:3rd Degree AV Block | #type:#check"
	
	// Diagnostics -> EKG -> LBBB https://zpl.io/Z2eRL98
	static let bifascicular = "#id:chkbifascicular | #title:Bifascicular | #type:#check"
	static let lahb = "#id:chkLAHB | #title:LAHB | #type:#check"
	static let lphb = "#id:chkLPHB | #title:LPHB | #type:#check"
	
	// Diagnostics -> EKG -> Atrial Flutter https://zpl.io/Zcjvv8
	static let typicalAF = "#id:chktypicalAF | #title:Typical AF | #type:#check"
	static let atypicalAF = "#id:chkatypicalAF | #title:Atypical AF | #type:#check"
	
	// Diagnostics -> EKG -> 2nd Degree AV Block https://zpl.io/Z1s6jIT
	static let type1 = "#id:chktype1 | #title:Type 1 | #type:#check"
	static let type2 = "#id:chktype2 | #title:Type 2 | #type:#check"
	
	
	// Diagnostics -> Stress Testing https://zpl.io/Z21VSc7
	// Integer, regex unknown
	static let dukeTreadmillScore = "#id:txtTTS | #title:Duke Treadmill Score |#type:#integerRight | #min:0 | #max:9999 | #placeholder: "
	// Integer, 0-99, range
	static let serumStressSummedScore = "#id:txtStressSummedScore | #title:Serum Stress Summed Score |#type:#integerRight | #min:0 | #max:99 | #placeholder: "
	// Integer, 0-200, range
	static let dseIschemicThreshold = "#id:txtDSE | #title:DSE Ischemic Threshold, %MPHR at the Onset of Ischemia |#type:#integerRight | #min:0 | #max:200 | #placeholder: "
	// Integer, 0-24, range
	static let dseOrStressMRI = "#id:txtWMA | #title:DSE or Stress MRI, Number of Segments with new WMA |#type:#integerRight | #min:0 | #max:24 | #placeholder: "
	// Integer, 0-99, range
	static let stressDifferenceScore = "#id:txtreversible | #title:Stress Difference Score |#type:#integerRight | #min:0 | #max:99 | #placeholder: "
	// Integer, 0-100, range
	static let percentIschemicMyocardiumonMPS = "#id:txtMPS | #title:% Ischemic Myocardium on MPS |#type:#integerRight | #min:0 | #max:100 | #placeholder: "
	// Integer, 1-21, range
	static let exTimeMin = "#id:txtExTimeMin | #title:Ex Time (min) |#type:#integerRight | #min:1 | #max:21 | #placeholder: "
	// Integer, 0-8
	static let maxSTMm = "#id:txtMaxST | #title:Max ST (mm) |#type:#integerRight | #min:0 | #max:8 | #placeholder: "
	// Integer, 0-2
	// MARK: cell type unclear.
	static let anginaIndex = "#id:rbAnginaIndex | #title:Angina Index |#type:#disclosureControl | #min:0 | #max:2 | #placeholder: "
	static let stElevation = "#id:chkSTelevation | #title:ST Elevation | #type:#check"
	static let abnormalBPResponse = "#id:chkabnormalBP | #title:Abnormal BP Response to Exercise | #type:#check"
	static let ventricularTachycardia = "#id:chkExVT | #title:Ventricular Tachycardia | #type:#check"
	static let prolongSTDepression = "#id:chkprolongedST | #title:Prolonged ST Depression | #type:#check"
	static let tidOrSignificantDysfunction = "#id:chkTID | #title:TID or Significant Stress-Induced LV Dysfunction | #type:#check"
	static let fixedPerfusionDefects = "#id:chkfixed  | #title:Fixed Perfusion Defects or Akinetic/Dyskinetic WMA on DSE | #type:#disclosureControlExpandable"
	static let artifactualUninterpretableImages = "#id:chkuninterpret | #title:Artifactual/Uninterpretable Images | #type:#check"
	
	// Diagnostics -> Stress Testing -> Angina Index
	static let noAnginaDuringExercise = "#id:secno_angina_during_exercise| #title:No Angina During Exercise | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	static let nonLimitingAngina = "#id:secnon_limiting_angina | #title:Non-Limiting Angina | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	static let exerciseLimitingAngina = "#id:secexercise_limiting_angina | #title:Exercise Limiting Angina | #type:#radio | #group: (noAnginaDuringExercise, nonLimitingAngina, exerciseLimitingAngina)"
	
	// Diagnostics -> Stress Testing -> Fixed Perfusion Defects or Akinetic/Dyskinetic WMA on DSE
	static let viabilityPresent = "#id:chkviable | #title:Viability Present | #type:#check"
	
	// Diagnostics -> Echocardiography
	static let pericardialEffusion = "#id:chkpericardial | #title:Pericardial Effusion | #type:#check"
	static let rwma = "#id:chkRWMA | #title:RWMA | #type:#check"
	static let enlargedLAOrLVH = "#id:chkEnlargedLA | #title:Enlarged LA or LVH | #type:#check"
	static let ea05AndDTMore280ms = "#id:chkLVeccenticity | #title:E/A < 0.5 and DT > 280ms | #type:#check"
	static let gradeMore2DiastolicDysfunction = "#id:chkMPI | #title:Grade ≥ 2 Diastolic Dysfunction | #type:#check"
	static let respiratoryIVSShift = "#id:IVshift | #title:Respiratory IVS Shift | #type:#check"
	static let mitralEVariation = "#id:chkmitralE | #title:Mitral E Variation | #type:#check"
	static let hepaticVeinExpDiastolicReversal = "#id:chkhepatic | #title:Hepatic Vein Exp Diastolic Reversal | #type:#check"
	static let enlargedRA = "#id:chkEnlargedRA | #title:Enlarged RA | #type:#check"
	static let enlargedRV = "#id:chkEnlargedRV | #title:Enlarged RV | #type:#check"
	static let midsystolicNotch = "#id:chkmidsystolicn | #title:Midsystolic Notch | #type:#check"
	
	// 1-30, range
	static let lvLaterealAnnulusEE = "#id:txtMP | #title:LV Latereal Annulus E/E' |#type:#integerRight | #min:1 | #max:30 | #placeholder: "
	// 10-80, range
	static let lvefInEchocardiography = "#id:txtEF | #title:LVEF |#type:#integerRight | #min:10 | #max:80 | #placeholder: "
	// 1-6, range
	static let trjVelocityMsec = "#id:txtTRJ | #title:TRJ Velocity m/sec |#type:#integerRight | #min:1 | #max:6 | #placeholder: "
	
	// Diagnostics -> Chest X-Ray https://zpl.io/Z2uefQH
	static let rightPleuralEffusion = "#id:chkRPLE | #title:Right Pleural Effusion | #type:#check"
	static let leftPleuralEffusion = "#id:chkLPLE | #title:Left Pleural Effusion | #type:#check"
	static let pulmonaryEdema = "#id:chkpuledema  | #title:Pulmonary Edema | #type:#check"
	static let enlargedCardiacSolhouette = "#id:chkenlarcar | #title:Enlarged Cardiac Silhouette | #type:#check"
	static let widenedMediasteneum = "#id:chkWidened | #title:Widened Mediasteneum | #type:#check"
	static let pneumothorax = "#id:chkpneumothorax | #title:Pneumothorax | #type:#check"
	
	// PO Meds https://zpl.io/Z1JXQFi
	static let bBlocker = "#id:chkcar | #title:B Blocker | #type:#disclosureControl"
	static let acelARB = "#id:chkace | #title:Acel/ARB | #type:#disclosureControl"
	static let poDiuretic = "#id:chkdiuretic | #title:PO Diuretic | #type:#disclosureControl"
	static let ccbOtherVasolidators = "#id:chkCCB | #title:CCB| #type:#check"
	static let currentVKATherapy = "#id:chkVKA| #title:Current VKA Therapy | #type:#check"
	static let directThrombinInhibitors = "#id:chkCAC  | #title:Direct Thrombin Inhibitors | #type:#check"
	static let factorXaInhibitors = "#id:chkFactorX  | #title:Factor Xa Inhibitors | #type:#check"
	
	// PO Meds -> B Blocker https://zpl.io/Z1Fk3YB
	static let carvedilol3125bid = "#id:chkBisoprolol25 | #title:Carvedilol 3.125 bid | #type:#check"
	static let carvedilol625bid = "#id:chkCarvedilol625bid | #title:Carvedilol 6.25 bid | #type:#check"
	static let carvedilol125bid = "#id:chkCarvedilol125bid | #title:Carvedilol 12.5 bid | #type:#check"
	static let carvedilol25bid = "#id:chkCarvedilol25bid | #title:Carvedilol 25 bid | #type:#check"
	static let metoproloIER25qd = "#id:chkBisoprolol5 | #title:MetoproloIER 25 qd | #type:#check"
	static let metoproloIER50qd = "#id:chkMetoproloIER50qd | #title:MetoproloIER 50 qd | #type:#check"
	static let metoproloIER100qd = "#id:chkMetoproloIER100qd | #title:MetoproloIER 100 qd | #type:#check"
	static let metoproloIER150qd = "#id:chkMetoproloIER150qd | #title:MetoproloIER 150 qd | #type:#check"
	static let metoproloIER200qd = "#id:chkMetoproloIER200qd | #title:MetoproloIER 200 qd | #type:#check"
    static let bisopro25 = "#id:chkbisopro25 | #title:Bisoprolol2.5qd | #type:#check"
    static let bisopro5 = "#id:chkbisopro5 | #title:Bisoprolol5qd | #type:#check"
    static let bisopro10 = "#id:chkbisopro10 | #title:Bisoprolol10qd| #type:#check"
	
	
	// PO Meds -> Acel/ARB
    static let enalapril5 = "#id:chkenalapril5 | #title:Enalapril<=10 | #type:#check"
    static let enalapril10 = "#id:chkenalapril10 | #title:Enalapril>10 | #type:#check"
    static let ramipril5 = "#id:chkenalapril5 | #title:Ramipril>5 | #type:#check"
    static let ramipril25 = "#id:chkenalapril10 | #title:Ramipril<=5 | #type:#check"
	static let lisinopril5 = "#id:chklisinopril5 | #title:Lisinopril<=10 | #type:#check"
    static let lisinopril10 = "#id:chklisinopril10 | #title:Lisinopril>10 | #type:#check"
    static let losartan25 = "#id:chklosartan25 | #title:Losartan<=50 | #type:#check"
    static let losartan50 = "#id:chklosartan50 | #title:Losartan>50 | #type:#check"
    static let olmesartan10 = "#id:chkolmesartan10 | #title:Olmesartan<=10 | #type:#check"
    static let olmesartan20 = "#id:chkolmesartan20 | #title:Olmesartan>10 | #type:#check"
    static let valsartan80 = "#id:chkvalsartan80 | #title:Valsartan<=160 | #type:#check"
    static let valsartan160 = "#id:chkvalsartan160 | #title:Valsartan>160 | #type:#check"
    static let sacubitril24 = "#id:chksacubitril24 | #title:Sacubitril/Val24 | #type:#check"
    static let sacubitril49 = "#id:chksacubitril49 | #title:Sacubitril/Val49 | #type:#check"
    static let sacubitril97 = "#id:chksacubitril97 | #title:Sacubitril/Val97 | #type:#check"
    
    
    
	static let chklisinopril10 = "#id:chklisinopril10| #title:Lisinopril10-20mg qd | #type:#check"
	static let chklisinopril20 = "#id:chklisinopril20 | #title:Lisinopril20mg qd | #type:#check"
	
	
	// PO Meds -> PO Diuretic https://zpl.io/1FSlBB
	static let furosemide40 = "#id:chkfurosemide40 | #title:Furosemide 40 | #type:#check"
	static let furosemide80 = "#id:chkfurosemide80 | #title:Furosemide 80 | #type:#check"
	static let furosemide80Plus = "#id:chkfurosemide81 | #title:Furosemide 80+ | #type:#check"
	static let bumex1 = "#id:chkbumex1 | #title:Bumex 1 | #type:#check"
	static let bumex2 = "#id:chkbumex2 | #title:Bumex 2 | #type:#check"
	static let bumex2Plus = "#id:chkbumex3 | #title:Bumex 2+ | #type:#check"
	static let torsemide20 = "#id:chktorsemide20 | #title:Torsemide 20 | #type:#check"
	static let torsemide40 = "#id:chktorsemide40 | #title:Torsemide 40 | #type:#check"
	static let torsemide50Plus = "#id:chktorsemide50 | #title:Torsemide 50+ | #type:#check"
	static let hctz = "#id:chkHCTZ | #title:HCTZ | #type:#check"
	static let indapamide = "#id:chkindapamide | #title:Indapamide | #type:#check"
	static let chlorthalidoneMetolazone = "#id:chkchlorthalidone | #title:Chlorthalidone, Metolazone |#type:#check"
	
	// In Hospital/IV Therapies https://zpl.io/1QwAhq
	static let ivAntiarrythmic = "#id:chkIVAA | #title:IV Antiarrythmic | #type:#disclosureControl"
	static let urgentCV = "#id:chkurgcv | #title:Urgent CV | #type:#check"
	static let defibrillationACLS = "#id:chkdefib | #title:Defibrillation/ACLS | #type:#check"
	static let ivAntihypertensive = "#id:chkIVHT | #title:IV Antihypertensive | #type:#disclosureControl"
	static let ivVasoactive = "#id:chkIVVA | #title:IV Vasoactive | #type:#disclosureControl"
	static let ivDiuretic = "#id:chkIVDI | #title:IV Diuretic | #type:#disclosureControl"
	static let mechanicalVentiallationOrNIPPV = "#id:chkNIPPV | #title:Mechanical Ventiallation or NIPPV | #type:#disclosureControl"
	// 23-100, range
	static let o2Supplement = "#id:txtOsupp | #title:O₂ Supplement % / | #type:#check | #type:#integerRight | #min:23 | #max:100 | #placeholder:  "
	static let ivVasopressors = "#id:chkVAD | #title:IV Vasopressors | #type:#check"
	static let ultrafiltration = "#id:chkult | #title:Ultrafiltration | #type:#check"
	static let iabp = "#id:iabp | #title:IABP | #type:#check"
	static let temporaryPM = "#id:chkTPM | #title:Temporary PM | #type:#check"
	
	// In Hospital -> IV Antiarrythmic https://zpl.io/2f248Q
	static let continuousInAntiarrythmic = "#id:txtAAcon | #title:Continuous | #type:#check"
	static let bolusInAntiarrythmic = "#id:txtAAbolus | #title:Bolus | #type:#check"
	static let titrationInAntiarrythmic = "#id:txtAAtitr | #title:Titration | #type:#check"
	// 1-12, range
	static let monitoringFrequencyQhrInAntiarrythmic = "#id:txtAAmonitor | #title:Monitoring Frequency Q hr | #type:#integerRight | #min:1 | #max:12 | #placeholder: "
	static let transitionToPOAntiarrythmicInAntiarrythmic = "#id:chkPOAA | #title:Transition to PO Antiarrythmic | #type:#check"
	
	// In Hospital -> IV Antihypertensive https://zpl.io/DhPB6
	static let blnIVHTcon = "#id:chkHTcon | #title:Continuous | #type:#check"
	static let blnIVHTbolus = "#id:chkHTbolus | #title:Bolus | #type:#check"
	static let blnIVHTtitr = "#id:chkHTtitr | #title:Titration | #type:#check"
	// 1-12, range
	static let txtHTmonitor = "#id:txtHTmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: "
	
	// In Hospital -> IV Vasoactive https://zpl.io/Ll2Pm
	static let blnIVVAcon = "#id:chkVAcon | #title:Continuous | #type:#check"
	static let blnIVVAbolus = "#id:chkVAbolus | #title:Bolus | #type:#check"
	static let blnIVVAtitr = "#id:chkVAtitr | #title:Titration | #type:#check"
	// 1-12, range
	static let txtVAmonitor = "#id:txtVAmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: "
	static let blnIVNPSz = "#id:chkIVNPS | #title:IV NPS | #type:#check"
	static let blnIVNTG = "#id:chkIVNTG | #title:IV NTG | #type:#check"
	static let blnmilrinone = "#id:chkmilrinone | #title:IV Milrinone | #type:#check"
	
	// In Hospital -> IV Diuretic https://zpl.io/Z5hShw
	static let blncon = "#id:chkcon | #title:Continuous | #type:#check"
	static let blnPODI = "#id:chkPODI | #title:Intermittent | #type:#check"
	// 1-12, range
	static let txtmonitor = "#id:txtmonitor | #title:Monitoring Frequency Q hr  |#type:#integerRight | #min:1 | #max:12 | #placeholder: "
	
	// In Hospital -> Mechanical Ventillation or NIPPV https://zpl.io/2kgsB0
	static let txtRI = "#id:txtRI | #title:Respiratory Interventions Q Hr |#type:#integerRight | #min:1 | #max:6 | #placeholder: "
	
	// Heart Specialist Management
	
	static let bioPAHMain = "#id:bioPAHMain | #title:Bio/PAH Main | #type:#disclosureWeather"
	static let pah = "#id:pah | #title:PAH | #type:#disclosureWeather"
	static let valvularInHSM = "#id:valvularInHSM | #title:Valvular | #type:#disclosureWeather"
	static let advancedLHF = "#id:advancedLHF | #title:Advanced HF | #type:#disclosureWeather"
	static let echocardiographyInHSM = "#id:echocardiographyInHSM | #title:Echocardiography | #type:#disclosureWeather"
	static let laboratoryEKG = "#id:laboratoryEKG | #title:Laboratory/EKG | #type:#disclosureWeather"
	static let rhcInHSM = "#id:rhcInHSM | #title:RHC | #type:#disclosureWeather"
	
	static let pah1 = "#id:pah1 | #title:Page 1 | #type:#segment"
	static let pah2 = "#id:pah2 | #title:Page 2 | #type:#segment"
	static let pah3 = "#id:pah3 | #title:Page 3 | #type:#segment"
	
	
	
	
	
	
	// = "#id:x | #title:y | #type:#check | #min:0 | #max:150 | #placeholder:z"
	
	// = "#id:x | #title:y | #type:#disclosureSimple"
}
