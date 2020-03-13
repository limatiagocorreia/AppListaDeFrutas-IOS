//
//  FrutTableViewCell.swift
//  AppListaDeFrutas
//
//  Created by Tiago Correia De Lima on 10/03/20.
//  Copyright © 2020 Tiago Correia De Lima. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFruta: UILabel!
    @IBOutlet weak var miniImageFruta: UIImageView!
    @IBOutlet weak var btnAddCart: UIButton!
    
    var addToCart : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.miniImageFruta.layer.cornerRadius = self.miniImageFruta.frame.width/2
        self.miniImageFruta.layer.borderWidth = 0.5
        self.miniImageFruta.layer.borderColor = UIColor.black.cgColor
        self.lblFruta.layer.cornerRadius = 20
        self.lblFruta.layer.masksToBounds = true
        self.btnAddCart.layer.cornerRadius = 20
        self.btnAddCart.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func addCart(_ sender: UIButton) {
        addToCart?()
    }
    
    func configureCell(_ fruta: String) {
        self.lblFruta.text = fruta
        self.miniImageFruta.image = UIImage(named: fruta)
    }
}
