//
//  ContentViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    var pageViewController: PageViewController?{
        didSet{
            pageViewController?.pageDelegate = self
        }
    }
    var actual : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let pageViewController = segue.destinationViewController as? PageViewController {
            self.pageViewController = pageViewController
            
        }
    }
    @IBAction func valueChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("calculadora")
            pageViewController!.setViewControllers([vc!], direction: .Reverse, animated: true, completion: nil)
        } else if sender.selectedSegmentIndex == 1 && self.actual == 0 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("cronograma")
            pageViewController!.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
        }
        else if sender.selectedSegmentIndex == 1 && self.actual == 2 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("cronograma")
            pageViewController!.setViewControllers([vc!], direction: .Reverse, animated: true, completion: nil)
        }else{
            let vc = storyboard?.instantiateViewControllerWithIdentifier("historial")
            pageViewController!.setViewControllers([vc!], direction: .Forward, animated: true, completion: nil)
        }
        self.actual = self.segmento.selectedSegmentIndex
        print(self.actual)
    }
    
    @IBOutlet weak var segmento: UISegmentedControl!

}
extension ContentViewController: PageViewControllerDelegate{
    func pageViewController(pageViewController: PageViewController, didUpdatePageIndex index: Int) {
        print("protocolo recibido",index)
        self.segmento.selectedSegmentIndex = index
    }
}
//public func setEnabled(enabled: Bool, forSegmentAtIndex segment: Int)
