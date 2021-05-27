//
//  MenuScene.swift
//  ColorSwitcher
//
//  Created by thunderChawla on 24/05/21.
//

import UIKit;
import SpriteKit;
import GameplayKit;

class MenuScene: SKScene {

   
    static var intScore:Int = 0;
    
    
    override func didMove(to view: SKView) {
        
        var temp:String = "";
        let data:UserDefaults = UserDefaults();
        temp = data.getString(key: "HighScore") ?? "";
        
       
        let score = SKLabelNode(fontNamed: "Chalkduster");
        score.text = "High Score:    " + temp;
        score.fontSize = 45;
        score.fontColor = SKColor.green;
        score.position = CGPoint(x: -50, y: -300);
        MenuScene.intScore = Int(temp) ?? 0;
        
        self.addChild(score);

        
        
         let currScore = SKLabelNode(fontNamed: "Chalkduster");
         if GameScene.score > 0 { currScore.text = "Current Score: " + String(GameScene.score); }
         currScore.fontSize = 45;
         currScore.fontColor = SKColor.green;
        currScore.position = CGPoint(x: -50, y: -400);
        self.addChild(currScore);

        
        backgroundColor = SKColor(red: 0, green:0, blue:0, alpha: 1.0)
        let button = SKSpriteNode(imageNamed: "Start.png")
        button.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        button.name = "start"
        button.isPaused = false;
        self.addChild(button)
        
        let exit = SKSpriteNode(imageNamed: "Exit.png");
        exit.position = CGPoint(x: self.frame.midX, y: -120);
        exit.name = "exit";
        self.addChild(exit);
        
        let logo = SKSpriteNode(imageNamed: "Logo.png");
        logo.position = CGPoint(x: self.frame.midX, y: 350);
        logo.name = "logo";
        self.addChild(logo);
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodesarray = nodes(at: location)
            if let view = self.view
            {
                for node in nodesarray
                {
                    if node.name == "start"
                    {
                        let gameScene:SKScene? = SKScene(fileNamed:"GameScene");
                        let transition = SKTransition.flipVertical(withDuration: 1.0);
                        gameScene?.scaleMode = .aspectFill;
                        view.presentScene(gameScene!, transition: transition);
                    }
                    
                    if node.name == "exit"
                    {
                        exit(0);
                    }
                }
            }
        }
    }
}
