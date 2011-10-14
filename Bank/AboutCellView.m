//
//  AboutCellView.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 10/12/11.
//  Copyright (c) 2011 Unteleported. All rights reserved.
//

#import "AboutCellView.h"

@implementation AboutCellView

    @synthesize cellImage;
    @synthesize cellTitle;
    @synthesize cellDescr;

    - (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
        if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
            // Initialization code
        }
        return self;
    }

    - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
        
        [super setSelected:selected animated:animated];
        
        // Configure the view for the selected state
    }

    - (void)dealloc {
        [super dealloc];
    }

@end