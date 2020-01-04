//
//  PrivateLoginVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class PrivateLoginVC: BaseViewController {

    @IBOutlet weak var serverTF: UITextField!
    @IBOutlet weak var accoutTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var advancedSetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initContent()
    }

}
