//
//  CronogramaViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit
import CoreData
protocol CronogramaViewControllerDelegate{
    func updateHistorial(name: String,ruc: String)
}
class CronogramaViewController: UIViewController {
    var delegate : CronogramaViewControllerDelegate?
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var rucTF: UITextField!
    
    @IBAction func add(sender: AnyObject) {
        guard let ruc = rucTF.text, name = nameTF.text where ruc != "" && name != "" else{
            return
        }
        print(ruc,name)
        if delegate != nil {
            delegate?.updateHistorial(name, ruc: ruc)
        }
        nameTF.text = ""
        rucTF.text = ""
        nameTF.resignFirstResponder()
        rucTF.resignFirstResponder()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
