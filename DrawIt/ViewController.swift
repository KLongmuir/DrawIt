//
//  ViewController.swift
//  DrawIt
//
//  Created by Longmuir, Kevin on 7/5/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit
import CoreGraphics
import SpriteKit

class ViewController: UIViewController {
    
    var boxes : Array<UIView> = []
    var box : UIView?
    var animator:UIDynamicAnimator? = nil
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.view.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "toHey", sender: nil)
    }
    
    
    func createAnimatorStuff(box: UIView) {
        usleep(2000)
        animator = UIDynamicAnimator(referenceView:self.view);
        
        collider.addItem(box)
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)

        gravity.addItem(box);
        gravity.gravityDirection = CGVector(dx: 0, dy: 1.0)
        animator?.addBehavior(gravity);
        
    }
    
    @IBAction func goob(_ sender: Any) {
        self.performSegue(withIdentifier: "toHey", sender: nil)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            for view in self.view.subviews {
                if(type(of: view) == UIButton.self){
                }
                else if(type(of: view) == UILayoutGuide.self){
                }
                else if(type(of: view) == UILabel.self){
                    
                }
                else {
                    view.removeFromSuperview()
                }
            }

        }
    }
    
    func collisionCheck(testRect: CGRect) -> Bool {
        for box : UIView in boxes {
            let viewRect = box.frame;
            if(testRect.intersects(viewRect)) {
                return false
            }
        }
        return true
    }
    
    
    func addBox(location: CGRect) {
        let randomIndex1: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex2: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex3: CGFloat = CGFloat(arc4random_uniform(255))
        let myColor = UIColor(red: randomIndex1/255.0, green: randomIndex2/255.0, blue: randomIndex3/255.0, alpha: 1.0)
        
        let newBox = UIView(frame: location)
        newBox.backgroundColor = myColor
        boxes.append(newBox)
        
        view.insertSubview(newBox, at: 0)
        createAnimatorStuff(box: newBox)
    }
    
    
    func addBox2(location: CGRect) {
        let randomIndex1: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex2: CGFloat = CGFloat(arc4random_uniform(255))
        let randomIndex3: CGFloat = CGFloat(arc4random_uniform(255))
        
        let myColor = UIColor(red: randomIndex1/255.0, green: randomIndex2/255.0, blue: randomIndex3/255.0, alpha: 1)

        let newBox = UIView(frame: location)
        newBox.backgroundColor = myColor
        
        view.insertSubview(newBox, at: 0)
        boxes.append(newBox)
    }
    
    
    @IBAction func drawIt(_ sender: Any) {
        var randomCoord: Int = Int(arc4random_uniform(300))
        var placement = CGRect(x: randomCoord, y: 50, width: 50, height: 50)

        repeat {
            randomCoord = Int(arc4random_uniform(300))
            placement = CGRect(x: randomCoord, y: 50, width: 50, height: 50)
        } while(!collisionCheck(testRect: placement))
        
        addBox(location: CGRect(x: randomCoord, y: 50, width: 50, height: 50))
        
    }
}

