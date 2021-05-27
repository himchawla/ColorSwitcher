//
//  GameViewController.swift
//  ColorSwitcher
//
//  Created by Himanshu Chawla on 20/05/21.
//

import UIKit;
import SpriteKit;
import GameplayKit;

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            let scene = MenuScene(size: view.bounds.size);
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill;
//
//                // Present the scene
//                view.presentScene(scene);
        if let view = self.view as! SKView?
        {
            
                    let gameScene:SKScene? = SKScene(fileNamed:"MenuScene");
                    let transition = SKTransition.flipVertical(withDuration: 1.0);
                    gameScene?.scaleMode = .aspectFill;
                    view.presentScene(gameScene!, transition: transition);
            
            view.ignoresSiblingOrder = true;
            
            view.showsFPS = true;
            view.showsNodeCount = true;
        }
        
                
            }
            
           
            
            //view.showsPhysics
        }
    


