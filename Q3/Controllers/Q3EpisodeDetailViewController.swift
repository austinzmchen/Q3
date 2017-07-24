//
//  Q3EpisodeDetailViewController.swift
//  Q3
//
//  Created by Austin Chen on 2017-07-23.
//  Copyright © 2017 Austin Chen. All rights reserved.
//

import UIKit

protocol ACTopLayerModalViewControllerDelegate: class {
    func willDismiss()
    func didDismiss()
}

class Q3EpisodeDetailViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: Any) {
        self.delegate?.willDismiss()
        self.dismiss(animated: true, completion: {
            self.delegate?.didDismiss()
        })
    }
    
    weak var delegate: ACTopLayerModalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
