//
//  DisplayTaskViewController.swift
//  TodoMakeSchool
//
//  Created by William Fernandes on 7/16/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var taskTitleText: UITextField!
    @IBAction func proritySelected(_ sender: UISegmentedControl) {
    }
    @IBAction func dueDatePicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect data
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        //initializing array of categories
        categoryPickerData = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6"]
        
        // hide back button
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /**********Picker View Code [Begin]********/
    @IBOutlet weak var categoryPicker: UIPickerView!
    var categoryPickerData: [String] = [String]()
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryPickerData.count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryPickerData[row]
    }
    /**********Picker View Code [End]********/
    
    
    
    
    @IBAction func taskSaveButtonTapped(_ sender: Any) {
    //add coreData elements to perform save activity
        navigationController?.popViewController(animated: true)
    }
}
