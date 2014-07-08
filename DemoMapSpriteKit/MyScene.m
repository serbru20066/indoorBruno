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
        
        posx=0;
        posx=20;
        posy=20;

        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    SKSpriteNode* nodo =(SKSpriteNode*)[self childNodeWithName:@"titulo"];
    [nodo removeFromParent];


    for (UITouch *touch in touches) {
        location = [touch locationInNode:self];
 
        [self createFlechasHoriz];

    }
}

-(void)update:(CFTimeInterval)currentTime {
    
SKSpriteNode* nodo =(SKSpriteNode*)[self childNodeWithName:@"flecha"];
    
    
    
}


-(void) createFlechasHoriz{
    
   // SKSpriteNode* nodo =(SKSpriteNode*)[self childNodeWithName:@"flecha"];

    
    
    self.nodoflecha=[SKSpriteNode spriteNodeWithImageNamed:@"puntaflecha.png"];
    
    if (posx>160) {
        return;

    }
    

    self.nodoflecha.position=CGPointMake(location.x+posx,location.y);
    self.nodoflecha.size=CGSizeMake(20, 20);
    self.nodoflecha.name=@"flecha";
   // self.nodoflecha.zPosition=80;
    
    [self addChild:self.nodoflecha];

    posx=posx+20;
    [self performSelector:@selector(createFlechasHoriz) withObject:nil afterDelay:0.2];
    
    
    
}


@end
