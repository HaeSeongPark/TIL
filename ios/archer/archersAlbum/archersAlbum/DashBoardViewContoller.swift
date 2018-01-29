//
//  DashBoardViewContoller.swift
//  archersAlbum
//
//  Created by rhino Q on 2018. 1. 27..
//  Copyright © 2018년 rhino Q. All rights reserved.
//  주석달기 : 설명 어떻게 하지?

import UIKit

class DashBoardViewContoller: UIViewController, UIPageViewControllerDataSource {

    @IBOutlet weak var PageView: UIView!
    
    var ContentImageData = [String]()
    var ContentTextData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data //
        
        ContentImageData = ["card1","card2","card3","card4"]
        ContentTextData = ["1 Page", "2 Page", "3 Page", "4 Page"]
        
        let selectedNumber = UserDefaults.standard.object(forKey: "selectedNumber") as! Int
        
        let InitialView = ContentVCIndex(index: selectedNumber)  as Content
        let ViewController = NSArray(object: InitialView)
        
        
        let PageVC = self.storyboard?.instantiateViewController(withIdentifier: "PageVC") as! UIPageViewController
        PageVC.view.frame = PageView.bounds
        PageView.addSubview(PageVC.view)
        addChildViewController(PageVC)
        PageVC.didMove(toParentViewController: self)
        
        PageVC.dataSource = self
        PageVC.setViewControllers(ViewController as? [UIViewController], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Page View Start
    func ContentVCIndex(index:Int) -> Content{
        
        if ContentTextData.count == 0 || index >= ContentTextData.count{
            return Content()
        }
        
        let ContentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! Content
        ContentVC.PageIndex = index
        ContentVC.ContentImage = ContentImageData[index]
        ContentVC.ContentText = ContentTextData[index]
        
        return ContentVC
    }
    // MARK: - Page View End
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        if PageIndex == 0 || PageIndex == NSNotFound{
            return nil
        }
        
        PageIndex -= 1
        
        return ContentVCIndex(index: PageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let ContentVC = viewController as! Content
        var PageIndex = ContentVC.PageIndex as Int
        
        if PageIndex == NSNotFound{
            return nil
        }
        
        PageIndex += 1
        
        if PageIndex == ContentTextData.count{
            return nil
        }
        
        return ContentVCIndex(index: PageIndex)
    }
    
}
