//
//  Q3FeedViewController.swift
//  Q3
//
//  Created by Austin Chen on 2017-07-23.
//  Copyright © 2017 Austin Chen. All rights reserved.
//

import UIKit

class Q3FeedViewController: UIViewController {
    var shouldScaleDown: Bool = false
    var origFrame: CGRect?
    
    @IBAction func rightBarButtonTapped(_ sender: Any) {
        shouldScaleDown = true
        self.view.setNeedsLayout()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.statusBarStyle = .lightContent
        
        performSegue(withIdentifier: "presentEpisodeDetailVC", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        origFrame = self.view.frame
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentEpisodeDetailVC",
            let detailVC = segue.destination as? Q3EpisodeDetailViewController
        {
            detailVC.delegate = self
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if shouldScaleDown {
            if var f = origFrame {
                f.size.width = UIScreen.main.bounds.width * 0.9
                f.origin.x = (UIScreen.main.bounds.width - f.width) / 2.0
                f.origin.y = 20
                
                self.view.frame = f
                
                self.view.layer.cornerRadius = 8
                self.view.layer.masksToBounds = 8 > 0
            }
        } else {
            self.view.frame = origFrame!
            
            self.view.layer.cornerRadius = 0
            self.view.layer.masksToBounds = 0 > 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension Q3FeedViewController: ACTopLayerModalViewControllerDelegate{
    func willDismiss() {
        shouldScaleDown = false
        self.view.setNeedsLayout()
        UIApplication.shared.statusBarStyle = .default
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func didDismiss() {
        
    }
}
