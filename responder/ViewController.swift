//
//  ViewController.swift
//  responder
//
//  Created by Vasiliy Chistyakov on 24.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    let view1: CustomView = {
        let view = CustomView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        return view
    }()
    
    let view2: CustomView = {
        let view = CustomView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 30, y: 70, width: 150, height: 150)
        return view
    }()
    
    let view3: CustomView = {
        let view = CustomView()
        view.backgroundColor = .black
        view.frame = CGRect(x: 125, y: 70, width: 50, height: 50)
//        view.frame = CGRect(x: 70, y: 70, width: 50, height: 50)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    
   private func setupUI() {
       view.addSubview(view1)
       view1.addSubview(view2)
       view2.addSubview(view3)
    }
    
    private func bind() {
        view1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        view2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        view3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
    }
    
    @objc
    private func tap1() {
        print("tap1")
    }
    
    @objc
    private func tap2() {
        print("tap2")
    }
    
    @objc
    private func tap3() {
        print("tap3")
    }
}

