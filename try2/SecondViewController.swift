//
//  SecondViewController.swift
//  try2
//
//  Created by kei ikeuchi on 2016/10/04.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let suii = image
        imageView.image = suii

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    

   
}
