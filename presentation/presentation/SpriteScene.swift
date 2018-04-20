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
    
    let maxRadius = 25
    let minRadius = 10
    let wallThickness = 10
    
    var bottomWall: SKNode!
    
    deinit {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func initialize(numObjects: Int) {
        backgroundColor = .white
        addWalls()
        addObjects(numObjects: numObjects)
    }
    
    func addObjects(numObjects: Int) {
        for _ in 0..<numObjects {
            
            let radius = Int(arc4random_uniform(UInt32(maxRadius))) + minRadius
            
            let ball = SKSpriteNode(imageNamed: "circle.png")
            ball.scale(to: CGSize(width: radius * 2, height: radius * 2))
            
            let xUpper = UInt32(self.size.width) - UInt32((radius + wallThickness) * 2)
            let x = Int(arc4random_uniform(xUpper)) + radius + wallThickness

            let yUpper = UInt32(self.size.height) - UInt32((radius + wallThickness) * 2)
            let y = Int(arc4random_uniform(yUpper)) + radius + wallThickness
            
            ball.position = CGPoint(x: x, y: y)
            
            let physics = SKPhysicsBody(circleOfRadius: CGFloat(radius))
            physics.affectedByGravity = true
            physics.restitution = 1.0
            physics.linearDamping = 0.0
            ball.physicsBody = physics
            
            addChild(ball)
        }
    }
    
    func addWalls() {
        let bottom = SKShapeNode(rect: CGRect(x: 0, y: 0, width: Int(self.size.width), height: wallThickness))
        bottom.fillColor = .brown
        let bottomPhysics = SKPhysicsBody(polygonFrom: bottom.path!)
        bottomPhysics.affectedByGravity = false
        bottomPhysics.isDynamic = false
        bottomPhysics.restitution = 1.0
        bottomPhysics.friction = 0.0
        bottom.physicsBody = bottomPhysics
        
        let top = SKShapeNode(rect: CGRect(x: 0, y: Int(self.size.height) - wallThickness, width: Int(self.size.width), height: wallThickness))
        top.fillColor = .brown
        let topPhysics = SKPhysicsBody(polygonFrom: top.path!)
        topPhysics.affectedByGravity = false
        topPhysics.isDynamic = false
        topPhysics.restitution = 1.0
        topPhysics.friction = 0.0
        top.physicsBody = topPhysics
        
        let left = SKShapeNode(rect: CGRect(x: 0, y: 0, width: wallThickness, height: Int(self.size.height)))
        left.fillColor = .brown
        let leftPhysics = SKPhysicsBody(polygonFrom: left.path!)
        leftPhysics.affectedByGravity = false
        leftPhysics.isDynamic = false
        leftPhysics.restitution = 1.0
        leftPhysics.friction = 0.0
        left.physicsBody = leftPhysics
        
        let right = SKShapeNode(rect: CGRect(x: Int(self.size.width) - wallThickness, y: 0, width: wallThickness, height: Int(self.size.height)))
        right.fillColor = .brown
        let rightPhysics = SKPhysicsBody(polygonFrom: right.path!)
        rightPhysics.affectedByGravity = false
        rightPhysics.isDynamic = false
        rightPhysics.restitution = 1.0
        rightPhysics.friction = 0.0
        right.physicsBody = rightPhysics
        
        addChild(top)
        addChild(bottom)
        addChild(left)
        addChild(right)
        
        bottomWall = bottom
    }
    
    func doAction() {
        let speed = 4.0
        let distance = CGFloat(3 * self.size.height / 4)
        
        let moveUp = SKAction.moveBy(x: 0, y: distance, duration: speed)
        let moveDown = SKAction.moveBy(x: 0, y: -distance, duration: speed / 10)
        let sequence = SKAction.sequence([moveUp, moveDown])
        bottomWall.run(sequence)
    }
}
