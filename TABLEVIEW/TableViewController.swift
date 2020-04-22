//
//  TableViewController.swift
//  TABLEVIEW
//
//  Created by Стас Дашкевич on 4/21/20.
//  Copyright © 2020 Стас Дашкевич. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var obejct = [
        Emoji(emoji: "🥰", name: "Love", deskription: "Love is good" , isFavorite: false),
        Emoji(emoji: "😎", name: "Brutal", deskription: "I am in glasses", isFavorite: false),
        Emoji(emoji: "😂", name: "Laugh", deskription: "I like my life", isFavorite: true)
   
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func unwidsegue(segue: UIStoryboardSegue){
        guard segue.identifier == "savesegua" else {return}
        let sourceVC = segue.source as! NewViewController
        let emoji = sourceVC.emoji
        if let selectedIP = tableView.indexPathForSelectedRow{
            obejct[selectedIP.row] = emoji
            tableView.reloadRows(at: [selectedIP], with: .fade)
        } else {
         let newIndexPath = IndexPath(row: obejct.count, section: 0)
        obejct.append(emoji)
        tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "edit" else {return}
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = obejct[indexPath.row]
        let navigationVc = segue.destination as! UINavigationController
        let newEmojiVc = navigationVc.topViewController as! NewViewController
        newEmojiVc.emoji = emoji
        newEmojiVc.title = "Edit"
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return obejct.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiSelf", for: indexPath) as! TableViewCell
        let obect = obejct[indexPath.row]
        cell.set(obect: obect)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
         
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            obejct.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let MoveEmoji = obejct.remove(at: sourceIndexPath.row)
        obejct.insert(MoveEmoji, at: destinationIndexPath.row )
        tableView.reloadData()
        
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favorite = favoriteTable(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done,favorite])
    }
    
    func doneAction (at indexPath:IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive , title: "DOne") { (action, view, completion) in
            self.obejct.remove(at: indexPath.row )
            self.tableView.deleteRows(at:[indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "delete.right.fill")
        return action
        
    }
    
    func favoriteTable (at indexPath:IndexPath) -> UIContextualAction{
        var object = obejct[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            object.isFavorite = !object.isFavorite
            self.obejct[indexPath.row] = object
            completion(true)
        
        }
        
        action.backgroundColor = object.isFavorite ? .systemRed : .systemGray
        action.image = UIImage(systemName: "heart")
        return action
    }
}
