//
//  NewViewController.swift
//  TABLEVIEW
//
//  Created by Стас Дашкевич on 4/22/20.
//  Copyright © 2020 Стас Дашкевич. All rights reserved.
//

import UIKit

class NewViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", deskription: "", isFavorite: false)
    
    @IBOutlet weak var EMOJI: UITextField!
    
    @IBOutlet weak var NAME: UITextField!
    
    @IBOutlet weak var DESCRIPTION: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        saveButtonupdate()
        
    }
 
    private func saveButtonupdate(){
        let emojiText = EMOJI.text ?? ""
        let nameText = NAME.text ?? ""
        let descriptionText = DESCRIPTION.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI(){
        EMOJI.text = emoji.emoji
        NAME.text = emoji.name
        DESCRIPTION.text = emoji.deskription
    }
    
    @IBAction func actionField(_ sender: UITextField) {
        saveButtonupdate()
        
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "savesegua" else {return}
        let emojii = EMOJI.text ?? ""
        let namee = NAME.text ?? ""
        let descriptionn = DESCRIPTION.text ?? ""
        
        self.emoji = Emoji(emoji: emojii, name: namee, deskription: descriptionn, isFavorite: self.emoji.isFavorite)
        
    }
}
