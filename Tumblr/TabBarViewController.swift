//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Jared on 2/24/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    @IBOutlet weak var explorePopup: UIImageView!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    var composeTransition: FadeTransition!
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        //Add the popup if the current VC is not Search
        if selectedIndex == 1 {
            explorePopup.hidden = true
        } else {
            explorePopup.hidden = false
        }
    }
    
    func addExplorePopup(view: UIView!) {
        //Initialize and add the explore popup without animation
        let popup = UIImageView()
        popup.image = UIImage(named: "explore_popup")
        popup.frame = CGRect(x: 0, y: 455, width: popup.image!.size.width, height: popup.image!.size.height)
        view.addSubview(popup)
        
        //Animate the popup
        while popup.hidden != false {
            let translation = CGAffineTransformMakeTranslation(0, -20)
            UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
                popup.transform = translation
                }) { (Bool) -> Void in
                    UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
                        popup.transform = CGAffineTransformTranslate(translation, 0, 20)
                        }, completion: { (Bool) -> Void in
                            
                    })
            }
        }
    }
    
    
    @IBAction func didPressCompose(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        
        let destinationViewController = segue.destinationViewController as! ComposeViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        composeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = composeTransition
        
        // Adjust the transition duration. (seconds)
        composeTransition.duration = 0.6
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        //Set up ViewControllers and the VC array
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]

        //Set up button array
        buttons = [homeButton, searchButton, accountButton, trendingButton]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        
        let translation = CGAffineTransformMakeTranslation(0, -6)
        UIView.animateWithDuration(1.0, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
            self.explorePopup.transform = translation
            }) { (Bool) -> Void in
                
        }
        
        // Do any additional setup after loading the view.
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
