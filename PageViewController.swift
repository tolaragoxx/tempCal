//
//  PageViewController.swift
//  calTEmp
//
//  Created by Gonzalo on 15/02/16.
//  Copyright © 2016 doapps. All rights reserved.
//

import UIKit
import CoreData
class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    var pages = ["calculadora","cronograma","historial"]
    var pageDelegate: PageViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([viewControllerAtIndex(0)!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    //MARK: - Delegate methods
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        notifyTutorialDelegateOfNewIndex()
    }
   
    //MARK: - DataSource methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController.restorationIdentifier!) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else{
            return nil
        }
        guard pages.count > previousIndex else{
            return nil
        }
        return viewControllerAtIndex(previousIndex)
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        guard let currentIndex = pages.indexOf(viewController.restorationIdentifier!) else {
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
        return viewControllerAtIndex(nextIndex)
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController?{
        let vc = storyboard?.instantiateViewControllerWithIdentifier(pages[index])
        if pages[index] == "cronograma"{
            (vc as! CronogramaViewController).delegate = self
        }
        
        return vc
    }
    func scrollToViewController(viewController: UIViewController){
        setViewControllers([viewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true,completion:{ (finished) -> Void in
            // Setting the view controller programmatically does not fire
            // any delegate methods, so we have to manually notify the
            // 'tutorialDelegate' of the new index.
            self.notifyTutorialDelegateOfNewIndex()
        })

    }
    func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = pages.indexOf(firstViewController.restorationIdentifier!) {
                pageDelegate?.pageViewController(self,
                    didUpdatePageIndex: index)
        }
    }
}


protocol PageViewControllerDelegate{
    func pageViewController(pageViewController: PageViewController,didUpdatePageIndex index: Int)

}
extension PageViewController: CronogramaViewControllerDelegate{
    func updateHistorial(name: String, ruc: String) {
        print("protocolo recibido",name,ruc)
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        if let newUser = try? NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context){
            newUser.setValue(name, forKey: "name")
            newUser.setValue(ruc, forKey: "ruc")
            _ = try? context.save()
        }
        
        if let hist = storyboard?.instantiateViewControllerWithIdentifier("historial"){
            scrollToViewController(hist)
        }
    }
}



