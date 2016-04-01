//
//  ViewController.swift
//  GDataXMLDemo
//
//  Created by ying on 16/4/1.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseXMLWithGData()
    }
    
    func parseXMLWithGData() {
        //获取xml文件路径
        let xmlPath = NSBundle.mainBundle().pathForResource("users", ofType: "xml")
        //获取xml文件内容
        let xmlData = NSData(contentsOfFile: xmlPath!)
        //使用NSData对象初始化文档对象
        let doc = try! GDataXMLDocument(data: xmlData, options: 0)
        //通过XPath方式获取Users节点下所有的User节点，在路径复杂时特别方便
        let users = try! doc.nodesForXPath("//User", namespaces: nil) as! [GDataXMLElement]
        
        for user in users
        {
            //
            let uid = user.attributeForName("id").stringValue()
            //
            let nameElement = user.elementsForName("name")[0] as! GDataXMLElement
            //
            let uname = nameElement.stringValue()
            //
            let telElement = user.elementsForName("tel")[0] as! GDataXMLElement
            //
            let mobile = (telElement.elementsForName("mobile")[0] as! GDataXMLElement).stringValue()
            let home = (telElement.elementsForName("home")[0] as! GDataXMLElement).stringValue()
            //
            print("User: uid:\(uid),uname:\(uname),mobile:\(mobile),home:\(home)")
        }
        
    }
    
    

}

