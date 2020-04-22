//
//  TableViewCell.swift
//  TABLEVIEW
//
//  Created by Стас Дашкевич on 4/22/20.
//  Copyright © 2020 Стас Дашкевич. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var Emoji: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Deskription: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(obect: Emoji){
        self.Emoji.text = obect.emoji
               self.Name.text = obect.name
               self.Deskription.text = obect.deskription
    }

}
