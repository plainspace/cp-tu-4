//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Jared on 2/24/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        
        // set initial icon y position
        for button in buttons as! [UIButton] {
            button.center.y = 568 + button.frame.height / 2
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
