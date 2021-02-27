//
//  JZCIFilter.h
//  JZCIFilter
//
//  Created by laotouzi on 2021/2/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZCIFilter : NSObject

+ (UIImage *)createQRCodeWithInfo:(NSString *)info withSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
