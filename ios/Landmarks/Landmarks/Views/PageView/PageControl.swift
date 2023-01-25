//
//  PageControl.swift
//  Landmarks
//
//  Created by rhino Q on 2023/01/25.
//

import SwiftUI
import UIKit

struct PageControl:UIViewRepresentable {
    var numberOfPages:Int
    @Binding var currentPage:Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl{
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentpage(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator:NSObject {
        var control:PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentpage(sender:UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
