//
//  ViewController.swift
//  StopWatch03
//
//  Created by D7703_22 on 2019. 4. 2..
//  Copyright © 2019년 fb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timelbl: UILabel!
    var count = 0
    var myTimer = Timer()
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timelbl.text = String(count)
        timelbl.text = "스탑 워치"
    }
    
    @IBAction func playbtn(_ sender: Any) {
        if isAnimating == true {return}
        else{ isAnimating = true}
        //schedaleaTimer 호출
        if !myTimer.isValid{
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        else{
            print("Timer가 작동 중임")
        }
    }
    @IBAction func pausebtn(_ sender: Any) {
        myTimer.invalidate()
        isAnimating = false
    }
    @IBAction func stopbtn(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        timelbl.text = String(count)
        isAnimating = false
    }
    
    @objc func updateTime() {
        count += 1
        timelbl.text = String(count)
    }
    

}

