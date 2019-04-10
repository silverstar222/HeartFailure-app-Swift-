//
//  HeartFailure.swift
//  CVDEvaluator
//
//  Created by bogdankosh on 2/6/17.
//  Copyright © 2017 SilverStar. All rights reserved.
//

import UIKit

class HeartFailure: EvaluationItem {
    let history = History(literal: Presentation.history)
    let etiology = Etiology(literal: Presentation.etiology)
    let clinical = Clinical(literal: Presentation.clinical)
    let ahastage = AHAStage(literal: Presentation.ahastage)
    let hometherapeutics = Hometherapeutics(literal: Presentation.hometherapeutics)
    let acutely = Acutely(literal: Presentation.acutely)
    let inhospitaltherapies = InHospitalTherapies(literal: Presentation.inhospitaltherapies)
    let discharge = Discharge(literal: Presentation.discharge)

	override var items: [EvaluationItem] {
		return [
            history,
            etiology,
            clinical,
            ahastage,
            hometherapeutics,
            acutely,
            inhospitaltherapies,
            discharge
		]
	}
}

class History : EvaluationItem {
    let newonset = EvaluationItem(literal: Presentation.newOnsetHF)
    let chronicHF = EvaluationItem(literal: Presentation.chronicHF)
    let hfdiagnosis = EvaluationItem(literal: Presentation.hfDiagnosisDurationPerWeek)
    let oneormorehf = EvaluationItem(literal: Presentation.oneormorehf)
    let twounscheduled = EvaluationItem(literal: Presentation.twounscheduled)
    let chestpain = EvaluationItem(literal: Presentation.chestpain)
    let weightgain = EvaluationItem(literal: Presentation.weightGain)
    let dyspneaonexe = Dyspneaonexe(literal: Presentation.dyspneaonexe)
    let dyspneaatrest = EvaluationItem(literal: Presentation.dyspneaAtRestOrphopnea)
    let spicd = EvaluationItem(literal: Presentation.spicd)
    let spbivppm = EvaluationItem(literal: Presentation.spbivppm)
    let spppmrv = EvaluationItem(literal: Presentation.spppmrv)
    
    override var items : [EvaluationItem] {
        return [
            newonset,
            chronicHF,
            hfdiagnosis,
            oneormorehf,
            twounscheduled,
            chestpain,
            weightgain,
            dyspneaonexe,
            dyspneaatrest,
            spicd,
            spbivppm,
            spppmrv
        ]
    }
}

class Dyspneaonexe : EvaluationItem {
    let class1 = EvaluationItem(literal: Presentation.class1)
    let class2 = EvaluationItem(literal: Presentation.class2)
    let class3 = EvaluationItem(literal: Presentation.class3)
    
    override var items: [EvaluationItem]{
        return [
            class1,
            class2,
            class3
        ]
    }
    
}

class Etiology : EvaluationItem {
    let idiopathic = EvaluationItem(literal: Presentation.idiopathicDCMNonischemic)
    let postmi = EvaluationItem(literal: Presentation.postMIMore45Days)
    let ischemic = EvaluationItem(literal: Presentation.ischemicPostMILess45Day)
    let cardiotoxins = Cardiotoxins(literal: Presentation.cardiotoxis)
    let familialcmp = EvaluationItem(literal: Presentation.familiarCMPSuddenDeath)
    let valvular = EvaluationItem(literal: Presentation.valvularHeartDisease)
    let rvdysplasia = EvaluationItem(literal: Presentation.rvDysplasia)
    let hocm = HOCM(literal: Presentation.hocm)
    let myocarditis = EvaluationItem(literal: Presentation.myocarditis)
    
    override var items: [EvaluationItem] {
        return [
            idiopathic,
            postmi,
            ischemic,
            cardiotoxins,
            familialcmp,
            valvular,
            rvdysplasia,
            hocm,
            myocarditis
        ]
    }
}

class Cardiotoxins : EvaluationItem {
    let radiationtherapy = RadiationTherapy(literal: Presentation.radiationtherapy)
    let antracyclines = EvaluationItem(literal: Presentation.antracyclines)
    let antiher2 = EvaluationItem(literal: Presentation.antiher2)
    let alkylating = EvaluationItem(literal: Presentation.alkylating)
    let immuno = EvaluationItem(literal: Presentation.immuno)
    let protease = EvaluationItem(literal: Presentation.protease)
    let thyrosine = EvaluationItem(literal: Presentation.thyrosine)
    let atezo = EvaluationItem(literal: Presentation.atezo)
    let vegf = EvaluationItem(literal: Presentation.vegf)
    
    override var items: [EvaluationItem] {
        return [
            radiationtherapy,
            antracyclines,
            antiher2,
            alkylating,
            immuno,
            protease,
            thyrosine,
            atezo,
            vegf
        ]
    }
}

class RadiationTherapy: EvaluationItem {
    let anteriorchest = EvaluationItem(literal: Presentation.anteriorchest)
    let tumor = EvaluationItem(literal: Presentation.tumor)
    let shield = EvaluationItem(literal: Presentation.shield)
    let highdosert = EvaluationItem(literal: Presentation.highdosert)
    let cumulative = EvaluationItem(literal: Presentation.cumulative)
    let concomitant = EvaluationItem(literal: Presentation.concomitant)
    
    override var items: [EvaluationItem] {
        return [
            anteriorchest,
            tumor,
            shield,
            highdosert,
            cumulative,
            concomitant
        ]
    }
}

class HOCM : EvaluationItem {
    let lvhmore = EvaluationItem(literal: Presentation.lvmore)
    let abnormalbp = EvaluationItem(literal: Presentation.abnormalBPResponse)
    let historysudden = EvaluationItem(literal: Presentation.historysudden)
    let restdynamic = EvaluationItem(literal: Presentation.restDynamicPeakLVOT)
    
    override var items : [EvaluationItem] {
        return [
            lvhmore,
            abnormalbp,
            historysudden,
            restdynamic
        ]
    }
}

class Clinical : EvaluationItem {
    let lvef = EvaluationItem(literal: Presentation.lvef)
    let rasat = EvaluationItem(literal: Presentation.rasat)
    let vo2sat = EvaluationItem(literal: Presentation.vo2sat)
    let hjr = EvaluationItem(literal: Presentation.hepatojulularRefluxInPhysicalExam)
    let jugular = EvaluationItem(literal: Presentation.jugularVenousDistentionInPhysicalExam)
    let edema = EvaluationItem(literal: Presentation.edemaInPhysicalExam)
    let leftside = EvaluationItem(literal: Presentation.leftSidedS3S4Gallop)
    let newrales = EvaluationItem(literal: Presentation.newRalesInPhysicalExam)
    let pulmonaryedema = EvaluationItem(literal: Presentation.pulmonaryEdema)
    let lowurine = EvaluationItem(literal: Presentation.lowurine)
    let anycns = EvaluationItem(literal: Presentation.anyCNSSymptomsInPhysicalExam)
    let coldclammy = EvaluationItem(literal: Presentation.coldClammyExtremitiesInPhysicalExam)
    let cyanosis = EvaluationItem(literal: Presentation.cyanosisInPhysicalExam)
    
    override var items : [EvaluationItem] {
        return [
            lvef,
            rasat,
            vo2sat,
            hjr,
            jugular,
            edema,
            leftside,
            newrales,
            pulmonaryedema,
            lowurine,
            anycns,
            coldclammy,
            cyanosis
        ]
    }
}

class AHAStage : EvaluationItem {
    let athighrisk = EvaluationItem(literal: Presentation.atHighRiskOfHF)
    let nosignsofhf = EvaluationItem(literal: Presentation.structuralHeartDeseaseNoSymptoms)
    let symptomsofhf = EvaluationItem(literal: Presentation.structuralHeartDeseaseSymptoms)
    let advancedhf = AdvancedHF(literal: Presentation.advancedHF)
    let nyhaclass1 = EvaluationItem(literal: Presentation.nyhaccvsClass1)
    let nyhaclass2 = EvaluationItem(literal: Presentation.nyhaccvsClass2)
    let nyhaclass3 = EvaluationItem(literal: Presentation.nyhaccvsClass3)
    let nyhaclass4 = EvaluationItem(literal: Presentation.nyhaccvsClass4)
    
    override var items: [EvaluationItem] {
        return [
            athighrisk,
            nosignsofhf,
            symptomsofhf,
            advancedhf,
            nyhaclass1,
            nyhaclass2,
            nyhaclass3,
            nyhaclass4
        ]
    }
    
}

class AdvancedHF : EvaluationItem {
    let calculatehfss = EvaluationItem(literal: Presentation.calculateHFSS)
    let noSignificantComorbidities = EvaluationItem(literal: Presentation.noSignificantComorbidities)
    let vo2maxkg = EvaluationItem(literal: Presentation.vo2maxkg)
    
    override var items : [EvaluationItem] {
        return [
            calculatehfss,
            noSignificantComorbidities,
            vo2maxkg
        ]
    }
}


class Hometherapeutics : EvaluationItem {
    let bblocker = BBlocker(literal: Presentation.bBlocker)
    let acelARB = AcelARB(literal: Presentation.acelARB)
    let poDiuretic = PODiuretic(literal: Presentation.poDiuretic)
    let currentvka = EvaluationItem(literal: Presentation.currentVKATherapy)
    let ccb = EvaluationItem(literal: Presentation.ccbOtherVasolidators)
    let vasodilator = EvaluationItem(literal: Presentation.vasodilator)
    
    override var items : [EvaluationItem] {
        return [
            bblocker,
            acelARB,
            poDiuretic,
            currentvka,
            ccb,
            vasodilator
        ]
    }
}

class Acutely : EvaluationItem {
    let day1 = EvaluationItem(literal: Presentation.day1)
    let day2 = EvaluationItem(literal: Presentation.day2)
    let day3 = EvaluationItem(literal: Presentation.day3)
    let predischarge = EvaluationItem(literal: Presentation.predischarge)
    
    override var items : [EvaluationItem] {
        return [
            day1,
            day2,
            day3,
            predischarge
        ]
    }
}

class InHospitalTherapies : EvaluationItem {
    let defibrill = EvaluationItem(literal: Presentation.defibrillationACLS)
    let urgentcv = EvaluationItem(literal: Presentation.urgentCV)
    let ivvasopressor = EvaluationItem(literal: Presentation.ivVasopressors)
    let ivvasoactive = IVVasoactive(literal: Presentation.ivVasoactive)
    let ivantia = IVAntiarrythmic(literal: Presentation.ivAntiarrythmic)
    let ivantihy = IVAntihypertensive(literal: Presentation.ivAntihypertensive)
    let ivdiur = IVDiuretic(literal: Presentation.ivDiuretic)
    let mechanicalven = MechanicalVentiallationOrNIPPV(literal: Presentation.mechanicalVentiallationOrNIPPV)
    let o2supplement = EvaluationItem(literal:Presentation.o2Supplement)
    let ultrafil = EvaluationItem(literal: Presentation.ultrafiltration)
    let iabp = EvaluationItem(literal: Presentation.iabp)
    let temporarypm = EvaluationItem(literal: Presentation.temporaryPM)
    let onmaximumtoleB = EvaluationItem(literal: Presentation.onmaximumtoleB)
    let onmaximumtole = EvaluationItem(literal: Presentation.onmaximumtole)
    let chronicinotro = EvaluationItem(literal: Presentation.chronicintro)
    let intermitt = EvaluationItem(literal: Presentation.intermitt)
    
    override var items: [EvaluationItem] {
        return [
            defibrill,
            urgentcv,
            ivvasopressor,
            ivvasoactive,
            ivantia,
            ivantihy,
            ivdiur,
            mechanicalven,
            o2supplement,
            ultrafil,
            iabp,
            temporarypm,
            onmaximumtoleB,
            onmaximumtole,
            chronicinotro,
            intermitt
        ]
    }
}

class Discharge : EvaluationItem {
    let dischargedaily = EvaluationItem(literal:Presentation.dischargedaily)
    let predischarge6mw = EvaluationItem(literal: Presentation.predischarge6mw)
    let predischargebnp = EvaluationItem(literal: Presentation.predischargebnp)
    let vo2max = EvaluationItem(literal: Presentation.vo2maxkg)
    let bblockerinto = EvaluationItem(literal: Presentation.bblockerinto)
    let noncardiac = EvaluationItem(literal: Presentation.noncardiac)
    
    override var items: [EvaluationItem] {
        return [
            dischargedaily,
            predischarge6mw,
            predischargebnp,
            vo2max,
            bblockerinto,
            noncardiac
        ]
    }
}

