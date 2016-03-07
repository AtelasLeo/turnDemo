//
//  DemoCell.swift
//  Demo
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 admin. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {

    


    var model : DemoModel?{
        
        didSet{
            
            // 给子控件赋值
            phoneLabel.text = model!.phone
            moneylabel.text = model!.money
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(moneylabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 设置子控件的frame
    override func layoutSubviews() {
        
        let margin:CGFloat  = 40
        let width = self.frame.width * 0.7 - margin
        let height = self.frame.height
        phoneLabel.frame = CGRectMake(margin, 0, width, height)
        moneylabel.frame = CGRectMake(width, 0, self.frame.width - width, height)
        
    }
    
    // 懒加载子控件
    lazy var phoneLabel:UILabel = UILabel()
    
    lazy var moneylabel:UILabel = UILabel()

}
