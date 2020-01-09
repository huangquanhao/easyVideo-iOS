//
//  ModifyPasswordVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/9.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class ModifyPasswordVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var block : (()->())?
    
    @IBOutlet weak var tab: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createBackItem()
        
        self.initContent()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NormalWithTFCell.cellWithTableViewForModifyPasswordVC(tableView, indexPath)
        if indexPath.section == 0 {
            cell.cellTitleLb.text = "alert.modifyp.accout".localized
            cell.cellTF.text = PlistUtils.loadPlistFilewithFileName(userPlist)[username] as? String
            cell.cellTF.isEnabled = false
        }else {
            if indexPath.row == 0 {
                cell.cellTitleLb.text = "alert.modifyp.password".localized
                cell.cellTF.placeholder = "alert.modifyp.input".localized
            }else if indexPath.row == 1 {
                cell.cellTitleLb.text = "alert.modifyp.againpassword".localized
                cell.cellTF.placeholder = "alert.modifyp.againinput".localized
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(formHexString: "0xf7f7f7")
    }

}
