//
//  MainPage.swift
//  Flag
//
//  Created by lh on 2018/8/2.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit
/*
 1. 牛刀小试
 2. 提高难度
 3. 左右分离
 
 4. 垂直相聚
 
 5. 向左看齐
 6. 向右看齐
 
 7. 上下分离
 
 8. 水平汇聚
 
 9. 地心引力
 10. 飘向天空
 
 11. 紧密团结在核心周围
 12. 
 
 还可以: 先左右分离 后水平汇聚
 
 */
class MainPage: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cent = UIScreen.main.bounds.width/100
    let testItem = [
        "开始游戏",
//        "本机最高得分",
        "关卡选择",
        "规则说明",
        "娱乐关卡"
        ]
    var myTableView :UITableView!
    var itTopTime = 0 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
        navigationItem.title = "码农粘粘看"
        
        myTableView = UITableView(frame: UIScreen.main.bounds)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "section0cell0")
        myTableView.separatorStyle = .none
        self.view.addSubview(myTableView)
        let userDefaults = UserDefaults.standard
        let isSound:Bool? = userDefaults.value(forKey: "Sound") as? Bool
        if isSound == nil {
            userDefaults.set(true, forKey: "Sound")
        }
        let isSoundNow = userDefaults.value(forKey: "Sound") as! Bool
        let stBt = isSoundNow ? "关闭声音":"打开声音"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: stBt , style: .done, target: self, action: #selector( btSoundSwitch ) )
        
    }
    
    @objc func btSoundSwitch (_ sender:UIButton) {
        let userDefaults = UserDefaults.standard
        var isSoundNow = userDefaults.value(forKey: "Sound") as! Bool
        isSoundNow = !isSoundNow
        let stBt = isSoundNow ? "关闭声音":"打开声音"
        userDefaults.set(isSoundNow, forKey: "Sound")
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: stBt , style: .done, target: self, action: #selector( btSoundSwitch ) )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10*cent
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 13*cent
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "祝各位码农玩得愉快~"
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
        rtCell.textLabel?.text = testItem[indexPath.row]
        if rtCell.contentView.viewWithTag(500) == nil {
            let line = UILabel.init(frame: CGRect.init(x: 4*cent, y: 13*cent - ProStatic.flRowLine, width: 96*cent, height: ProStatic.flRowLine))
            line.backgroundColor = ProStatic.clLineGray
            line.tag = 500
            rtCell.contentView.addSubview(line)
        }
        rtCell.accessoryType = .disclosureIndicator
        return rtCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch testItem[indexPath.row] {
        case "娱乐关卡":
            let userDefaults = UserDefaults.standard
            let itSecond:Int? = userDefaults.value(forKey: "SoFar\(12)") as? Int
            if itSecond != nil {
                LHKit.popMsg(self, title: "通知", Msg: "额,其实,暂时并没有什么娱乐关卡..")
            } else {
                LHKit.popMsg(self, title: "通知", Msg: "只有从第1关开始打通全部12关,才能解锁娱乐关卡.")
            }

        case "规则说明":
            LHKit.popMsg(self, title: "通知", Msg: "连连看,有什么可说明的.")
        case "关卡选择":
            let page =  LevelsPage()
            navigationController?.pushViewController(page, animated: true)
        case "开始游戏":
            let page =  GameScene001()
            page.isStart0Level = true
            navigationController?.pushViewController(page, animated: true)
            
            
            
        default:
            break
        }
    }
}
