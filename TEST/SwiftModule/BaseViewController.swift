//
//  BaseViewController.swift
//  TEST
//
//  Created by zhangjikuan on 2019/6/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        configUI();
    }
        
    /// configUI
    public func configUI() {

    }
}

class BaseViewController2: BaseViewController {

    override func configUI() {

    }
}
