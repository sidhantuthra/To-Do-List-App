//
//  ViewController.swift
//  To-Do List
//
//  Created by Sidhant Uthra on 12/18/16.
//  Copyright © 2016 Sidhant Uthra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIAlertViewDelegate {
    
    var tasks : [String] = []
    @IBOutlet var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var myValue : Int? = "".toInt()
        //var theValue : Int! = "".toInt()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        if !(cell != nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit style: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if style != .delete {
            return
        }
        tasks.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != 1 {
            return
        }
        tasks.append((alertView.textField(at: 0)?.text)!)
        tableView?.reloadData()
    }
   
    @IBAction func addPressed(_: AnyObject?) {
        let alert = UIAlertView(title: "Add Item", message: "Enter the content of your item", delegate: self, cancelButtonTitle: "Cancel")
        alert.addButton(withTitle: "OK")
        alert.alertViewStyle = .plainTextInput
        alert.show()
    }
    
}
