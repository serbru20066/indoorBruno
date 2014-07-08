//
//  MyScene.m
//  DemoMapSpriteKit
//
//  Created by Altimea on 7/8/14.
//  Copyright (c) 2014 Altimea. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        background=[SKSpriteNode spriteNodeWithImageNamed:@"mapa.png"];
        background.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        background.size=CGSizeMake(1136, 640);

        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        myLabel.name=@"titulo";
        myLabel.text = @"Demo Mapa!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:background];
        [self addChild:myLabel];
        
        
       

        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    SKSpriteNode* nodo =(SKSpriteNode*)[self childNodeWithName:@"titulo"];
    [nodo removeFromParent];

    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"cuerpoflecha"];
        [sprite setSize:CGSizeMake(20, 20)];
        sprite.name=@"cuerpoflecha";
        sprite.position = location;
        
        
        SKSpriteNode *sprite2 = [SKSpriteNode spriteNodeWithImageNamed:@"puntaflecha"];
        [sprite2 setSize:CGSizeMake(20, 20)];
        sprite2.name=@"puntaflecha";
        sprite2.position=CGPointMake(location.x+20, location.y);
        
        [self addChild:sprite];
        [self addChild:sprite2];

        
        //esquina 1
        SKSpriteNode* nodo3 =[SKSpriteNode spriteNodeWithImageNamed:@"cuerpoflecha"];
        nodo3.name=@"cuerpoflecha2";
        nodo3.zRotation=-1.55;
        [nodo3 setSize:(CGSizeMake(15, 20))];
        [nodo3 setPosition:(CGPointMake(526, location.y +10))];
        
        [self addChild:nodo3];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    SKSpriteNode* nodo1 =(SKSpriteNode*)[self childNodeWithName:@"cuerpoflecha"];
     SKSpriteNode* nodo2 =(SKSpriteNode*)[self childNodeWithName:@"puntaflecha"];
   
    
   
   
    
    if (nodo2.position.x>525) {

        
        SKSpriteNode* nodo3 =(SKSpriteNode*)[self childNodeWithName:@"cuerpoflecha2"];
        [nodo3 setSize:(CGSizeMake(nodo3.size.width+0.5, nodo3.size.height))];
        [nodo3 setPosition:(CGPointMake(nodo3.position.x, nodo3.position.y-0.25))];
        
        
        [nodo1 setPosition:(CGPointMake(nodo1.position.x ,nodo1.position.y))];
        nodo2.zRotation=-1.5;
        [nodo2 setPosition:(CGPointMake(nodo2.position.x, nodo2.position.y-0.5))];

        
        return;
    }
    
    [nodo2 setPosition:(CGPointMake(nodo2.position.x+0.5, nodo2.position.y))];
    [nodo1 setSize:(CGSizeMake(nodo1.size.width+0.5, nodo1.size.height))];
    [nodo1 setPosition:(CGPointMake(nodo1.position.x+0.25, nodo1.position.y))];
    
}



@end
