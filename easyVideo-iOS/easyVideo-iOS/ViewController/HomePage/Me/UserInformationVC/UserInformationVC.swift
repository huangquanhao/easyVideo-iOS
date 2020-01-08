//
//  UserInformationVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class UserInformationVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tab: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initContent()
        
        createBackItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = NormalWithImgCell.cellWithTableViewForUserInformationVC(tableView, indexRow: indexPath.row)
            return cell
        }else if indexPath.row == 1 {
            let cell = NormalCell.cellWithTableViewForUserInformationVC(tableView, indexRow: indexPath.row)
            return cell
        }else if (indexPath.row == 7) {
            let cell = LoginOutCell.cellWithTableView(tableView, indexRow: indexPath.row)
            return cell
        }else {
            let cell = NormalWithLbCell.cellWithTableViewForUserInformationVC(tableView, indexRow: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7 {
            return 65
        }else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else if indexPath.row == 1 {
            modifyDisPlayNameAction()
        }else if indexPath.row == 7 {
            
        }
    }

}
