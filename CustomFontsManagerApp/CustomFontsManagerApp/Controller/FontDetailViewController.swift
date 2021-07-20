//
//  FontDetailViewController.swift
//  CustomFontsManagerApp
//
//  Created by Sam WU on 2021-07-19.
//

import UIKit

class FontDetailViewController: UIViewController {
    
    let dataManager = CustomFontDataManager()
    var editMode = false
    var editIndex = 0
    var editCustomFont: CustomFont?

    @IBOutlet weak var fontNameTextField: UITextField!
    
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if editMode {
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
                dataManager.update(at: editIndex, updatedCustomFont: newCustomFont)
            } else {
                dataManager.add(&newCustomFont)
            }
           
            self.performSegue(withIdentifier: "manualSaveSegue", sender: self)
            
            // add logic to notify the collection to reload data
        }
        
    }
    
}
