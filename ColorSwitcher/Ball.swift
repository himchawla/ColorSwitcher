//
//  Ball.swift
//  ColorSwitcher
//
//  Created by Himanshu Chawla on 20/05/21.
//

import Foundation
import UIKit;
import SpriteKit;
import GameplayKit;

class Ball:SKNode
{
    public var hasScored:Bool = false;
    private var shape: SKSpriteNode!

    func getShape() -> SKSpriteNode
    {
        return shape;
    }
    
    public enum Colors:Int
    {
        case red = 0, blue = 1, green = 2, white = 3;
        func randomColor() -> Colors {
            var temp:Colors = Colors.red;
            
            switch Int.random(in: 1...4) {
            case 1:
                temp = Colors.red;
            case 2:
                temp = Colors.blue;
            case 3:
                temp = Colors.green;
            case 4:
                temp = Colors.white;
            default:
                exit(0);
                
            }
            return temp;
            
        }
        
        mutating func change(_color:Colors, _value:Int)
        {
            if(_value == 0)
            {
                switch _color
                {
                case .red:
                    self = Colors.white;
                case .blue:
                    self = Colors.red
                case .green:
                    self = Colors.blue;
                case .white:
                    self = Colors.green;
                }
            }
            else
            {
                switch _color
                {
                case .red:
                    self = Colors.blue;
                case .blue:
                    self = Colors.green
                case .green:
                    self = Colors.white;
                case .white:
                    self = Colors.red;
                }
            }
        }
    };
    var color:Colors = Colors.red;
    
    func reset()
    {
        if shape.position.y == -350
        {
            hasScored = false;
            shape.position.y = 500;
            let movePlayerAction:SKAction;
            if GameScene.score < 10
            {   movePlayerAction = SKAction.moveTo(y: -350, duration: 1.4); }
            else
            {   movePlayerAction = SKAction.moveTo(y: -350, duration: 1.2); }
            shape.run(movePlayerAction);
            shape.alpha = 1.0;
            updateColor();
            
        }
    }
   
    func updateColor()
    {
        let tempColor:Colors = color;
        
        while tempColor == color    { color = color.randomColor(); }
        switch color
        {
        case .red:
            shape.color = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            shape.colorBlendFactor = 1.0
        case .blue:
            shape.color = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
            shape.colorBlendFactor = 1.0
        case .green:
            shape.color = #colorLiteral(red: 0.002741014996, green: 1, blue: 0, alpha: 1)
            shape.colorBlendFactor = 1.0
        case .white:
            shape.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            shape.colorBlendFactor = 1.0
        }
    }
        
    func createShape() -> SKSpriteNode
    {
        shape = SKSpriteNode(imageNamed: "ball.png")
        shape.position = CGPoint(x:self.frame.midX, y:500);
        
        return shape;
    }
}
