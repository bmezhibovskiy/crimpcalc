//
//  ViewController.swift
//  Crimper Calculator
//
//  Created by Mona Wright on 10/19/16.
//  Copyright © 2016 Mona Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hoseIDTextField: UITextField!
    
    @IBOutlet weak var hoseODTextField: UITextField!
    
    @IBOutlet weak var fittingShankODTextField: UITextField!
    
    @IBOutlet weak var ferruleSleeveWallThicknessTextField: UITextField!
    
    @IBOutlet weak var compressionPercentageTextField: UITextField!
  
    @IBOutlet weak var answerTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .popover
        segue.destination.popoverPresentationController?.delegate = self
        segue.destination.popoverPresentationController?.sourceRect = (sender as! UIView).bounds
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {

        let hoseID =  Double(hoseIDTextField.text ?? "") ?? 0
        let hoseOD =  Double(hoseODTextField.text ?? "") ?? 0
        let fittingShankOD =  Double(fittingShankODTextField.text ?? "") ?? 0
        let ferruleSleeveWallThickness =  Double(ferruleSleeveWallThicknessTextField.text ?? "") ?? 0
        let compressionPercentage =  Double(compressionPercentageTextField.text ?? "") ?? 0
        let a = hoseOD - hoseID + fittingShankOD + (2.0 * ferruleSleeveWallThickness)
        let b = ( (-compressionPercentage) * (hoseOD - hoseID)/100.0)
        let answer = a + b
        let mm = answer * 25.4
        
        answerTextField.text = "\(answer)in \(mm)mm"
        
        //Crimp Diameter Formula = Hose OD - Hose ID + Shank OD + (2 x Ferrule/Sleeve Wall thickness) + (( - Compression Percentage) x (Hose OD - Hose ID)/100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
