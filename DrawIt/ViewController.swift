//
//  ViewController.swift
//  FretQuiz
//
//  Created by Longmuir, Kevin on 7/5/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            for view in self.view.subviews {
                if(type(of: view) == UIButton.self){
                }
                else if(type(of: view) == UILayoutGuide.self){
                }
                else if(type(of: view) == UILabel.self)
                {
                    
                }
                else {
                    view.removeFromSuperview()
                }
            }

        }
    }
    
    func drawLine(color: UIColor){
        // testing the gitpush
        let randomIndex1: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex2: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex3: CGFloat = CGFloat(arc4random_uniform(255))
        
        let randomCoord: CGPoint = CGPoint(x:Int(arc4random_uniform(175)),y:Int(arc4random_uniform(467)))
        
        let myColor = UIColor(red: randomIndex1/255.0, green: randomIndex2/255.0, blue: randomIndex3/255.0, alpha: 1)
        let line = UIView(frame: CGRect(x: randomCoord.x, y: randomCoord.y, width: 200, height: 10))
        let line2 = UIView(frame: CGRect(x: randomCoord.x, y: randomCoord.y, width: 10, height: 200))
        let line3 = UIView(frame: CGRect(x: randomCoord.x+200, y: randomCoord.y, width: 10, height: 200))
        let line4 = UIView(frame: CGRect(x: randomCoord.x, y: randomCoord.y+200, width: 210, height: 10))
        line.backgroundColor = myColor
        line2.backgroundColor = myColor
        line3.backgroundColor = myColor
        line4.backgroundColor = myColor
        self.view.addSubview(line)
        self.view.addSubview(line2)
        self.view.addSubview(line3)
        self.view.addSubview(line4)
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 7.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sayHello(){
        print("Hello")
    }
	
    
    @IBAction func drawIt(_ sender: Any) {
        let randomIndex1: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex2: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex3: CGFloat = CGFloat(arc4random_uniform(255))
        
        let myColor = UIColor(red: randomIndex1/255.0, green: randomIndex2/255.0, blue: randomIndex3/255.0, alpha: 1)
        
        drawLine(color: myColor)
    }
}

