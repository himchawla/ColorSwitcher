//
//  circle.swift
//  ColorSwitcher
//
//  Created by thunderChawla on 24/05/21.
//

import Foundation
import UIKit;
import SpriteKit;
import GameplayKit;

class Circle:SKNode
{
    private var shape: SKSpriteNode!
    var activeColor:Ball.Colors = Ball.Colors.red;

    func getShape() -> SKSpriteNode
    {
        return shape;
    }
    
    func createShape() -> SKSpriteNode
    {
        shape = SKSpriteNode(imageNamed: "circe.png")
        shape.position = CGPoint(x: 0,y: -350);
        
        return shape;
    }

    func previous()
    {
        activeColor.change(_color: activeColor, _value: 0);
    }

    func next()
    {
        activeColor.change(_color: activeColor, _value: 1);
    }
}

