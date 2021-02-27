//
//  ViewController.m
//  JZCIFilter
//
//  Created by laotouzi on 2021/2/27.
//

#import "ViewController.h"
#import "JZCIFilter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.qrCodeImage.image = [JZCIFilter createQRCodeWithInfo:@"http://www.baidu.com" withSize:self.qrCodeImage.frame.size.width];
}


@end
