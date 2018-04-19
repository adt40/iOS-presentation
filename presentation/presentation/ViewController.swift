//
//  ViewController.swift
//  presentation
//
//  Created by Austin Toot on 4/19/18.
//  Copyright © 2018 Austin Toot. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var spriteView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let spriteScene = SpriteScene(size: spriteView.bounds.size)
        spriteView.showsFPS = true
        spriteView.showsNodeCount = true
        spriteView.ignoresSiblingOrder = true
        spriteScene.scaleMode = .resizeFill
        spriteView.presentScene(spriteScene)
        
        spriteScene.addObject()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

