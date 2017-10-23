//
//  ViewController.swift
//  VinylCollector
//
//  Created by Liam Burdett on 23/10/2017.
//  Copyright © 2017 Outlier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{

    @IBOutlet weak var tableView: UITableView!
    
    var records : [Record] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       do {
       records = try context.fetch(Record.fetchRequest())
        tableView.reloadData()
       } catch {
    
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let record = records[indexPath.row]
        cell.textLabel?.text = record.artist
        cell.imageView?.image = UIImage(data: record.image as! Data)
        return cell 
    }
    
}
