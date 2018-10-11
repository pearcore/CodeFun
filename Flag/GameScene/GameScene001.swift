//
//  GameScene001.swift
//  Flag
//
//  Created by lh on 2018/8/3.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit

class GameScene001: GameScene000 {
    override func arOrginNumbers() -> [Int] {
        return ProStatic.arIt0
    }
    override func itChaos() -> Int {
        return 2
    }
    
    override func itThisLevelNumber() -> Int {
        return 1
    }
    
    override func stNameOfLevel() -> String {
        return ProStatic.arStLevels[itThisLevelNumber()-1]
    }
    
    override func MoveBtByRule() {
    }
    
    override func btNextClick(_ sender: UIButton?) {
        let page = GameScene002()
        page.isStart0Level = isStart0Level
        page.itTimeUsed = page.itTimeUsed + itTimeUsed
        navigationController?.pushViewController( page , animated: true)
    }
}
