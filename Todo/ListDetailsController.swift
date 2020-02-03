//
//  ListDetailsController.swift
//  Todo
//
//  Created by Sudipto Roy on 1/29/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import UIKit
import CoreData

class ListDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var list = [Lists]()
    //var tasks = [Tasks]()
    //var task = Tasks(context: PersistenceService.context)
    @IBOutlet weak var tableView: UITableView!
    
    var list = Lists (context: PersistenceService.context)
    var numberOfCellsTable:Int = 0
    
    @IBOutlet weak var showListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(list)
        //showListLabel.text = list as? String
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPlusTapped () {
        let alert = UIAlertController(title: "Add a task", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Task name"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            //let age = alert.textFields!.last!.text!
            let task = Tasks(context: PersistenceService.context)
            task.task_name = name
            task.parent_list = self.list
            self.list.addToChild_tasks(task)
            
            PersistenceService.saveContext()
            //self.list.append(item)
//            self.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.tableView.reloadData()
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = list.child_tasks?.count ?? 0
        return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        print((list.child_tasks?.allObjects[indexPath.row] as! Tasks).task_name as Any)
        cell.textLabel?.text =  (list.child_tasks?.allObjects[indexPath.row] as! Tasks).task_name //(list_name.child_tasks?.allObjects[indexPath.row] as AnyObject).task_name
        //cell.textLabel?.text = (list_name.child_tasks?.allObjects[indexPath.row])
        return cell
    }

}
