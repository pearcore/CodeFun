//
//  LHKit.swift
//  Mine
//
//  Created by lh on 2017/9/25.
//  Copyright © 2017年 lh. All rights reserved.
//

import UIKit
import SwiftyJSON

class LHKit {
    static let screenBounds = UIScreen.main.bounds
    static let centSpace = screenBounds.width/100
    
    static func arItXiPai(_ itAr:[Int] , itChaos:Int)->[Int] {
        var rt = itAr
        let itNumber = itAr.count
        let itRepeat = itNumber * itChaos
        for _ in 0..<itRepeat {
            let itRandom1 = Int(arc4random() % UInt32(itNumber) )
            let itRandom2 = Int(arc4random() % UInt32(itNumber) )
            let temp = rt[itRandom1]
            rt[itRandom1] = rt [itRandom2]
            rt[itRandom2] = temp
        }
        return rt
    }
    
    static func anyJsonNullCheck<T>(old:JSON? , defaultAny :T )->T {
        var rtAny:T? = defaultAny
        if old != nil {
            let nowAny = old?.object as? T
            if nowAny != nil {
                rtAny = nowAny
            }
        }
        return rtAny!
    }
    
    static func isMobileRight(_ mobileNum:String)->(Bool,String) {
        var rtBool = false
        var rtCompany = ""
        
        if (mobileNum.utf16.count != 11)
        {
            rtBool = false
        }
        
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: mobileNum) == true)
            || (regextestcm.evaluate(with: mobileNum)  == true)
            || (regextestct.evaluate(with: mobileNum) == true)
            || (regextestcu.evaluate(with: mobileNum) == true))
        {
            rtBool = true
        }
        else
        {
            rtBool = false
        }
        
        if (regextestmobile.evaluate(with: mobileNum) == true) {
            rtCompany = "普通手机"
        }
        if (regextestcm.evaluate(with: mobileNum)  == true) {
            rtCompany = "移动"
        }
        if (regextestct.evaluate(with: mobileNum) == true) {
            rtCompany = "电信"
        }
        if (regextestcu.evaluate(with: mobileNum) == true) {
            rtCompany = "联通"
        }
        
        print("---------->\(rtBool)\(rtCompany)")
        return (rtBool,rtCompany)
    }
    
    static func reSizeImageView(_ ivPic:UIImageView ,szSize:CGSize )  {
        UIGraphicsBeginImageContextWithOptions( szSize , false, UIScreen.main.scale)
        let  imageRect:CGRect = CGRect.init(x: 0, y: 0, width: szSize.width, height: szSize.height)
        ivPic.image?.draw(in: imageRect)
        ivPic.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
    }
    
    static func changFontSize(_ label:UITextField, fixedSize:CGFloat ) {
        label.font = UIFont(name: (label.font?.fontName)! , size: CGFloat(fixedSize) )
    }
    
    static func changFontSize(_ label:UITextView, fixedSize:CGFloat ) { // 这个好像用不了
        label.font = UIFont(name: (label.font?.fontName)! , size: CGFloat(fixedSize) )
    }
    
    static func changFontSize(_ label:UITextView,label2:UILabel , fixedSize:CGFloat ) { // 这个好像用不了
        label.font = UIFont(name: (label2.font?.fontName)! , size: CGFloat(fixedSize) )
    }
    
    static func changFontSize(_ label:UILabel, fixedSize:Int ) {
        label.font = UIFont(name: label.font.fontName , size: CGFloat(fixedSize) )
    }
    static func changFontSize(_ label:UILabel, fixedSize:CGFloat ) {
        label.font = UIFont(name: label.font.fontName , size: CGFloat(fixedSize) )
    }
    
//    static func popTopMsg (_ view:UIViewController, stMsg:String!,duration:Double,position:AnyObject,title:String) {
//        view.view.makeToast(message: stMsg, duration: duration, position: position, title: title)
//    }
    
    static func popMsg(_ vc:UIViewController ,title:String?,Msg:String?,cancelButton:String?, doSomething:((UIAlertAction)->())?  ){
        var nowTitle:String = "通知"
        var nowMSG:String = "没有内容"
        if (title != nil) {
            nowTitle = title!
        }
        if (Msg != nil) {
            nowMSG = Msg!
        }
        
        let alertConfirm = UIAlertController(title: nowTitle, message: nowMSG, preferredStyle: UIAlertControllerStyle.alert)
        if(cancelButton != nil) {
            let cancelAction = UIAlertAction(title: cancelButton, style: UIAlertActionStyle.cancel, handler: nil)
            alertConfirm.addAction(cancelAction)
        }
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: doSomething)
        alertConfirm.addAction(okAction)
        
        vc.present(alertConfirm, animated: true, completion: nil)
    }
    static  func popMsg(_ vc:UIViewController) {
        popMsg(vc, title: nil, Msg: nil,cancelButton:nil,doSomething: nil  )
    }
    
    static  func popMsg(_ vc:UIViewController ,Msg:String? ) {
        popMsg(vc, title: nil, Msg: Msg,cancelButton:nil,doSomething: nil  )
    }
    
    static  func popMsg(_ vc:UIViewController ,title:String?,Msg:String? ) {
        popMsg(vc, title: title, Msg: Msg,cancelButton:nil,doSomething: nil  )
    }
    
    static  func popMsg(_ vc:UIViewController ,title:String?,Msg:String?,doSomething:((UIAlertAction)->())? ) {
        popMsg(vc, title: title, Msg: Msg,cancelButton:nil, doSomething:doSomething )
    }

    static func createLhRtCell (Cell:UITableViewCell , itView:Int, itImg:Int,itLabel:Int)->([UIView],[UIImageView],[UILabel]) {
        
        let cent = UIScreen.main.bounds.width/100
        var arVwView1 = [UIView]()
        for index in 100..<(100+itView) {
            let vwTemp = UIView(frame: CGRect(x: cent*0, y: cent*0, width: cent*0, height: cent*0))
            vwTemp.tag = index
            arVwView1.append(vwTemp)
            Cell.contentView.addSubview(vwTemp)
        }
        
        var arImg2 = [UIImageView]()
        for index in 200..<(200+itImg) {
            let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            img.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arImg2.append(img)
            Cell.contentView.addSubview(img)
        }
        
        var arLabel3 = [UILabel]()
        for index in 300..<(300+itLabel) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            label.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arLabel3.append(label)
            Cell.contentView.addSubview(label)
        }
        return (arVwView1,arImg2,arLabel3)
    }
    
    static func createLhRtCell (Cell:UITableViewCell , itView:Int, itImg:Int,itLabel:Int , itButton:Int)->([UIView],[UIImageView],[UILabel],[UIButton]) {
        
        let cent = UIScreen.main.bounds.width/100
        var arVwView1 = [UIView]()
        for index in 100..<(100+itView) {
            let vwTemp = UIView(frame: CGRect(x: cent*0, y: cent*0, width: cent*0, height: cent*0))
            vwTemp.tag = index
            arVwView1.append(vwTemp)
            Cell.contentView.addSubview(vwTemp)
        }
        
        var arImg2 = [UIImageView]()
        for index in 200..<(200+itImg) {
            let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            img.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arImg2.append(img)
            Cell.contentView.addSubview(img)
        }
        
        var arLabel3 = [UILabel]()
        for index in 300..<(300+itLabel) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            label.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arLabel3.append(label)
            Cell.contentView.addSubview(label)
        }
        
        var arButton = [UIButton]()
        for index in 400..<(400+itButton) {
            let label = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            label.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arButton.append(label)
            Cell.contentView.addSubview(label)
        }
        
        return (arVwView1,arImg2,arLabel3,arButton)
    }
    
    
    
    static func getLhRtcellViews(Cell:UITableViewCell,itView:Int,itImg:Int,itLabel:Int ) -> ([UIView],[UIImageView],[UILabel]) {
        let ar1 = arVwCellViewsWithRange(Cell, rg: 100...100+itView)
        let ar2 = arVwCellViewsWithRange(Cell, rg: 200...200+itImg ) as! [UIImageView]
        let ar3 = arVwCellViewsWithRange(Cell, rg: 300...300+itLabel) as! [UILabel]
        
        return (ar1,ar2, ar3 )
    }
    
    static func getLhRtcellViews(Cell:UITableViewCell,itView:Int,itImg:Int,itLabel:Int, itButton:Int ) -> ([UIView],[UIImageView],[UILabel],[UIButton]) {
        let ar1 = arVwCellViewsWithRange(Cell, rg: 100...100+itView)
        let ar2 = arVwCellViewsWithRange(Cell, rg: 200...200+itImg ) as! [UIImageView]
        let ar3 = arVwCellViewsWithRange(Cell, rg: 300...300+itLabel) as! [UILabel]
        let ar4 = arVwCellViewsWithRange(Cell, rg: 400...400+itButton) as! [UIButton]
        
        
        return (ar1,ar2, ar3,ar4 )
    }
    
    static func getLhRtcellViews(Cell:UICollectionViewCell ,itView:Int,itImg:Int,itLabel:Int, itButton:Int ) -> ([UIView],[UIImageView],[UILabel],[UIButton]) {
        let ar1 = arVwCellViewsWithRange(Cell, rg: 100...100+itView)
        let ar2 = arVwCellViewsWithRange(Cell, rg: 200...200+itImg ) as! [UIImageView]
        let ar3 = arVwCellViewsWithRange(Cell, rg: 300...300+itLabel) as! [UILabel]
        let ar4 = arVwCellViewsWithRange(Cell, rg: 400...400+itButton) as! [UIButton]
        
        
        return (ar1,ar2, ar3,ar4 )
    }
    
    static func createLhRtCell (Cell:UICollectionViewCell , itView:Int, itImg:Int,itLabel:Int , itButton:Int)->([UIView],[UIImageView],[UILabel],[UIButton]) {
        
        let cent = UIScreen.main.bounds.width/100
        var arVwView1 = [UIView]()
        for index in 100..<(100+itView) {
            let vwTemp = UIView(frame: CGRect(x: cent*0, y: cent*0, width: cent*0, height: cent*0))
            vwTemp.tag = index
            arVwView1.append(vwTemp)
            Cell.contentView.addSubview(vwTemp)
        }
        
        var arImg2 = [UIImageView]()
        for index in 200..<(200+itImg) {
            let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            img.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arImg2.append(img)
            Cell.contentView.addSubview(img)
        }
        
        var arLabel3 = [UILabel]()
        for index in 300..<(300+itLabel) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            label.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arLabel3.append(label)
            Cell.contentView.addSubview(label)
        }
        
        var arButton = [UIButton]()
        for index in 400..<(400+itButton) {
            let label = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            label.tag = index
            //label.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            arButton.append(label)
            Cell.contentView.addSubview(label)
        }
        
        return (arVwView1,arImg2,arLabel3,arButton)
    }
    
    
    
    static func getLhRtcellViews(Cell:UITableViewCell ) -> ([UIView],[UIImageView],[UILabel],[UIButton]) {
        let rs = getLhRtcellViews(Cell: Cell, itView: 99, itImg: 99, itLabel: 99 , itButton:99)
        
        return (rs.0,rs.1, rs.2 , rs.3)
    }
    static func delayToDo(_ delay:Double,doSomething: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: doSomething)
    }
    
    static func arVwCellViewsWithRange(_ cell:UITableViewCell,rg: CountableClosedRange<Int> ) ->[UIView] {
        var rtViews:[UIView] = [UIView]()
        for i in rg {
            let temp = cell.contentView.viewWithTag(i)
            if temp != nil {
                rtViews.append(temp!)
            }
        }
        return rtViews
    }
    
    static func arVwCellViewsWithRange(_ vw:UIView,rg:CountableClosedRange<Int> ) ->[UIView] {
        var rtViews:[UIView] = [UIView]()
        for i in rg {
            let temp = vw.viewWithTag(i)
            if temp != nil {
                rtViews.append(temp!)
            }
        }
        return rtViews
    }

    static func stateNavSpace (_ vc:UIViewController)->CGFloat {
        return stateSpace(vc) + navSpace(vc)
    }
    
    static func TopBottomSpace(_ vc:UIViewController)->CGFloat {
        var rt:CGFloat = 0
        let navs = navSpace(vc)
        let states = stateSpace(vc)
        let tabs = tabSpace(vc)
        rt = screenBounds.height - (navs + states + tabs)
        return rt
    }
    
    static func tabSpace(_ vc:UIViewController)->CGFloat {
        var rt:CGFloat = 0
        if vc.tabBarController != nil {
            rt = vc.tabBarController!.tabBar.frame.height
        }
        return rt
    }
    
    static func stateSpace (_ vc:UIViewController)->CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    static func navSpace (_ vc:UIViewController)->CGFloat {
        var rt :CGFloat = 0
        if vc.navigationController?.navigationBar.frame.height != nil {
            rt = (vc.navigationController?.navigationBar.frame.height)!
        }
        return rt
    }
}

class LHViewController:UIViewController {
    let cent = LHKit.centSpace
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
}
