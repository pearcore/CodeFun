//
//  GameScene001.swift
//  Flag
//
//  Created by lh on 2018/8/3.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit

class GameScene012: GameScene000 {
    override func arOrginNumbers() -> [Int] {
        return ProStatic.arIt50
    }
    
    override func itChaos() -> Int {
        return 3
    }
    
    override func itThisLevelNumber() -> Int {
        return 12
    }
    
    override func stNameOfLevel() -> String {
        return ProStatic.arStLevels[itThisLevelNumber()-1]
    }
    
    override func MoveBtByRule() {
        moveRuleHorizontalGether()
        moveRuleVerticalGether()
    }
    
    override func btNextClick(_ sender: UIButton?) {
        let page = GameScene013()
        page.isStart0Level = isStart0Level
        page.itTimeUsed = page.itTimeUsed + itTimeUsed
        navigationController?.pushViewController( page , animated: true)
    }
}
