//
//  FontLIstViewController.swift
//  CustomFontsManagerApp
//
//  Created by Sam WU on 2021-07-19.
//

import UIKit

class FontLIstViewController: UIViewController {
    
    let dataManager = CustomFontDataManager()
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var fontCollectionView: UICollectionView!
    
    @IBAction func unwindCancelFontDetail(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindSaveFontDetail(segue: UIStoryboardSegue) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontCollectionView.dataSource = self
        fontCollectionView.delegate = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let fontDetailVC = segue.destination as? FontDetailViewController
        else { return }
        // Pass the selected object to the new view controller.
        fontDetailVC.editIndex = selectedIndexPath!.item
        fontDetailVC.editMode = true
        fontDetailVC.editCustomFont = dataManager.customFonts[fontDetailVC.editIndex]
    }
    

}

extension FontLIstViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.customFonts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fontCell", for: indexPath) as! FontCollectionViewCell
        
        let currentFont = dataManager.customFonts[indexPath.item]
        cell.fontNameLabel?.text = currentFont.fontName
        cell.fontNameLabel.font = UIFont(name: currentFont.fontName, size: CGFloat(currentFont.fontSize))
        cell.fontSizeLabel?.text = "\(currentFont.fontSize)"
        
        return cell
    }

}

extension FontLIstViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "manualEditSegue", sender: self)
    }
}
