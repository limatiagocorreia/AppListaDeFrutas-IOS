//
//  ViewController.swift
//  AppListaDeFrutas
//
//  Created by Tiago Correia De Lima on 04/03/20.
//  Copyright © 2020 Tiago Correia De Lima. All rights reserved.
//

import UIKit


class Fruta {
    var nome:String
    var preço:Double
    init(_ nome:String,_ preço:Double) {
        self.nome = nome
        self.preço = preço
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableview: UITableView!
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
    
    var Banana:Fruta = Fruta("Banana", 0.0)
    var Laranja:Fruta = Fruta("Laranja", 0.0)
    var Limão:Fruta = Fruta("Limão", 0.0)
    var Uva:Fruta = Fruta("Uva", 0.0)
    var Lichia:Fruta = Fruta("Lichia", 0.0)
    var Manga:Fruta = Fruta("Manga", 0.0)
    var Goiaba:Fruta = Fruta("Goiaba", 0.0)
    var Maçã:Fruta = Fruta("Maçã", 0.0)
    var Mamão:Fruta = Fruta("Mamão", 0.0)
    var Melancia:Fruta = Fruta("Melancia", 0.0)
    
    var vetFruta:[Fruta] = []
    var carrinho: [Fruta] = []
    
    let cellIdentifier = "TableCellFruta"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vetFruta = [Banana,Laranja,Limão,Uva,Lichia,Manga,Goiaba,Maçã,Mamão,Melancia]
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.register(UINib(nibName: "FruitTableViewCell", bundle: self.nibBundle), forCellReuseIdentifier: cellIdentifier)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vetFruta.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruta = vetFruta[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FruitTableViewCell
        cell.configureCell(fruta.nome)

        cell.addToCart = { [self] in
            self.carrinho.append(fruta)
            print(fruta.nome)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SegueDescription", sender: vetFruta[indexPath.row].nome)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DescriptionViewController, let fruta = sender as? String {
            vc.fruta = fruta
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {}
}



