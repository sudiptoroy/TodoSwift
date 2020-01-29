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
    
    var list = [Lists]()
    var tasks = [Tasks]()
    var task = Tasks(context: PersistenceService.context)
    @IBOutlet weak var tableView: UITableView!
    
    var list_name = Lists ()
    var numberOfCellsTable:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCellsTable = list_name.child_tasks?.count ?? 0
        return numberOfCellsTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        print((list_name.child_tasks?.allObjects[indexPath.row] as! Tasks).task_name)
        //cell.textLabel?.text =  (list_name.child_tasks?.allObjects[indexPath.row] as AnyObject).task_name
        //cell.textLabel?.text = (list_name.child_tasks?.allObjects[indexPath.row])
        return cell
    }

}
