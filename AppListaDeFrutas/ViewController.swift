//
//  ViewController.swift
//  AppListaDeFrutas
//
//  Created by Tiago Correia De Lima on 04/03/20.
//  Copyright © 2020 Tiago Correia De Lima. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    var vetFruta = ["Banana","Laranja","Limão","Uva","Lichia","Manga","Goiaba","Maçã","Mamão","Melancia"]
    let cellIdentifier = "TableCellFruta"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "FruitTableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: cellIdentifier)
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vetFruta.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruta = vetFruta[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FruitTableViewCell
        cell.configureCell(fruta)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SegueDescription", sender: vetFruta[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DescriptionViewController, let fruta = sender as? String {
            vc.fruta = fruta
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {}
}



