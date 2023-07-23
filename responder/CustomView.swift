//
//  CustomView.swift
//  responder
//
//  Created by Vasiliy Chistyakov on 24.07.2023.
//

import Foundation
import UIKit


final class CustomView: UIControl {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let viewAvailable = findPointsInsideView(parent: self, point: point, event: event) {
            return viewAvailable
        }
        if self.point(inside: point, with: event) {
            return self
        }
        
        return nil
    }
    
    private func findPointsInsideView(parent: UIView, point: CGPoint, event: UIEvent?) -> UIView? {
        let allChilds = parent.subviews
        
        guard allChilds.count > 0 else {
            return nil
        }
        
        for chilView in allChilds.reversed() {
            let modifiedPoint = parent.convert(point, to: chilView)
            if chilView.point(inside: modifiedPoint, with: event){
                if let foundView = findPointsInsideView(parent: chilView, point: modifiedPoint, event: event) {
                    return foundView
                } else {
                    return chilView
                }
            }
        }
        
        return nil
        
    }
}
