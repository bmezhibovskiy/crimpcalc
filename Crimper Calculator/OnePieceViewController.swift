//
//  OnePieceViewController.swift
//  Crimper Calculator
//
//  Created by Peter Wright on 12/3/16.
//  Copyright © 2016 Mona Wright. All rights reserved.
//

import UIKit

class OnePieceViewController: UIViewController {
    
    @IBOutlet weak var hoseTypeTextField: UITextField!
    @IBOutlet weak var dashSizeTextField: UITextField!
    @IBOutlet weak var ferruleTextField: UITextField!
    
    var autoCompleteVC: AutocompleteViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateAutoCompleteVC(textField:UITextField, options:[String], filter:String) {
        if autoCompleteVC == nil {
            autoCompleteVC = self.storyboard?.instantiateViewController(withIdentifier: "AutocompleteViewController") as! AutocompleteViewController?
            autoCompleteVC.options = options
            autoCompleteVC.filter = filter
            autoCompleteVC.optionSelectedBlock = { [weak self] (_ selectedOption:String)->Void in
                textField.text = filter
                self?.navigationController!.dismiss(animated: true, completion: {
                    //Do nothing for now
                })
                self?.autoCompleteVC = nil
            }
            
            autoCompleteVC.modalPresentationStyle = .popover
            autoCompleteVC.popoverPresentationController?.delegate = self
            autoCompleteVC.popoverPresentationController?.sourceView = textField
            autoCompleteVC.popoverPresentationController?.sourceRect = textField.bounds
            
            self.present(autoCompleteVC, animated: true, completion: nil)
        }
            
        else if autoCompleteVC != nil {
            if filter.isEmpty {
                self.navigationController!.dismiss(animated: true, completion: nil)
                autoCompleteVC = nil
            }
            else {
                autoCompleteVC.filter = filter
            }
        }
    }
    
}

extension OnePieceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        var options:[String] = []
        
        if textField == hoseTypeTextField {
            options = ["T1A2","T1A3", "T1B1", "Q-T1A"] //TODO: Get from file
        }
        else if textField == dashSizeTextField {
            return true
        }
        else if textField == ferruleTextField {
            options = ["AF1","BF2", "CF3"]  //TODO: Get from file
        }
        
        updateAutoCompleteVC(textField: textField,
                             options: options,
                             filter: newText)
        
        return true
    }
}

extension OnePieceViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
