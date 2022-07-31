//
//  PageControl.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/31.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var parent: PageControl
        
        init(_ control: PageControl) {
            parent = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            print("current: \(sender.currentPage)")
            parent.currentPage = sender.currentPage
        }
    }
}
