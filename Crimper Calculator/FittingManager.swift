//
//  FittingManager.swift
//  Crimper Calculator
//
//  Created by Peter Wright on 12/3/16.
//  Copyright © 2016 Mona Wright. All rights reserved.
//

import Foundation

final class FittingManager {
    static let sharedInstance: FittingManager = FittingManager()
    
    var onePieceFittings:[OnePieceFitting] = []
    var hoseTypes:[String] = []
    var dashSizes:[String] = []
    var ferrules:[String] = []
    var fittingPrefixes:[String] = []
    var crimperNumbers:[String] = []
    
    func fitting(hoseType: String?, dashSize: String?, ferrule: String?, fittingPrefix: String?, crimperNumber: String?) -> OnePieceFitting? {
        let filteredFittings = onePieceFittings.filter { (currentFitting:OnePieceFitting) -> Bool in
            if hoseType != nil && !hoseType!.isEmpty && currentFitting.hoseType != hoseType {
                return false
            }
            if dashSize != nil && !dashSize!.isEmpty && currentFitting.dashSize != dashSize {
                return false
            }
            if ferrule != nil && !ferrule!.isEmpty && currentFitting.ferrule != ferrule {
                return false
            }
            if fittingPrefix != nil && !fittingPrefix!.isEmpty && currentFitting.fittingPrefix != fittingPrefix {
                return false
            }
            if crimperNumber != nil && !crimperNumber!.isEmpty && currentFitting.crimperNumber != crimperNumber {
                return false
            }
            return true
        }
        return filteredFittings.first
    }
    
    private init(){
        //TODO: Load these from file
        addFitting(hoseType: "TR1SN", dashSize: "04", ferrule: "C122", fittingPrefix: "1SN", crimperNumber: "0.90", dieColor: "16", crimpOD: "0.665")
        addFitting(hoseType: "TR1SN", dashSize: "05", ferrule: "C122", fittingPrefix: "1SN", crimperNumber: "0.80", dieColor: "19", crimpOD: "0.780")
    }
    
    private func addFitting(hoseType: String, dashSize: String, ferrule: String, fittingPrefix: String, crimperNumber: String, dieColor: String, crimpOD: String) {
        onePieceFittings.append(OnePieceFitting(hoseType: hoseType, dashSize: dashSize, ferrule: ferrule, fittingPrefix: fittingPrefix, crimperNumber: crimperNumber, dieColor: dieColor, crimpOD: crimpOD))
        hoseTypes.append(hoseType)
        dashSizes.append(dashSize)
        ferrules.append(ferrule)
        fittingPrefixes.append(fittingPrefix)
        crimperNumbers.append(crimperNumber)
    }
    
    
}
