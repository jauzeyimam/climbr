//
//  JIRouteSpecsCell.h
//  TheCrag
//
//  Created by Imam, Jauzey on 6/29/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JIRouteSpecsCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellImg;

- (void) setItemDetail: (UIImage*) img;

@end
