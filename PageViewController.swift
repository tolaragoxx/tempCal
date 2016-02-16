//
//  PageViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    var pages = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        let page1: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("calculadora")
        let page2: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("cronograma")
        let page3: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("historial")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        // Do any additional setup after loading the view.
    }
   
    //MARK: - DataSOurce methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else{
            return nil
        }
        guard pages.count > previousIndex else{
            return nil
        }
        return pages[previousIndex]
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        let pagesCount = pages.count
        guard pagesCount != nextIndex else{
            return nil
        }
        guard pagesCount > nextIndex else{
            return nil
        }
        return pages[nextIndex]
    }
}
