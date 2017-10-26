
//
//  ViewController.swift
//  view switcher
//
//  Created by admin on 2017/10/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // Create the new view controller, if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Yellow")
                    as! YellowViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Blue")
                    as! BlueViewController
            } }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        // Switch view controllers
        if blueViewController != nil
            && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight,
                                          for: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController,
                                 to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft,
                                          for: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController,
                                 to: blueViewController)
        }
        UIView.commitAnimations()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载视图之后，进行一些额外设置
        blueViewController =
            storyboard?.instantiateViewController(withIdentifier: "Blue")
            as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to:blueViewController)
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    
    
    private func switchViewController(from fromVC:UIViewController?,
                                      to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }
}

