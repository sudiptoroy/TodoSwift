//
//  ViewController.swift
//  Todo
//
//  Created by Sudipto Roy on 1/29/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var list = [Lists]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchRequest: NSFetchRequest<Lists> = Lists.fetchRequest()
        
        do {
            let list = try PersistenceService.context.fetch(fetchRequest)
            self.list = list
            self.tableView.reloadData()
        } catch {}
    }
    
    @IBAction func onPlusTapped () {
        let alert = UIAlertController(title: "Create New List", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "List name"
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            //let age = alert.textFields!.last!.text!
            let item = Lists(context: PersistenceService.context)
            item.list_name = name
            PersistenceService.saveContext()
            self.list.append(item)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = list[indexPath.row].list_name
        //cell.detailTextLabel?.text = ""
        return cell
    }
    
}

