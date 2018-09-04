//
//  ViewLifeCycleLoggingVC.swift
//  ContainerView
//
//  Created by rhino Q on 04/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa

class ViewLifeCycleLoggingVC: NSViewController {
    
    var name:String {
        return String(describing: type(of:self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(name) viewDidLoad")
        print("view: \(view.window)")
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        print("\(name) viewWillAppear")
        print("view: \(view.window)")
        view.window?.title = "title can chanced in here"
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print("\(name) viewDidAppear")

    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        print("\(name) viewWillLayout")

    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        print("\(name) viewDidLayout")

    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        print("\(name) viewWillDisappear")

    }
    
    override func viewDidDisappear() {
        super.viewDidDisappear()
        print("\(name) viewDidDisappear")

    }
}
