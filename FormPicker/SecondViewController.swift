//
//  SecondViewController.swift
//  FormPicker
//
//  Created by Meet Thanki on 25/06/20.
//  Copyright © 2020 Meet Thanki. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let games = [
        "PUBG",
        "GTA V",
        "Fortnite",
        "Dota 2",
        "Apex Legends",
        "Rainbow Six Siege"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        if let label = cell?.textLabel?.text {
            UserDefaults.standard.set(label, forKey: "Game_Name")
            self.navigationController?.popViewController(animated: true)
        }
    
        
    }
}


extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let selectedvalue = UserDefaults.standard.string(forKey: "Game_Name"){
//            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            
            if selectedvalue == games[indexPath.row]{
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            }
            
        }
        
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
}
