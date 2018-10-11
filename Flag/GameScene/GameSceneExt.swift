//
//  File.swift
//  Flag
//
//  Created by lh on 2018/8/4.
//  Copyright © 2018年 lh. All rights reserved.
//

extension GameScene000 {
    func moveRuleVerticalSplit() {
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row][cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,cloum + 1), to: (row,cloum), isAnimate: true)
                }
            }
        }
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row][cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,cloum + 1), to: (row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][9 - cloum].itMatrixNumber == 0 && ( GameMatrix[row][9 - cloum - 1].itMatrixNumber != 0 ) && (GameMatrix[row][9 - cloum - 1].sb != nil ) {
                    MoveBtToBlankPit((row,9 - cloum - 1), to: (row,9 - cloum ), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][9 - cloum].itMatrixNumber == 0 && ( GameMatrix[row][9 - cloum - 1].itMatrixNumber != 0 ) && (GameMatrix[row][9 - cloum - 1].sb != nil ) {
                    MoveBtToBlankPit((row,9 - cloum - 1), to: (row,9 - cloum ), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleVerticalGether () {
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][4 - cloum + 1].itMatrixNumber == 0 && ( GameMatrix[row][4 - cloum ].itMatrixNumber != 0 ) && (GameMatrix[row][4 - cloum ].sb != nil ) {
                    MoveBtToBlankPit((row,4 - cloum  ), to: (row,4 - cloum + 1), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][4 - cloum + 1].itMatrixNumber == 0 && ( GameMatrix[row][4 - cloum ].itMatrixNumber != 0 ) && (GameMatrix[row][4 - cloum ].sb != nil ) {
                    MoveBtToBlankPit((row,4 - cloum ), to: (row,4 - cloum + 1), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][4 + cloum].itMatrixNumber == 0 && ( GameMatrix[row][4 + cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][4 + cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,4 + cloum + 1), to: (row,4 + cloum ), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<4 {
                if GameMatrix[row][4 + cloum].itMatrixNumber == 0 && ( GameMatrix[row][4 + cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][4 + cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,4 + cloum + 1), to: (row,4 + cloum ), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleLeft() {
        for row  in 1..<15 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row][cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,cloum + 1), to: (row,cloum), isAnimate: true)
                }
            }
        }
        for row  in 1..<15 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row][cloum + 1].itMatrixNumber != 0 ) && (GameMatrix[row][cloum + 1].sb != nil ) {
                    MoveBtToBlankPit((row,cloum + 1), to: (row,cloum), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleRight() {
        for row  in 1..<15 {
            for cloum in 1..<9 {
                if GameMatrix[row][9 - cloum].itMatrixNumber == 0 && ( GameMatrix[row][9 - cloum - 1].itMatrixNumber != 0 ) && (GameMatrix[row][9 - cloum - 1].sb != nil ) {
                    MoveBtToBlankPit((row,9 - cloum - 1), to: (row,9 - cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<15 {
            for cloum in 1..<9 {
                if GameMatrix[row][9 - cloum].itMatrixNumber == 0 && ( GameMatrix[row][9 - cloum - 1].itMatrixNumber != 0 ) && (GameMatrix[row][9 - cloum - 1].sb != nil ) {
                    MoveBtToBlankPit((row,9 - cloum - 1), to: (row,9 - cloum), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleHorizontalSplit() {
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((row + 1,cloum), to: (row,cloum), isAnimate: true)
                }
            }
        }
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((row + 1,cloum), to: (row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[15 - row ][cloum].itMatrixNumber == 0 && ( GameMatrix[15 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[15 - row - 1][cloum].sb != nil ) {
                    MoveBtToBlankPit((15 - row - 1,cloum), to: (15 - row ,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[15 - row ][cloum].itMatrixNumber == 0 && ( GameMatrix[15 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[15 - row - 1][cloum].sb != nil ) {
                    MoveBtToBlankPit((15 - row - 1,cloum), to: (15 - row ,cloum), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleHorizontalGether() {
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[8 - row][cloum].itMatrixNumber == 0 && ( GameMatrix[8 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[8 - row - 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((8 - row - 1 ,cloum), to: (8 - row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[8 - row][cloum].itMatrixNumber == 0 && ( GameMatrix[8 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[8 - row - 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((8 - row - 1 ,cloum), to: (8 - row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[7 + row][cloum].itMatrixNumber == 0 && ( GameMatrix[7 + row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[7 + row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((7 + row + 1 ,cloum), to: (7 + row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<7 {
            for cloum in 1..<9 {
                if GameMatrix[7 + row][cloum].itMatrixNumber == 0 && ( GameMatrix[7 + row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[7 + row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((7 + row + 1 ,cloum), to: (7 + row,cloum), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleDropDown()  {
        for row  in 1..<14 {
            for cloum in 1..<9 {
                if GameMatrix[15 - row][cloum].itMatrixNumber == 0 && ( GameMatrix[15 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[15 - row - 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((15 - row - 1 ,cloum), to: (15 - row ,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<14 {
            for cloum in 1..<9 {
                if GameMatrix[15 - row][cloum].itMatrixNumber == 0 && ( GameMatrix[15 - row - 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[15 - row - 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((15 - row - 1 ,cloum), to: (15 - row ,cloum), isAnimate: true)
                }
            }
        }
    }
    
    func moveRuleFlyUp() {
        for row  in 1..<14 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((row + 1 ,cloum), to: (row,cloum), isAnimate: true)
                }
            }
        }
        
        for row  in 1..<14 {
            for cloum in 1..<9 {
                if GameMatrix[row][cloum].itMatrixNumber == 0 && ( GameMatrix[row + 1][cloum].itMatrixNumber != 0 ) && (GameMatrix[row + 1][cloum ].sb != nil ) {
                    MoveBtToBlankPit((row + 1 ,cloum), to: (row,cloum), isAnimate: true)
                }
            }
        }
    }
}
