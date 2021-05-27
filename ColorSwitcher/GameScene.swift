//
//  GameScene.swift
//  ColorSwitcher
//
//  Created by Himanshu Chawla on 20/05/21.
//

import UIKit;
import SpriteKit;
import GameplayKit;

extension UserDefaults {
   public func setString(string:String, forKey:String) {
        set(string, forKey: forKey)
    }
    func getString(key:String)->String?
    {
        return (object(forKey: key) as? String)
    }
}


class GameScene: SKScene {

    var currentColor:Ball.Colors = Ball.Colors.red;
    
    static var score:Int = 0;
    
    let score = SKLabelNode(fontNamed: "Arial");

    
    var circle = Circle();
    var testBall = Ball()
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0, green:0, blue:0, alpha: 1.0)

        
        score.text = String(GameScene.score);
        score.fontSize = 45;
        score.fontColor = SKColor.green;
        score.position = CGPoint(x: 300, y: 350 );
        self.addChild(score);
        
        GameScene.score = 0;
        self.addChild(testBall.createShape());
        self.addChild(circle.createShape());
        let movePlayerAction = SKAction.moveTo(y: -350, duration: 1.4)
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
                GameScene.score += 1;
                print(GameScene.score)
            }
            else
            {
                
                    if MenuScene.intScore < GameScene.score
                    {
                        let data:UserDefaults = UserDefaults();
                        data.setString(string: String(GameScene.score), forKey: "HighScore");
                    }
                    if let view = self.view
                    {
                        
                                let gameScene:SKScene? = SKScene(fileNamed:"MenuScene");
                                let transition = SKTransition.flipVertical(withDuration: 1.0);
                                gameScene?.scaleMode = .aspectFill;
                                view.presentScene(gameScene!, transition: transition);
                    }
                
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
                
                self.run(SKAction.sequence([
                                                SKAction.wait(forDuration: 0.15),
                    SKAction.run { [weak circle] in circle?.next()}]));
                
                
            }
            else
            {
                let rotateAction = SKAction.rotate(byAngle: -3.14 / 2, duration: 0.3);
                circle.getShape().run(rotateAction);
                
                self.run(SKAction.sequence([
                                            SKAction.wait(forDuration: 0.15),
                    SKAction.run { [weak circle] in circle?.previous()}]));
                
                
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
        
        
        if testBall.getShape().position.y == -350
        {
            self.run(SKAction.sequence([
                SKAction.wait(forDuration: 0.7),
                SKAction.run { [weak testBall] in testBall?.reset()}]));
            
        }
        
        score.text = String(GameScene.score);
    }
    
   
    
}
