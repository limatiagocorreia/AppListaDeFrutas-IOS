//
//  descriptionViewController.swift
//  AppListaDeFrutas
//
//  Created by Tiago Correia De Lima on 10/03/20.
//  Copyright © 2020 Tiago Correia De Lima. All rights reserved.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController{
    
    @IBOutlet var imageFruta: UIImageView!
    @IBOutlet weak var lblFruta: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var blurView: UIView!
    
    var fruta: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageFruta.layer.cornerRadius = self.imageFruta.frame.width/2
        self.imageFruta.image = UIImage(named: fruta)
        self.lblFruta.text = fruta
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.frame = view.bounds
        
        blur.translatesAutoresizingMaskIntoConstraints = false
        blurView.insertSubview(blur, at: 0)
        
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToViewController", sender: self)
    }
}
