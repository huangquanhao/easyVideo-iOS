//
//  AboutVC.swift
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/6.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

import UIKit

class AboutVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var versionNumberLb: UILabel!
    @IBOutlet weak var companyCopyrightLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initContent()

        self.createBackItem()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NormalCell.cellWithTableViewForAboutVC(tableView, indexRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else if indexPath.row == 1 {
            
        }
    }

}
