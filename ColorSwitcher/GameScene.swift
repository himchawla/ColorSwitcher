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

    var currentColor:Ball.Colors = Ball.Colors.red;
    
    
    var circle = Circle();
    var testBall = Ball()
    override func didMove(to view: SKView) {
        self.addChild(testBall.createShape());
        self.addChild(circle.createShape());
        let movePlayerAction = SKAction.moveTo(y: -400, duration: 0.8)
        testBall.getShape().run(movePlayerAction)
        testBall.updateColor();

    
    }
    
    func checkCollision()
    {
        if !testBall.hasScored
        {
            testBall.hasScored = true;
            if(circle.activeColor == testBall.color)
            {
                print("Yes");
            }
            else{
                print("No");
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self.view);
            let centerX:CGFloat? = self.view?.center.x;
            
            
            if touchLocation.x <  centerX! {
                let rotateAction = SKAction.rotate(byAngle: 3.14 / 2, duration: 0.3);
                circle.getShape().run(rotateAction);
                circle.next();
            }
            else
            {
                let rotateAction = SKAction.rotate(byAngle: -3.14 / 2, duration: 0.3);
                circle.getShape().run(rotateAction);
                circle.previous();
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        if testBall.getShape().position.y < -210 && testBall.getShape().position.y > -501
        {
            
            testBall.getShape().alpha -= 0.02;
            checkCollision();
        }
        
        
        if testBall.getShape().position.y == -400
        {
            self.run(SKAction.sequence([
                SKAction.wait(forDuration: 0.7),
                SKAction.run { [weak testBall] in testBall?.reset()}]));
            
        }
    }
    
   
    
}
