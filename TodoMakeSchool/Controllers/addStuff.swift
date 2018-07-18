//
//  addStuff.swift
//  TodoMakeSchool
//
//  Created by Sneha Pankaj on 7/18/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//
/*
import Foundation
import UIKit
class addStuff {
    
   func addStuff(){
        /****Programatically add button to "Add/Create Task" [Begin]****/
        
        var addTaskButton = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.maxX - 75, y: self.view.frame.size.height - 140), size: CGSize(width: 50, height: 50)))
        addTaskButton.setTitle("+", for: .normal)
        addTaskButton.backgroundColor = UIColor(red:1.00, green:0.27, blue:0.32, alpha:1.0)
        addTaskButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        //adding action to the button
        addTaskButton.addTarget(self, action: #selector(addTaskClicked(_ :)), for: .touchUpInside)
        
        self.view.addSubview(addTaskButton)
        
        /****Programatically add button to "Add/Create Task" [End]****/
    }
    @objc func addTaskClicked(_ :UIButton){
        //insert segue to DisplayTaskViewController
        print("Add Category Tapped")
    }
}*/
