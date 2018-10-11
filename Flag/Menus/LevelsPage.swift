//
//  MainPage.swift
//  Flag
//
//  Created by lh on 2018/8/2.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit

class LevelsPage: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cent = UIScreen.main.bounds.width/100
    var myTableView :UITableView!
    var itTopTime = 0
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        navigationItem.title = "选择关卡"
        
        myTableView = UITableView(frame: UIScreen.main.bounds)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "section0cell0")
        myTableView.separatorStyle = .none
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 13*cent
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10*cent
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "选关只能破本关记录."
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rtCell = tableView.dequeueReusableCell(withIdentifier: "section0cell0", for: indexPath)
        let itFirst:Int? = userDefaults.value(forKey: "Level\(indexPath.row + 1)") as? Int
        let itSecond:Int? = userDefaults.value(forKey: "SoFar\(indexPath.row + 1)") as? Int
        var stFirst = "无"
        var stSecond = "无"
        if itFirst != nil {
            stFirst = "\(itFirst!)秒"
        }
        if itSecond != nil {
            stSecond = "\(itSecond!)秒"
        }
        LHKit.changFontSize(rtCell.textLabel!, fixedSize: 3.5*cent)
        rtCell.textLabel?.text = "\(ProStatic.arStLevels[indexPath.row]) 本关记录:\(stFirst) 全程到此记录:\(stSecond)"
        if rtCell.contentView.viewWithTag(500) == nil {
            let line = UILabel.init(frame: CGRect.init(x: 4*cent, y: 13*cent - ProStatic.flRowLine, width: 96*cent, height: ProStatic.flRowLine))
            line.backgroundColor = ProStatic.clLineGray
            line.tag = 500
            rtCell.contentView.addSubview(line)
        }
        rtCell.selectionStyle = .none
        rtCell.accessoryType = .disclosureIndicator
        return rtCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row,indexPath.section) {
        case (0,0):
            let page =  GameScene001()
            page.isStart0Level = true
            navigationController?.pushViewController(page, animated: true)
        case (1,0):
            let page =  GameScene002()
            navigationController?.pushViewController(page, animated: true)
        case (2,0):
            let page =  GameScene003()
            navigationController?.pushViewController(page, animated: true)
        case (3,0):
            let page =  GameScene004()
            navigationController?.pushViewController(page, animated: true)
        case (4,0):
            let page =  GameScene005()
            navigationController?.pushViewController(page, animated: true)
        case (5,0):
            let page =  GameScene006()
            navigationController?.pushViewController(page, animated: true)
        case (6,0):
            let page =  GameScene007()
            navigationController?.pushViewController(page, animated: true)
        case (7,0):
            let page =  GameScene008()
            navigationController?.pushViewController(page, animated: true)
        case (8,0):
            let page =  GameScene009()
            navigationController?.pushViewController(page, animated: true)
        case (9,0):
            let page =  GameScene010()
            navigationController?.pushViewController(page, animated: true)
        case (10,0):
            let page =  GameScene011()
            navigationController?.pushViewController(page, animated: true)
        case (11,0):
            let page =  GameScene012()
            navigationController?.pushViewController(page, animated: true)
            
        default:
            break
        }
    }
}
