//
//  MainViewController.swift
//  DevelopHer2014
//
//  Created by Ya Kao on 11/15/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var descriptionHUD: UIView!
    @IBOutlet weak var whosHereButton: UIButton!
    var titleImageView = UIImageView(image: UIImage(named: "home.png"))
    //Check if the user is currently going public
    var goPublic: Bool = false

    var navigationRightButton = UIBarButtonItem(image: UIImage(named: "peopleList.png"), style: .Done, target: nil, action: "goToPeopleList")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionHUD.alpha = 0

        // Do any additional setup after loading the view.
        self.navigationItem.titleView = titleImageView
        if(!goPublic){
            self.updateRightBarButton(false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func animateHUD(#alpha: CGFloat){
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.descriptionHUD.alpha = alpha
            
            }, completion:{ finished in
                //println("change alpha")
            
            })
    }
    
    func updateRightBarButton(show: Bool){
        if(show){
            self.navigationItem.setRightBarButtonItem(self.navigationRightButton, animated: false)
            
        }else{
            self.navigationItem.setRightBarButtonItem(nil, animated: false)
        }
    }
    
    func goToPeopleList(){
        println("goToPeopleList")
        self.performSegueWithIdentifier("ShowPeopleListSegue", sender: self)
        
    }
    
    @IBAction func onWhosHere(sender: AnyObject) {
        println("Click on Who's here button")
        self.goPublic = true
        self.updateRightBarButton(true)
    }

    @IBAction func onWhatsThis(sender: AnyObject) {
        println("Show what's this description")
        animateHUD(alpha: 0.8)
    }

    @IBAction func dismissHUD(sender: AnyObject) {
        animateHUD(alpha: 0)
    }

}
