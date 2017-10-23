//
//  AlbumViewController.swift
//  VinylCollector
//
//  Created by Liam Burdett on 23/10/2017.
//  Copyright © 2017 Outlier. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var albumImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var record : Record? = nil
    
    @IBOutlet weak var artistTextField: UITextField!
    
    @IBOutlet weak var albumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if record != nil {
            print("We have a record")
        } else {
            print("We have no record")
        }
    }
        // Do any additional setup after loading the view.


    @IBAction func addTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let record = Record(context: context)
        record.artist = artistTextField.text
        record.album = albumTextField.text
        record.image = UIImagePNGRepresentation(albumImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        albumImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
}
