//
//  TimeViewController.swift
//  TodoMakeSchool
//
//

import UIKit
import AVFoundation

class TimeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var task: Task?
    
    var seconds = 1500 //25 minutes
    var timerDisplay = String(format:"%02i:%02i:%02i", 00, 25, 00)
    var timer = Timer()
    
    var isTimerRunning = false
    var resumeTapped = false
    var isBreakTime = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupViews()
        pauseButton.isEnabled = false
        
        timerLabel.text = timerDisplay
        taskNameLabel.text = task?.name
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimeViewController.updateTimer)), userInfo: nil, repeats: true)

        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        //seconds = 1500
        //timerLabel.text = timeString(time: TimeInterval(seconds))
        pomoSetup()
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        
        if seconds < 1 {
            
            PMSoundHelper.playSound(soundFile: "alarm")
            
            if !isBreakTime {
                
                breakSetup()
                
                task?.pomoCount += 1

            } else {

                pomoSetup()
            }
            
            timer.invalidate()
            
        } else {
            seconds -= 1
            timerLabel.text = String(seconds)
        }
        
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time: TimeInterval) -> String {
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", 00, minutes, seconds)
    }
    
    func pomoSetup(){
        seconds = 1500
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isBreakTime = false
    }
    
    func breakSetup(){
        seconds = 300
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isBreakTime = true
    }
    
    func longBreakSetup(){
        seconds = 900
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isBreakTime = true
    }
    
    func setupViews() {
        taskNameLabel.layer.cornerRadius = 8
        taskNameLabel.layer.masksToBounds = true
    }
}
