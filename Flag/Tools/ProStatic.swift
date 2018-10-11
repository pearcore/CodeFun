//
//  ProStatic.swift
//  mallPad
//
//  Created by lh on 2018/7/17.
//  Copyright © 2018年 lh. All rights reserved.
//
import UIKit
import SwiftyJSON

class ProStatic {
    static let stArWeekDay = ["没这天","星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日",]
    static let flMyVer:Float = (Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as AnyObject).floatValue
    static var stServer:String = "http://192.168.1.55:1111"
    static var stServerApi:String = stServer + "/API/"
    static var stServer2:String = "http://300.fang101.com"
    static var stServerApi2:String = stServer2 + "/API/"
    static var stServer3:String = "http://124.95.165.214:8012"
    static var stServerApi3:String = stServer3 + "/api/"
    
    static var stTestAPI:String = "http://192.168.1.211:5000/"
    static var stTestAPISingle:String = stTestAPI+"testSingle"
    static var stTestAPIMultiple:String = stTestAPI+"testMultiple"
    
    static var isShowLog = true
    static var jsLogin:JSON = []
    static var jsLogin2:JSON = []
    static var jsComplaint:[JSON] = []
    static let clCellBg = UIColor(red: 238/255, green: 238/255, blue: 237/255, alpha: 1)
    static let clBgGray = UIColor(red: 244/255,green: 244/255,blue: 244/255, alpha: 1)
    static let clLineGray = UIColor.init(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)
    static let clFontGray = UIColor.init(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
    static let clThemeBgGreen = UIColor(red: 189/255 , green: 239/255 , blue: 228/255, alpha: 1)
    static let clFontLightGray = UIColor.init(red: 218/255, green: 218/255, blue: 218/255, alpha: 1)
    static let clWhite = UIColor.white
    static let clRed = UIColor.init(red: 230, green: 0, blue: 0, alpha: 1)
    static let clGreen = UIColor(red: 41/255, green: 170/255, blue: 138/255, alpha: 1)
    static let clOrange = UIColor.orange
    static let clBlack = UIColor.black
    static let clBlue = UIColor.blue
    static let clPurple = UIColor.purple
    static let clOrange2 = UIColor.init(red: 1, green: 186.0/255, blue: 0, alpha: 1 )
    
    static let cent = UIScreen.main.bounds.width/100
    static let flRowHeight:CGFloat =  44 //13.75 * ProStatic.cent //
    static let flRowFont :CGFloat = ProStatic.flRowHeight * (17/44)
    static let flHeaderHeight:CGFloat  =  0.66 * ProStatic.flRowHeight  //ProStatic.flRowHeight * (30/44) //8 * ProStatic.cent // 20
    static let flHeaderFont:CGFloat = ProStatic.flHeaderHeight * 0.6
    static let flRowLine:CGFloat = 0.5
    static let isThisGameInNumbers = false
    static let arStLevels = [
        "第1关 牛刀小试",
        "第2关 增加难度",
        
        "第3关 左右分离",
        "第4关 向左看齐",
        "第5关 垂直相聚",
        "第6关 向右看齐",
        
        "第7关 中线分离",
        "第8关 地心引力",
        "第9关 中线汇聚",
        "第10关 飞向天空",
        
        "第11关 四散奔逃",
        "第12关 拥护核心",
    ]
    
    static let arIt0 = [
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        1,2,3,4,5,6,7,8,
        ]
    static let arIt50 = [
        1,1,2,2,3,3,4,4,
        5,5,6,6,7,7,8,8,
        9,9,10,10,11,11,12,12,
        13,13,14,14,15,15,16,16,
        17,17,18,18,19,19,20,20,
        21,21,22,22,23,23,24,24,
        25,25,26,26,27,27,28,28,
        1,1,2,2,3,3,4,4,
        5,5,6,6,7,7,8,8,
        9,9,10,10,11,11,12,12,
        13,13,14,14,15,15,16,16,
        17,17,18,18,19,19,20,20,
        21,21,22,22,23,23,24,24,
        25,25,26,26,27,27,28,28,
        ]
    static let arIt100 = [
        1,2,3,4,5,6,7,8,
        9,10,11,12,13,14,15,16,
        17,18,19,20,21,22,23,24,
        25,26,27,28,29,30,31,32,
        33,34,35,36,37,38,39,40,
        41,42,43,44,45,46,47,48,
        49,50,51,52,53,54,55,56,
        1,2,3,4,5,6,7,8,
        9,10,11,12,13,14,15,16,
        17,18,19,20,21,22,23,24,
        25,26,27,28,29,30,31,32,
        33,34,35,36,37,38,39,40,
        41,42,43,44,45,46,47,48,
        49,50,51,52,53,54,55,56,
        ]
}
