//
//  CloudLoginVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class CloudLoginVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var accoutTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initContent()
    }

}
