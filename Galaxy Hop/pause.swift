//
//  pause.swift
//  Galaxy Hop
//
//  Created by Bruce Jiang on 5/3/20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import SpriteKit

class pause : SKScene {
    
    private var score : SKLabelNode!
    private var highestScore: SKLabelNode!
    private var player : SKSpriteNode?
    
    // load data from the shared struct to labels
    override func sceneDidLoad() {
        self.score = self.childNode(withName: "score") as? SKLabelNode
        self.highestScore = self.childNode(withName: "highestScore") as? SKLabelNode
        self.score.text = String(pauseData.score)
        self.highestScore.text = String(StatsVars.highestScore)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func didMove(to view: SKView) {
        self.player = self.childNode(withName: "playerWing") as? SKSpriteNode
        let dX = 0
        let dY = 100
        let moveActionUp = SKAction.moveBy(x: CGFloat(dX), y: CGFloat(dY), duration: 1.0)
        let moveActionDown = SKAction.moveBy(x: CGFloat(dX), y: CGFloat(-100), duration: 1.0)
        let sequence = SKAction.sequence([moveActionUp, moveActionDown]);
        let bounce = SKAction.repeatForever(sequence);
        player!.run(bounce)

    }
    
    func touchDown(atPoint pos : CGPoint) {
        let currX = pos.x
        let currY = pos.y
        if currX <= -37 && currX >= -283 && currY <= -357 && currY >= -603 {
            print("return to menu")
            pauseData.valid = false
            let sceneTwo = GameScene(fileNamed: "GameScene")
            sceneTwo?.scaleMode = .aspectFill
            self.view?.presentScene(sceneTwo!, transition: SKTransition.fade(withDuration: 1))
        }
        if currX <= 278 && currX >= 32 && currY <= -357 && currY >= -603 {
            print("resume play")
            let sceneTwo = game1(fileNamed: "game1")
            sceneTwo?.scaleMode = .aspectFill
            self.view?.presentScene(sceneTwo!, transition: SKTransition.fade(withDuration: 1))
        }
    }
    
}
