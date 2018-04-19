//
//  SpriteScene.swift
//  presentation
//
//  Created by Austin Toot on 4/19/18.
//  Copyright © 2018 Austin Toot. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteScene : SKScene {
    
    deinit {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func addObject() {
        backgroundColor = .white
        let radius = 25
        let wallThickness = 10
        
        for _ in 0..<4 {
            let ball = SKSpriteNode(imageNamed: "circle.png")
            ball.scale(to: CGSize(width: radius * 2, height: radius * 2))
            
            let x = CGFloat(arc4random_uniform(UInt32(self.size.width - 2 * (radius + wallThickness))) + radius + wallThickness)
            let y = CGFloat(arc4random_uniform(UInt32(self.size.height - 2 * (radius + wallThickness))) + radius + wallThickness)
            
            ball.position = CGPoint(x: x, y: y)
            
            let physics = SKPhysicsBody(circleOfRadius: radius)
            physics.affectedByGravity = true
            physics.restitution = 1.0
            physics.linearDamping = 0.0
            ball.physicsBody = physics
            
            addChild(ball)
        }
        
        let bottom = SKShapeNode(rect: CGRect(x: 0, y: 0, width: Int(self.size.width), height: wallThickness))
        bottom.fillColor = .brown
        let bottomPhysics = SKPhysicsBody(polygonFrom: bottom.path!)
        bottomPhysics.affectedByGravity = false
        bottomPhysics.isDynamic = false
        bottomPhysics.restitution = 1.0
        bottom.physicsBody = bottomPhysics
        
        let top = SKShapeNode(rect: CGRect(x: 0, y: Int(self.size.height) - wallThickness, width: Int(self.size.width), height: wallThickness))
        top.fillColor = .brown
        let topPhysics = SKPhysicsBody(polygonFrom: top.path!)
        topPhysics.affectedByGravity = false
        topPhysics.isDynamic = false
        topPhysics.restitution = 1.0
        top.physicsBody = topPhysics
        
        let left = SKShapeNode(rect: CGRect(x: 0, y: 0, width: wallThickness, height: Int(self.size.width)))
        left.fillColor = .brown
        let leftPhysics = SKPhysicsBody(polygonFrom: left.path!)
        leftPhysics.affectedByGravity = false
        leftPhysics.isDynamic = false
        leftPhysics.restitution = 1.0
        left.physicsBody = leftPhysics
        
        let right = SKShapeNode(rect: CGRect(x: Int(self.size.width) - wallThickness, y: 0, width: Int(self.size.width), height: wallThickness))
        right.fillColor = .brown
        let rightPhysics = SKPhysicsBody(polygonFrom: right.path!)
        rightPhysics.affectedByGravity = false
        rightPhysics.isDynamic = false
        rightPhysics.restitution = 1.0
        right.physicsBody = rightPhysics
        
        addChild(top)
        addChild(bottom)
        addChild(left)
        addChild(right)
        
    }
}
