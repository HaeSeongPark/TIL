//
//  ViewController.swift
//  Let'Swift17Metal
//
//  Created by rhino Q on 06/01/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
// 물결 이후부터 해보기
//  ~17:33, 단일 텍스처 ex 카메라 필터, 물결 (19:14), swimming pool (user interaction with touch)
//  17:33 ~ 텍스처 + 텍스처 ex) 빗물표현(20:15)
//          view ex) view에 직접 후처리(물결, 필터 등), 구이?(끈적이는...)
import UIKit
import MetalKit

class ViewController: UIViewController {
    var renderer:Renderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mtkView = MTKView(frame: self.view.bounds)
        self.view.addSubview(mtkView)
        renderer = Renderer(mtkView: mtkView)
    }
}

