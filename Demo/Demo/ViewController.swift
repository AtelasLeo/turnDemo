//
//  ViewController.swift
//  Demo
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 admin. All rights reserved.
//

// 显示cell的个数
let CELLCOUNT = 5

import UIKit

class ViewController: UITableViewController {

    let identifier = "demoCell"
    
    var index : Int = -1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 注册自定义cell
        tableView.registerClass(DemoCell.self, forCellReuseIdentifier: identifier)
        
        // 向下偏移100
        tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        
        // 关闭交互
        tableView.userInteractionEnabled = false
        
        NSThread.sleepForTimeInterval(3.0)
        // 添加定时器
        addTimer()
        }
    
    
    // 加载数据
    lazy var data:NSMutableArray = {
    
        let arr = NSMutableArray()
        
        let filePath = NSBundle.mainBundle().pathForResource("demo.plist", ofType: nil)
        
        let dict = NSDictionary(contentsOfFile: filePath!)
        
        let tmp: NSArray = dict?.objectForKey("Info") as! NSArray
  
        for d in tmp{
        
            let model = DemoModel(dict: d as! [String : AnyObject])
            
            arr.addObject(model)
   
        }
        
        return arr
    }()
    
    
    // 添加定时器
    func addTimer () {
    
        let t = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "run", userInfo: nil, repeats: true)
        
        NSRunLoop.mainRunLoop().addTimer(t, forMode: NSRunLoopCommonModes)
      
    }
    
    // 定时器执行的方法
    func run () {
        
        index++
        
        var row = index
        
        if row > CELLCOUNT - 1 {
            
            row = index % CELLCOUNT
        }
        
       let indexPath = NSIndexPath.init(forRow: row, inSection: 0)
        tableView(tableView, didSelectRowAtIndexPath: indexPath)
        
    }

}

extension ViewController {

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CELLCOUNT
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! DemoCell
        
        let model = self.data[indexPath.row] as!DemoModel
        // 给cell的模型传值
        cell.model = model
        // 默认隐藏
        cell.hidden = true
        
        // 随机色
        cell.backgroundColor = UIColor(red:CGFloat(arc4random_uniform(256)) / 255, green: CGFloat(arc4random_uniform(256)) / 255, blue: CGFloat(arc4random_uniform(256)) / 255, alpha: 1.0)
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let cell:DemoCell = tableView.cellForRowAtIndexPath(indexPath) as! DemoCell
        
        if index > CELLCOUNT - 1 && index < data.count{
            
            cell.model = data[index] as? DemoModel
            
        }else{
            
            cell.model = data[index % (data.count)] as? DemoModel
        }
      
        cell.backgroundColor = UIColor(red:CGFloat(arc4random_uniform(256)) / 255, green: CGFloat(arc4random_uniform(256)) / 255, blue: CGFloat(arc4random_uniform(256)) / 255, alpha: 1.0)

        // 设置动画
        let transition = CATransition()
        // 动画的类型
        transition.type = "cube"
        // 动画的时间
        transition.duration = 0.7
        cell.layer.addAnimation(transition, forKey: nil)
        // 显示
        cell.hidden = false
        
        
      }
    
}
