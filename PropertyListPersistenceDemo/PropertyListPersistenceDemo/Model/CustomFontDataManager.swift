//
//  CustomFontDataManager.swift
//  PropertyListPersistenceDemo
//
//  Created by Sam WU on 2021-07-16.
//

import Foundation

class CustomFontDataManager {
    
    private let dataFileName = "CustomFonts"
    
    private var sandboxURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.first!.appendingPathComponent(dataFileName)
    }
    
    var customFonts:[CustomFont] = []
    
    func add(_ newCustomFont: CustomFont) {
        let hasFontName = customFonts.contains { $0.fontName == newCustomFont.fontName }
        if !hasFontName {
            customFonts.append(newCustomFont)
        }
    }
    
    func delete(at index: Int) {
        customFonts.remove(at: index)
        writeToFile()
    }
    
    func writeToFile() -> Bool {
        var arrayDict = [[String: AnyObject]]()
        for currentCustomFont in customFonts {
            var dict = [String: AnyObject]()
            dict["fontName"] = currentCustomFont.fontName as AnyObject
            dict["fontSize"] = currentCustomFont.fontSize as AnyObject
            arrayDict.append(dict)
        }
        return (arrayDict as NSArray).write(to: sandboxURL, atomically: true)
    }
    
    func readFromFile() {
        customFonts.removeAll()
        guard let plistArray = NSArray(contentsOf: sandboxURL),
              let arrayDict = plistArray as? [[String: AnyObject]]
        else { return }
        
        for currentDict in arrayDict {
            var newCustomFont = CustomFont()
            newCustomFont.fontName = currentDict["fontName"] as! String
            newCustomFont.fontSize = Int(truncating: currentDict["fontSize"] as! NSNumber)
            customFonts.append(newCustomFont)
        }
    }
    
    init() {
        
        let sandboxPath = sandboxURL.path
        if !FileManager.default.fileExists(atPath: sandboxPath) {
            guard let bundlePath = Bundle.main.path(forResource: dataFileName, ofType: "plist")
            else { return }
            do {
                try FileManager.default.copyItem(atPath: bundlePath, toPath: sandboxPath)
                print("Successfully copied data file from bundle to sandbox")
            } catch {
                print("Error copying file \(error)")
            }
        }
        
        readFromFile()
    }
    
    
}
