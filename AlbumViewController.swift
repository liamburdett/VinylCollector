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
    
    @IBOutlet weak var artistTextField: UITextField!
    
    @IBOutlet weak var albumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
        // Do any additional setup after loading the view.


    @IBAction func addTapped(_ sender: UIButton) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
}
