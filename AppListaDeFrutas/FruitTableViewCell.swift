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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.miniImageFruta.layer.cornerRadius = self.miniImageFruta.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(_ fruta: String) {
        self.lblFruta.text = fruta
        self.miniImageFruta.image = UIImage(named: fruta)
    }
    
    func configureImage(_ fruta: String) {
    }
    
}
