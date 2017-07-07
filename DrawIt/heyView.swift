//
//  heyView.swift
//  DrawIt
//
//  Created by Kevin Longmuir on 7/6/17.
//  Copyright © 2017 Longmuir, Kevin. All rights reserved.
//

import UIKit

class heyView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toMain(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "toMain", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
