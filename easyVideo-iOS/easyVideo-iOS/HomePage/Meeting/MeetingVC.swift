//
//  MeetingVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class MeetingVC: BaseViewController {

    @IBOutlet weak var companyLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PresentLoginVCPage(animated: true, presentStyle: .fullScreen)
        
    }
    
}
