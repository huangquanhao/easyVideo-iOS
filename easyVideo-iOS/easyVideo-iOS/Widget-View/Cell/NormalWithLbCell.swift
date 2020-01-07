//
//  NormalWithLbCell.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class NormalWithLbCell: UITableViewCell {

    @IBOutlet weak var cellTitleLb: UILabel!
    @IBOutlet weak var cellDetailLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc static func cellWithTableViewForUserInformationVC(_ tableView: UITableView, indexRow row: Int) -> NormalWithLbCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NormalWithLbCell") as? NormalWithLbCell
        if (cell == nil) {
            cell = (Bundle.main.loadNibNamed("NormalWithLbCell", owner: self, options: nil)?.first as? UITableViewCell) as? NormalWithLbCell
        }
    
        if row == 2 {
            cell?.cellTitleLb.text = "账号"
        }else if row == 3 {
            cell?.cellTitleLb.text = "手机"
        }else if row == 4 {
            cell?.cellTitleLb.text = "邮箱"
        }else if row == 5 {
            cell?.cellTitleLb.text = "公司"
        }else if row == 6 {
            cell?.cellTitleLb.text = "部门"
        }
        
        return cell!
    }
    
}
