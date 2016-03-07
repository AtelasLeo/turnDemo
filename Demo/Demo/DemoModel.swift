//
//  DemoModel.swift
//  Demo
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 admin. All rights reserved.
//

import UIKit

class DemoModel: NSObject {

    // 中奖用户
    var phone : String?
    // 奖励
    var money: String?
    
    init(dict: [String :AnyObject]) {
        
        super.init()
        setValuesForKeysWithDictionary(dict)
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description :String {
    
     let dicts = ["phone" , "money"]
     return dictionaryWithValuesForKeys(dicts).description
      }

}
