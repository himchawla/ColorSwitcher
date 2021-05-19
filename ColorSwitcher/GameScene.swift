//
//  GameScene.swift
//  ColorSwitcher
//
//  Created by Himanshu Chawla on 20/05/21.
//

import UIKit;
import SpriteKit;
import GameplayKit;


class GameScene: SKScene {
    
    var shape: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createShape()
    }

    func createShape()
    {
        shape = SKSpriteNode(fileNamed: "")
        shape.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(shape);
    }
   
    
}
