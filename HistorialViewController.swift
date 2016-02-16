//
//  HistorialViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit
import CoreData
var Users = [Dictionary<String,String>]()
class HistorialViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("Users") != nil{
            Users = NSUserDefaults.standardUserDefaults().objectForKey("Users") as! [Dictionary<String,String>]
        }
        print(Users)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Table datasource methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return Users.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        // fixed font style. use custom view (UILabel) if you want something different
        let user = Users[section]
        return user["name"]!.uppercaseString
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        let user = Users[indexPath.row]
        cell.textLabel?.text = user["ruc"]!
        //        cell.textLabel?.text = "toby"
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
