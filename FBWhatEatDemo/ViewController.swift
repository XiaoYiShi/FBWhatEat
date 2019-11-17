//
//  ViewController.swift
//  FBWhatEatDemo
//
//  Created by 史晓义 on 2019/11/17.
//  Copyright © 2019 FeatherBrowser. All rights reserved.
//

import UIKit
import FBWhatEat

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .red
        btn.frame = .init(x: 100, y: 300, width: 100, height: 100)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(aaa), for: .touchUpInside)
    }
    @objc func aaa() {
        self.navigationController?.pushViewController(VC_SmallTool_foot(), animated: true)
    }

}

