//
//  GameScene001.swift
//  Flag
//
//  Created by lh on 2018/8/3.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit

class GameScene009: GameScene000 {
    override func arOrginNumbers() -> [Int] {
        return ProStatic.arIt50
    }
    
    override func itChaos() -> Int {
        return 3
    }
    
    override func itThisLevelNumber() -> Int {
        return 9
    }
    
    override func stNameOfLevel() -> String {
        return ProStatic.arStLevels[itThisLevelNumber()-1]
    }
    
    override func MoveBtByRule() {
        moveRuleHorizontalGether()
    }
    override func btNextClick(_ sender: UIButton?) {
        let page = GameScene010()
        page.isStart0Level = isStart0Level
        page.itTimeUsed = page.itTimeUsed + itTimeUsed
        navigationController?.pushViewController( page , animated: true)
    }
}
