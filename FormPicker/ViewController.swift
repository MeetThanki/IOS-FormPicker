//
//  ViewController.swift
//  FormPicker
//
//  Created by Meet Thanki on 25/06/20.
//  Copyright © 2020 Meet Thanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.title = "Favorites Games"
        
        
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        if let selectedValue = UserDefaults.standard.string(forKey: "Game_Name"){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
            cell.detailTextLabel?.text = selectedValue
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        if cell.detailTextLabel?.text != UserDefaults.standard.string(forKey: "Game_Name"){
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "Game_Name")
        }
        
        cell.textLabel?.text = "Fav Games"
        
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController")
            as? SecondViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
}



