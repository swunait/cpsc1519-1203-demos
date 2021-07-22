//
//  FontDetailViewController.swift
//  CustomFontsManagerApp
//
//  Created by Sam WU on 2021-07-19.
//

import UIKit

class FontDetailViewController: UIViewController {
    
    let dataManager = CustomFontDataManager.sharedDataManger
    var editMode = false
    var editIndex = 0
    var editCustomFont: CustomFont?

    @IBOutlet weak var fontNameTextField: UITextField!
    
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    
    
    @IBOutlet weak var fontIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if editMode {
            fontIdLabel.text = editCustomFont!.fontId ?? ""
            fontNameTextField.text = editCustomFont?.fontName
            fontSizeTextField.text = "\(editCustomFont!.fontSize)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveFontDetail(_ sender: UIBarButtonItem) {
        guard let fontName = fontNameTextField.text,
              let fontSizeString = fontSizeTextField.text,
              let fontSize = Int(fontSizeString)
        else { return }
        
        if fontName.isEmpty || fontSize < 10 {
            print("Font Name is required and Font Size must be 10 or greater")
        } else {
            var newCustomFont = CustomFont()
            newCustomFont.fontName = fontName
            newCustomFont.fontSize = fontSize
            if (editMode) {
                if dataManager.update(at: editIndex, updatedCustomFont: newCustomFont) {
                    print("Update was succcessful")
                } else {
                    print("Updated was not successful")
                }
            } else {
                if dataManager.add(&newCustomFont) {
                    print("Add was successful")
                } else {
                    print("Add was not successful")
                }
            }
           
            self.performSegue(withIdentifier: "manualSaveSegue", sender: self)
            
        }
        
    }
    
    
    @IBAction func deleteFont(_ sender: UIButton) {
        if editMode && editCustomFont != nil {
            if (dataManager.delete(at: editIndex)) {
                print("Delete was successful")
                self.performSegue(withIdentifier: "manualSaveSegue", sender: self)
            } else {
                print("Delete was not successful")
            }
        }
    }
    
    @IBAction func unwindSelectFont(segue: UIStoryboardSegue) {
        if let fontSelectVC = segue.source as? FontSelectViewController {
            fontNameTextField.text = fontSelectVC.selectedFontName
        }
    }
    
}
