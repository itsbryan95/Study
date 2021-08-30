//
//  ViewController.swift
//  autofillName
//
//  Created by Bryan Lee on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    var nameKey = "name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        attemptToSetName()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        setName(name: textField.text ?? "")
        setNameFileManager(name: textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}


extension ViewController {
    
    func setName(name: String ) {
        UserDefaults.standard.setValue(name, forKey: "name")
    }
    
    func getName(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    enum DiskStorageError: Error {
        case missingFile
        case noData
    }
    
    func setNameFileManager(name: String) {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent("name.cache") else {
            fatalError()
        }
        
        guard let data = try? JSONEncoder().encode(name) else {
            fatalError()
        }
        
        do {
            try data.write(to: fileURL)
        } catch {
            fatalError()
        }
        
    }
    
    func getNameFileManager(key: String) throws -> String {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
            fatalError()
        }
        print(fileURL)
        
        guard let data = FileManager.default.contents(atPath: fileURL.path) else {
//            fatalError()
            throw DiskStorageError.noData
        }
        
        do {
            let object = try JSONDecoder().decode(String.self, from: data)
            return object
        } catch {
            fatalError()
        }
    }
    
    func fetchName(key: String) -> Any? {
//        guard let name = try? getName(key: key) else {
        guard let name = try? getNameFileManager(key: key) else {
            return nil
        }
        return name
    }
    
    func attemptToSetName() {
        if let name = fetchName(key: "name") {
            if let name = name as? String  {
                nameField.text = name
            }
        }
    }
}
