//
//  PartnersCellView.m
//  Bank Online 2011
//
//  Created by Dmitry Krasnoukhov on 12/10/11.
//  Copyright 2009 Unteleported. All rights reserved.
//

#import "PartnersCellView.h"

@implementation PartnersCellView

    @synthesize cellImage;

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
