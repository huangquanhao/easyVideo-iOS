//
//  CloudJoinVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/4.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class CloudJoinVC: BaseViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var meetingNumberTF: LimitTextField!
    @IBOutlet weak var nameTF: LimitTextField!
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var micPhoneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initContent()
    }

}
