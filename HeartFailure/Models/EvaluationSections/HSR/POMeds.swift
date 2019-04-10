//
//  POMeds.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/14/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import Foundation

class POMeds: EvaluationItem {
	let bBlocker = BBlocker(literal: Presentation.bBlocker)
	let acelARB = AcelARB(literal: Presentation.acelARB)
	let poDiuretic = PODiuretic(literal: Presentation.poDiuretic)
	let ccbOtherVasolidators = EvaluationItem(literal: Presentation.ccbOtherVasolidators)
	let currentVKATherapy = EvaluationItem(literal: Presentation.currentVKATherapy)
	let directThrombinInhibitors = EvaluationItem(literal: Presentation.directThrombinInhibitors)
	let factorXaInhibitors = EvaluationItem(literal: Presentation.factorXaInhibitors)
	
	override var items: [EvaluationItem] {
		return [
			bBlocker,
			acelARB,
			poDiuretic,
			ccbOtherVasolidators,
			currentVKATherapy,
			directThrombinInhibitors,
			factorXaInhibitors
		]
	}
}

class AcelARB: EvaluationItem {
	let enalapril5 = EvaluationItem(literal: Presentation.enalapril5)
	let enalapril10 = EvaluationItem(literal: Presentation.enalapril10)
	let ramipril5 = EvaluationItem(literal: Presentation.ramipril5)
    let ramipril25 = EvaluationItem(literal: Presentation.ramipril25)
    let lisinopril5 = EvaluationItem(literal: Presentation.lisinopril5)
    let lisinopril10 = EvaluationItem(literal: Presentation.lisinopril10)
    let losartan25 = EvaluationItem(literal: Presentation.losartan25)
    let losartan50 = EvaluationItem(literal: Presentation.losartan50)
    let olmesartan10 = EvaluationItem(literal: Presentation.olmesartan10)
    let olmesartan20 = EvaluationItem(literal: Presentation.olmesartan20)
    let valsartan80 = EvaluationItem(literal: Presentation.valsartan80)
    let valsartan160 = EvaluationItem(literal: Presentation.valsartan160)
    let sacubitril24 = EvaluationItem(literal: Presentation.sacubitril24)
    let sacubitril49 = EvaluationItem(literal: Presentation.sacubitril49)
    let sacubitril97 = EvaluationItem(literal: Presentation.sacubitril97)
	 
	override var items: [EvaluationItem] {
		return [
			enalapril5,
			enalapril10,
			ramipril5,
			ramipril25,
			lisinopril5,
			lisinopril10,
			losartan25,
			losartan50,
			olmesartan10,
			olmesartan20,
			valsartan80,
			valsartan160,
			sacubitril24,
			sacubitril49,
			sacubitril97
		]
	}
}

class BBlocker: EvaluationItem {
	let carvedil3125 = EvaluationItem(literal: Presentation.carvedilol3125bid)
    let carvedil625 = EvaluationItem(literal: Presentation.carvedilol625bid)
    let carvedil125 = EvaluationItem(literal: Presentation.carvedilol125bid)
    let carvedil25 = EvaluationItem(literal: Presentation.carvedilol25bid)
    let metopro25 = EvaluationItem(literal: Presentation.metoproloIER25qd)
    let metopro50 = EvaluationItem(literal: Presentation.metoproloIER50qd)
    let metopro100 = EvaluationItem(literal: Presentation.metoproloIER100qd)
    let metopro150 = EvaluationItem(literal: Presentation.metoproloIER150qd)
    let metopro200 = EvaluationItem(literal: Presentation.metoproloIER200qd)
    let bisopro25 = EvaluationItem(literal: Presentation.bisopro25)
    let bisopro5 = EvaluationItem(literal: Presentation.bisopro5)
    let bisopro10 = EvaluationItem(literal: Presentation.bisopro10)
    
    override var items : [EvaluationItem] {
        return [
            carvedil3125,
            carvedil625,
            carvedil125,
            carvedil25,
            metopro25,
            metopro50,
            metopro100,
            metopro150,
            metopro200,
            bisopro25,
            bisopro5,
            bisopro10
        ]
    }
}

class PODiuretic: EvaluationItem {
	let furosemide40 = EvaluationItem(literal: Presentation.furosemide40)
	let furosemide80 = EvaluationItem(literal: Presentation.furosemide80)
	let furosemide80Plus = EvaluationItem(literal: Presentation.furosemide80Plus)
	let bumex1 = EvaluationItem(literal: Presentation.bumex1)
	let bumex2 = EvaluationItem(literal: Presentation.bumex2)
	let bumex2Plus = EvaluationItem(literal: Presentation.bumex2Plus)
	let torsemide20 = EvaluationItem(literal: Presentation.torsemide20)
	let torsemide40 = EvaluationItem(literal: Presentation.torsemide40)
	let torsemide50Plus = EvaluationItem(literal: Presentation.torsemide50Plus)
	let hctz = EvaluationItem(literal:Presentation.hctz)
	let indapamide = EvaluationItem(literal: Presentation.indapamide)
	let chlorthalidoneMetolazone = EvaluationItem(literal: Presentation.chlorthalidoneMetolazone)
	
	override var items: [EvaluationItem] {
		return [
			furosemide40,
			furosemide80,
			furosemide80Plus,
			bumex1,
			bumex2,
			bumex2Plus,
			torsemide20,
			torsemide40,
			torsemide50Plus,
			hctz,
			indapamide,
			chlorthalidoneMetolazone
		]
	}
}
