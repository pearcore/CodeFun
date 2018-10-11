//
//  GameScene01.swift
//  Flag
//
//  Created by lh on 2018/7/31.
//  Copyright © 2018年 lh. All rights reserved.
//

import UIKit
import AVFoundation
import DeviceKit

class GameScene000: UIViewController {
    var isStart0Level = false
    let cent = LHKit.centSpace
    var sbLastSelect:SingleButton? = nil
    var GameMatrix:[[GamePit]]!
    var arTheRoad:[(Int,Int)] = []
    var _itTopTime = 0
    var itTopTime:Int {
        set {
            lbTopTime.text = "\(_itTopTime+1) 秒"
            _itTopTime = newValue
        }
        get {
            return _itTopTime
        }
    }
    var isTimeRun = true
    var lbTopTime:UILabel!
    var lbTopMsg:UILabel!
    var lbDownTip:UILabel!
    var itGoingOn = 0
    var itCount = 0
    var itMessageCount = 0
    var itTimeUsed = 0
    var isSound:Bool!

    func arOrginNumbers()->[Int] {
        return ProStatic.arIt0
    }
    
    func itChaos() ->Int {
        return 2
    }
    
    func stNameOfLevel()->String {
        return "在测试中"
    }
    
    func itThisLevelNumber() -> Int {
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        isSound = (userDefaults.value(forKey: "Sound") as! Bool)
        
        lbTopTime = UILabel.init(frame: CGRect.init(x: 33*cent , y: 10*cent , width: 33*cent , height: 10*cent))
        LHKit.changFontSize(lbTopTime, fixedSize: 7*cent )
        lbTopTime.textAlignment = .center
        lbTopTime.textColor = ProStatic.clBlack
        view.addSubview(lbTopTime)
        
        lbTopMsg = UILabel.init(frame: CGRect.init(x: 3*cent , y: 16*cent , width: 50*cent , height: 10*cent))
        LHKit.changFontSize(lbTopMsg, fixedSize: 4*cent )
        lbTopMsg.textAlignment = .left
        lbTopMsg.textColor = ProStatic.clBlack
        view.addSubview(lbTopMsg)
        
        let lbBottom = UILabel.init(frame: CGRect.init(x: 10*cent , y: 167*cent , width: 80*cent , height: 10*cent))
        LHKit.changFontSize(lbBottom, fixedSize: 5*cent )
        lbBottom.textAlignment = .center
        lbBottom.textColor = ProStatic.clBlack
        lbBottom.text = stNameOfLevel()
        view.addSubview(lbBottom)
        
        let btMain = UIButton.init(type: .system)
        btMain.frame = CGRect.init(x: 5*cent  , y: 6*cent , width: 25 * cent, height: 10 * cent)
        btMain.setTitle("回主页", for: .normal )
        //btMain.setTitleColor(ProStatic.clBlack, for: .normal)
        //btMain.setTitleColor(ProStatic.clBlue, for: .highlighted)
        
        
//        btMain.backgroundColor = ProStatic.clBgGray
//        btMain.layer.cornerRadius = 1.5*cent
//        btMain.layer.borderWidth = 0.15*cent
        btMain.addTarget(self, action: #selector(btMainClick(_:)) , for: .touchUpInside)
        view.addSubview(btMain)
        
        let btNext = UIButton.init(frame: CGRect.init(x: 85*cent  , y: 7*cent , width: (100.0/10.0) * cent, height: (100.0/10.0) * cent))
        btNext.backgroundColor = ProStatic.clBgGray
        btNext.layer.cornerRadius = 1.5*cent
        btNext.layer.borderWidth = 0.15*cent
        btNext.addTarget(self, action: #selector(btNextClick(_:) ) , for: .touchUpInside)
        btNext.isHidden = true
        view.addSubview(btNext)
        
        let btTip = UIButton.init(frame: CGRect.init(x: 0*cent  , y: 167*cent , width: 10 * cent, height: 10 * cent))
        btTip.backgroundColor = ProStatic.clBgGray.withAlphaComponent(0)
        btTip.addTarget(self, action: #selector(btTipClick(_:)) , for: .touchUpInside)
        view.addSubview(btTip)
        
        lbDownTip = UILabel.init(frame: CGRect.init(x: 70*cent  , y: 173*cent , width: 30 * cent, height: 5 * cent))
        lbDownTip.textColor = ProStatic.clBgGray
        LHKit.changFontSize(lbDownTip, fixedSize: 2*cent )
        lbDownTip.textAlignment = .right
        lbDownTip.isHidden = true
        view.addSubview(lbDownTip)
        
        
        
        func add1Second() {
            if isTimeRun {
                itTopTime = itTopTime + 1
                LHKit.delayToDo(1, doSomething: add1Second)
            }
        }
        add1Second()
        
        let flSingle:CGFloat =  (100.0/10.0) * cent
        view.backgroundColor = ProStatic.clFontLightGray
        
        GameMatrix = [[GamePit]].init(repeating: [GamePit].init(repeating: GamePit(), count: 10 ), count: 16)
        
        var arItN = arOrginNumbers()
        arItN = LHKit.arItXiPai(arItN, itChaos: itChaos() )
        
        var itOrder = 0
        for i in 0..<16 {
            for j in 0..<10 {
                GameMatrix[i][j].posX = flSingle * CGFloat(j)
                GameMatrix[i][j].posY = 15*cent + flSingle * CGFloat(i)
                if (i != 0 && i != 15 && j != 0 && j != 9 ) {
                    GameMatrix[i][j].itMatrixNumber = arItN[itOrder]
                    itOrder = itOrder + 1
                }
            }
        }
        
        for i in 0..<16 {
            for j in 0..<10 {
                if GameMatrix[i][j].itMatrixNumber != 0 {
                    let sb = SingleButton.init(frame: CGRect.init(x: GameMatrix[i][j].posX, y: GameMatrix[i][j].posY, width: flSingle, height: flSingle))
                    sb.matrixX = i
                    sb.matrixY = j
                    sb.backgroundColor = ProStatic.clBgGray
                    sb.layer.cornerRadius = 1.5*cent
                    sb.layer.borderWidth = 0.15*cent
                    sb.layer.borderColor = ProStatic.clBlack.cgColor
                    sb.signNumber(GameMatrix[i][j].itMatrixNumber)
                    sb.addTarget(self, action: #selector(self.SingleButtonClick(_:)) , for: .touchUpInside )
                    GameMatrix[i][j].sb = sb
                    view.addSubview(sb)
                }
            }
        }
        SwitchIfConfilict()
        
        let device = Device()
        if device.isPad {
            view.transform = CGAffineTransform.init(scaleX: 0.85 , y: 0.85)
        } else {
            
        }
    }
    @objc func btTipClick(_ sender:UIButton?) {
        lbDownTip.isHidden = !lbDownTip.isHidden
    }
    
    @objc func btMainClick(_ sender:UIButton?) {
        navigationController?.popToRootViewController(animated: true)
    }
        
    @objc func btNextClick(_ sender:UIButton?) {
        navigationController?.pushViewController(GameScene000(), animated: true)
    }
    
    @objc func SingleButtonClick(_ sender:UIButton) {
        let btClicked = sender as! SingleButton
        func newSelect() {
            sbLastSelect?.setNotSelect()
            sbLastSelect = btClicked
            sbLastSelect!.setSelect()
        }
        if sbLastSelect != nil && !( (sbLastSelect?.matrixX == btClicked.matrixX ) && (sbLastSelect?.matrixY == btClicked.matrixY )) {
            if isThisTwoGuysAreOK( (sbLastSelect!.matrixX ,sbLastSelect!.matrixY ), btTwo: (btClicked.matrixX ,btClicked.matrixY )) {
            
                GameMatrix[sbLastSelect!.matrixX][sbLastSelect!.matrixY].sb!.removeFromSuperview()
                GameMatrix[sbLastSelect!.matrixX][sbLastSelect!.matrixY].sb = nil
                GameMatrix[sbLastSelect!.matrixX][sbLastSelect!.matrixY].itMatrixNumber = 0
                
                GameMatrix[btClicked.matrixX][btClicked.matrixY].sb!.removeFromSuperview()
                GameMatrix[btClicked.matrixX][btClicked.matrixY].sb = nil
                GameMatrix[btClicked.matrixX][btClicked.matrixY].itMatrixNumber = 0
                
                func nothing() {
                    
                }
                if isSound {
                    AudioTool.playAudio("delete.mp3", isAlert: false, completion: nothing)
                }
                
                showRoad( arTheRoad )
                sbLastSelect = nil
                
                ComputeHowMuchLeft()
                MoveBtByRule()
                SwitchIfConfilict()
                
            } else {
                newSelect()
            }
        } else {
            newSelect()
        }
    }
    func SwitchIfConfilict() {
        var arAllLeft:[(Int,Int)] = []
        func isCleanAble()->Bool {
            var isAble = false
            for row in GameMatrix {
                for singleCloum in row {
                    if singleCloum.sb != nil {
                        //print("oo -> \(singleCloum.sb!.matrixX , singleCloum.sb!.matrixY)")
                        arAllLeft.append((singleCloum.sb!.matrixX, singleCloum.sb!.matrixY))
                    }
                }
            }
            
            for temp in arAllLeft {
                if isAble {
                    break
                }
                for temp2 in arAllLeft {
                    if temp != temp2 {
                        if (isThisTwoGuysAreOK(temp, btTwo: temp2))  {
                            isAble = true
                            //print("==>\(GameMatrix[temp.0][temp.1].itMatrixNumber)   (\(GameMatrix[temp.0][temp.1].sb!.matrixX),\(GameMatrix[temp.0][temp.1].sb!.matrixY)) {=} (\(GameMatrix[temp2.0][temp2.1].sb!.matrixX),\(GameMatrix[temp2.0][temp2.1].sb!.matrixY))")
                            lbDownTip.text = "\(GameMatrix[temp.0][temp.1].sb!.matrixX),\(GameMatrix[temp.0][temp.1].sb!.matrixY),\(GameMatrix[temp2.0][temp2.1].sb!.matrixX),\(GameMatrix[temp2.0][temp2.1].sb!.matrixY) ."
                            break
                        }
                    }
                }
            }
            if arAllLeft.count == 0 {
                isAble = true
            }
            return isAble
        }
        func reArrange() {
            func SwitchIt(_ from:(Int,Int) , to:(Int,Int) , isAnimate:Bool ) {
                let tempNumber = GameMatrix[to.0][to.1].itMatrixNumber
                GameMatrix[to.0][to.1].itMatrixNumber = GameMatrix[from.0][from.1].itMatrixNumber
                GameMatrix[from.0][from.1].itMatrixNumber = tempNumber
//
                GameMatrix[from.0][from.1].sb?.matrixX = to.0
                GameMatrix[from.0][from.1].sb?.matrixY = to.1
                GameMatrix[to.0][to.1].sb?.matrixX = from.0
                GameMatrix[to.0][to.1].sb?.matrixY = from.1
                
                let tempSb = GameMatrix[to.0][to.1].sb
                GameMatrix[to.0][to.1].sb = GameMatrix[from.0][from.1].sb
                GameMatrix[from.0][from.1].sb = tempSb
                
                func moveIt () {
                    GameMatrix[to.0][to.1].sb?.frame = CGRect.init(x: GameMatrix[to.0][to.1].posX, y: GameMatrix[to.0][to.1].posY, width: (100.0/10.0) * cent, height: (100.0/10.0) * cent)
                    GameMatrix[from.0][from.1].sb?.frame = CGRect.init(x: GameMatrix[from.0][from.1].posX, y: GameMatrix[from.0][from.1].posY, width: (100.0/10.0) * cent, height: (100.0/10.0) * cent)
                }
                
                if isAnimate {
                    UIView.animate(withDuration: 0.3, animations: moveIt )
                } else {
                    moveIt()
                }
            }
            let itNumber = arAllLeft.count
            let itRepeat = itNumber
            for _ in 0..<itRepeat {
                let itRandom1 = Int(arc4random() % UInt32(itNumber) )
                let itRandom2 = Int(arc4random() % UInt32(itNumber) )
                if itRandom1 != itRandom2 {
                    SwitchIt( arAllLeft[itRandom1]  , to: arAllLeft[itRandom2] , isAnimate: true )
                }
            }
        }
        
        while !isCleanAble(){
            sendMsgToTop("无法消除,自动重列!")
            reArrange()
        }
        
    }
    
    func MoveBtToBlankPit(_ from:(Int,Int), to:(Int,Int), isAnimate:Bool) {
        GameMatrix[to.0][to.1].itMatrixNumber = GameMatrix[from.0][from.1].itMatrixNumber
        GameMatrix[from.0][from.1].itMatrixNumber = 0
        
        GameMatrix[from.0][from.1].sb?.matrixX = to.0
        GameMatrix[from.0][from.1].sb?.matrixY = to.1
        
        GameMatrix[to.0][to.1].sb = GameMatrix[from.0][from.1].sb
        GameMatrix[from.0][from.1].sb = nil
        func moveIt () {
            GameMatrix[to.0][to.1].sb?.frame = CGRect.init(x: GameMatrix[to.0][to.1].posX, y: GameMatrix[to.0][to.1].posY, width: (100.0/10.0) * cent, height: (100.0/10.0) * cent)
        }
        
        if isAnimate {
            UIView.animate(withDuration: 0.3, animations: moveIt )
        } else {
            moveIt()
        }
    }
    
    func MoveBtByRule() {
 
    }
    
    func ComputeHowMuchLeft() {
        var itLeft = 0
        for temp in GameMatrix {
            for temp2 in temp {
                if temp2.itMatrixNumber > 0 {
                    itLeft = itLeft + 1
                }
            }
        }
        if itLeft == 0 {
            isTimeRun = false
            thisLevelOver()
        }
    }
    
    func thisLevelOver() {
        func nextTurn (_ sender:UIAlertAction) {
            btNextClick( nil )
        }
        let itLevel = itThisLevelNumber()
        let userDefaults = UserDefaults.standard
        let itFirst:Int? = userDefaults.value(forKey: "Level\(itLevel)") as? Int
        let itSecond:Int? = userDefaults.value(forKey: "SoFar\(itLevel)") as? Int
        var stFirst = ""
        var stSecond = ""
        if itFirst == nil || itFirst! > (itTopTime ) {
            stFirst = "打破了本关纪录!"
            userDefaults.set(itTopTime , forKey: "Level\(itLevel)")
        }
        if isStart0Level {
            itTimeUsed = itTimeUsed + itTopTime
            stSecond = "从头到此总用时\(itTimeUsed)秒,"
            if itSecond == nil || itSecond! > itTimeUsed {
                stSecond = "从头到此总用时\(itTimeUsed)秒,也打破了记录!"
                userDefaults.set(itTimeUsed , forKey: "SoFar\(itLevel)")
                if itLevel == 12 {
                    print("完成全部且打破记录!")
                }
            }
        }
        if itLevel >= 12 {
            func backMain(_ sender:UIAlertAction) {
                btMainClick(nil)
            }
            LHKit.popMsg(self, title: "过关", Msg: "清理完成! 总用时 \(itTopTime) 秒,\(stFirst) \(stSecond),点击确定返回主菜单.", doSomething: backMain )
        } else {
            LHKit.popMsg(self, title: "过关", Msg: "清理完成! 总用时 \(itTopTime) 秒,\(stFirst) \(stSecond)点击确定进入下一关.", doSomething: nextTurn )
        }

    }
    
    func showRoad (_ road:[(Int,Int)]) {
        for temp in road {
            let vw = UIView.init(frame: CGRect.init(x: GameMatrix[temp.0][temp.1].posX + (50.0/10.0) * cent - 1.5*cent  , y:  GameMatrix[temp.0][temp.1].posY + (50.0/10.0) * cent - 1.5*cent, width: 3*cent , height: 3*cent))
            vw.layer.cornerRadius = 1.5*cent
            vw.backgroundColor = ProStatic.clOrange
            vw.tag = temp.0 * 100 + temp.1
            view.addSubview(vw)
        }
        
        itGoingOn = itGoingOn + 1
        if itGoingOn > 1 {
            itCount = itCount + 1
            switch itCount {
            case 1:
                sendMsgToTop("Double kill !")
            case 2:
                sendMsgToTop("Triple kill !")
            case 3:
                sendMsgToTop("Quadra kill !")
            case 4:
                sendMsgToTop("Penta kill !")
            default:
                sendMsgToTop("Unstopable !")
            }
            
        }
        
        func removeAllRoad () {
            for temp in road {
                let star = view.viewWithTag( temp.0*100 + temp.1 )
                star?.removeFromSuperview()
            }
            
            itGoingOn = itGoingOn - 1
            if itGoingOn <= 0 {
                itCount = 0
            }
        }
        
        LHKit.delayToDo(1, doSomething: removeAllRoad)
    }
    
    func isThisTwoGuysAreOK(_ btOne:(Int,Int),btTwo:(Int,Int) )->Bool {
        var isRt = false
        let itBorderLeft = 0
        let itBorderRight = 9
        let itBorderUp = 0
        let itBorderDown = 15
        var arTwoGuysRoad:[(Int,Int)] = []

        func isSearchFourWays(_ first:(Int,Int),second:(Int,Int))->Bool {
            var isWorks = false
            
            var rt4Road:[(Int,Int)] = []
            for it in itBorderLeft..<first.1 { // 向左找!
                if GameMatrix[first.0][first.1 - 1 - it].sb != nil {
                    if (first.0 == second.0 && ((first.1 - 1 - it ) == second.1) ) { // 找到!
                        isWorks = true
                        break
                    } else {
                        break
                    }
                } else {
                    rt4Road.append((first.0,first.1 - 1 - it))
                    continue
                }
            }
            
            if isWorks != true {
                rt4Road = []
                
                for it in first.1..<itBorderRight { // 向右找
                    if GameMatrix[first.0][ it + 1 ].sb != nil {
                        if (first.0 == second.0 && (( it + 1) == second.1) ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            break
                        }
                    } else {
                        rt4Road.append((first.0,it + 1))
                        continue
                    }
                }
            }

            
            if isWorks != true {
                rt4Road = []
                for it in itBorderUp..<first.0 { // 向上找!
                    if GameMatrix[first.0 - 1 - it][first.1 ].sb != nil {
                        if (first.0 - 1 - it == second.0 && ((first.1) == second.1) ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            break
                        }
                    } else {
                        rt4Road.append((first.0 - 1 - it ,first.1))
                        continue
                    }
                }
            }

            
            if isWorks != true {
                rt4Road = []
                
                for it in first.0..<itBorderDown { // 向下找
                    if GameMatrix[it + 1 ][ first.1 ].sb != nil {
                        if (it+1 == second.0 && (first.1 == second.1) ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            break
                        }
                    } else {
                        rt4Road.append((it + 1,first.1))
                        continue
                    }
                }
            }
            arTheRoad = rt4Road
            
            return isWorks
        }
        func isNeedOneTurn(_ first:(Int,Int),second:(Int,Int))->(Bool) {
            var isWorks = false
            var arOneRt:[(Int,Int)] = []
            
            for it in itBorderLeft..<first.1 { // 向左找!
                if GameMatrix[first.0][first.1 - 1 - it].sb == nil { // 空格
                    arOneRt.append((first.0,first.1 - 1  - it))
                    if isSearchFourWays( (first.0,first.1 - 1 - it)  , second: second ) {
                        isWorks = true
                        break
                    } else {
                        continue
                    }
                } else { // 有东西
                    break
                }
            }
            
            if isWorks == false {
                arOneRt = []
                for it in first.1..<itBorderRight { // 向右找
                    if GameMatrix[first.0][ it + 1 ].sb == nil {
                        arOneRt.append( (first.0,it+1) )
                        if isSearchFourWays( (first.0,it + 1)   , second:second) { // 找到!
                            isWorks = true
                            break
                        } else {
                            
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
            


            if isWorks == false {
                arOneRt = []
                for it in itBorderUp..<first.0 { // 向上找!
                    if GameMatrix[first.0 - 1 - it][first.1 ].sb == nil {
                        arOneRt.append( (first.0 - 1 - it , first.1) )
                        if isSearchFourWays( (first.0 - 1 - it,first.1)  , second: second ) {// 找到!
                            isWorks = true
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
            


            if isWorks == false {
                arOneRt = []
                for it in first.0..<itBorderDown { // 向下找
                    if GameMatrix[it + 1 ][ first.1 ].sb == nil {
                        arOneRt.append( (it+1,first.1))
                        if isSearchFourWays((it + 1,first.1) , second: second  ) {
                            isWorks = true
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
            
            if isWorks {
                let tempRoad = arTheRoad
                arTheRoad = arOneRt
                arTheRoad.append(contentsOf: tempRoad)
            }

            
            return isWorks
        }
        func isNeedTwoTurns(_ first:(Int,Int),second:(Int,Int))-> Bool {
            var isWorks = false
            var arTwoRt:[(Int,Int)] = []
            
            for it in itBorderLeft..<first.1 { // 向左找!
                if GameMatrix[first.0][first.1 - 1 - it].sb == nil { // 空格
                    arTwoRt.append( (first.0,first.1 - 1 - it))
                    if ( isNeedOneTurn( (first.0,first.1 - 1 - it)  , second: second )  ) { // 找到!
                        isWorks = true
                        break
                    } else {
                        continue
                    }
                } else { // 有东西
                    break
                }
            }
            
            if isWorks == false {
                arTwoRt = []
                
                for it in first.1..<itBorderRight { // 向右找
                    if GameMatrix[first.0][ it + 1 ].sb == nil {
                        arTwoRt.append((first.0 , it + 1))
                        if ( isNeedOneTurn( (first.0,it + 1)   , second:second)  ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
            

            if isWorks == false {
                arTwoRt = []
                
                for it in itBorderUp..<first.0 { // 向上找!
                    if GameMatrix[first.0 - 1 - it][first.1 ].sb == nil {
                        arTwoRt.append( (first.0 - 1 - it , first.1 ) )
                        if ( isNeedOneTurn( (first.0 - 1 - it,first.1)  , second: second ) ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
            

            
            if isWorks == false {
                arTwoRt = []
                
                for it in first.0..<itBorderDown { // 向下找
                    if GameMatrix[it + 1 ][ first.1 ].sb == nil {
                        arTwoRt.append( ( it + 1, first.1 ) )
                        if ( isNeedOneTurn( (it + 1,first.1) , second: second )  ) { // 找到!
                            isWorks = true
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }

            if isWorks {
                let tempRoad = arTheRoad
                arTheRoad = arTwoRt
                arTheRoad.append(contentsOf: tempRoad)
            }
            
            return isWorks
    }
        if GameMatrix[btOne.0][btOne.1].itMatrixNumber != GameMatrix[btTwo.0][btTwo.1].itMatrixNumber {
            isRt = false
        } else {
            if isSearchFourWays (btOne, second: btTwo) {
                isRt = true
            } else if isNeedOneTurn( btOne, second: btTwo ) {
                isRt = true
            } else if isNeedTwoTurns ( btOne, second: btTwo) {
                isRt = true
            }
        }
        return isRt
    }
    
    func sendMsgToTop(_ stText:String ) {
        itMessageCount = itMessageCount + 1

        lbTopMsg.text = stText
        func delayBlankIt() {
            itMessageCount = itMessageCount - 1
            if itMessageCount == 0 {
                lbTopMsg.text = ""
            }
        }
        LHKit.delayToDo(3, doSomething: delayBlankIt )
    }
}

class SingleButton : UIButton {
    var matrixX = 0
    var matrixY = 0
    var lbLabel:UILabel!
    var imImage:UIImageView!
    let flSingle:CGFloat =  (100.0/10.0) * LHKit.centSpace
    var isShowNumber = ProStatic.isThisGameInNumbers
    func signNumber(_ itNumber:Int) {
        self.clipsToBounds = true
        if isShowNumber {
            lbLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: flSingle, height: flSingle))
            LHKit.changFontSize(lbLabel, fixedSize: 4*LHKit.centSpace )
            lbLabel.textAlignment = .center
            lbLabel.text = "\(itNumber)"
            self.addSubview(lbLabel)
        } else {
            imImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: flSingle, height: flSingle))
            imImage.image = UIImage.init(named: "\(itNumber)")
            self.addSubview(imImage)
        }

    }
    
    func setNotSelect() {
        self.layer.borderColor = ProStatic.clBlack.cgColor
        self.backgroundColor = ProStatic.clBgGray
    }
    func setSelect() {
        self.layer.borderColor = ProStatic.clRed.cgColor
        self.backgroundColor = ProStatic.clThemeBgGreen
    }
}

struct GamePit {
    var sb :SingleButton?
    var posX:CGFloat = 0
    var posY:CGFloat = 0
    var itMatrixNumber = 0

}
