//
//  ChatVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/3.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class ChatVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customNavItem()
        
        self.navigationItem.title = "聊天"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.showNav()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
