//
//  ContentViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    var pageViewController: PageViewController? {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let pageViewController = segue.destinationViewController as? PageViewController {
            self.pageViewController = pageViewController
        }
    }
}
