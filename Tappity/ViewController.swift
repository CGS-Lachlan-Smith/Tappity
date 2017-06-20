//
//  ViewController.swift
//  Tappity
//
//  Created by Lachlan Smith on 29/5/17.
//  Copyright © 2017 Lachlan Smith. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var score: UILabel!
    var seconds = 30
    var points = 0
    var timerRunning = false
    let colorArray = [UIColor.red, UIColor.green, UIColor.black, UIColor.yellow]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func countdown(sender:UIButton) {
        if timerRunning == false{
           timerRunning = true
            points += 1
            self.score.text = ("\(points)")
            view.backgroundColor = colorArray [Int(arc4random_uniform(3))]
     let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
        self.seconds -= 1
        self.timer.text = ("\(self.seconds)")
        if self.seconds == 0 {
            timer.invalidate()
            self.alert()
            self.timerRunning = false
            self.seconds = 30
            self.timer.text = ("\(self.seconds)")
            self.points = 0
            self.score.text = ("\(self.points)")
            self.view.backgroundColor = UIColor.blue
        }
            }
        }else {
        points += 1
            self.score.text = ("\(points)")
             view.backgroundColor = colorArray [Int(arc4random_uniform(3))]
        }
    }
    
    func alert(){
        
    let alert = UIAlertController(title: "Game Over", message: "Your score is: \(points)", preferredStyle: UIAlertControllerStyle.actionSheet)
    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
    
    
}

