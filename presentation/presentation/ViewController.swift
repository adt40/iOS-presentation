//
//  ViewController.swift
//  presentation
//
//  Created by Austin Toot on 4/19/18.
//  Copyright © 2018 Austin Toot. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var spriteView: SKView!
    
    var spriteScene: SpriteScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        spriteScene = SpriteScene(size: spriteView.bounds.size)
        spriteView.showsFPS = true
        spriteView.showsNodeCount = true
        spriteView.ignoresSiblingOrder = true
        spriteScene.scaleMode = .resizeFill
        spriteView.presentScene(spriteScene)
        
        spriteScene.initialize(numObjects: 25)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        spriteScene.doAction()
    }

}

