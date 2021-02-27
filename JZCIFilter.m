//
//  JZCIFilter.m
//  JZCIFilter
//
//  Created by laotouzi on 2021/2/27.
//

#import "JZCIFilter.h"
#import <CoreImage/CoreImage.h>

@implementation JZCIFilter

+ (UIImage *)createQRCodeWithInfo:(NSString *)info withSize:(CGFloat)size{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    //把信息转化为NSData
    NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    //滤镜对象kvc存值
    [filter setValue:infoData forKeyPath:@"inputMessage"];

    CIImage *image = [filter outputImage];
    
    CGRect extent = CGRectIntegral(image.extent);
     CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));

     //1.创建bitmap;
     size_t width = CGRectGetWidth(extent) * scale;
     size_t height = CGRectGetHeight(extent) * scale;
     CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
     CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
     CIContext *context = [CIContext contextWithOptions:nil];
     CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
     CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
     CGContextScaleCTM(bitmapRef, scale, scale);
     CGContextDrawImage(bitmapRef, extent, bitmapImage);

     //2.保存bitmap到图片
     CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
     CGContextRelease(bitmapRef);
     CGImageRelease(bitmapImage);
     return [UIImage imageWithCGImage:scaledImage];
}


@end
