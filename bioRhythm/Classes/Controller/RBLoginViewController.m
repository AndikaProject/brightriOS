//
//  RBLoginViewController.m
//  bioRhythm
//
//  Created by defindal irvan on 7/19/14.
//  Copyright (c) 2014 defindal irvan. All rights reserved.
//

#import "RBLoginViewController.h"

#import "RBCreateAccountViewController.h"
#import "RBResetPasswordViewController.h"


@interface RBLoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UIButton *buttonForgotPassword;
@property (strong, nonatomic) IBOutlet UILabel *labelLoginFailed;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewEmail;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewPass;

- (IBAction)forgotPass:(id)sender;

@end

@implementation RBLoginViewController

+ (instancetype)controllerWithStoryBoard:(UIStoryboard *)storyboard {
    RBLoginViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RBLoginViewController"];
    
    return controller;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set back button title
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    self.navigationItem.backBarButtonItem=backButton;
    
    // set round corner button
    _buttonLogin.layer.cornerRadius = 5;
    
    // set image view
    [_imageViewEmail setImage:[UIImage imageNamed:@"textField.png"]];
    [_imageViewPass setImage:[UIImage imageNamed:@"textField.png"]];
    
    // set border image
    
    _imageViewEmail.layer.borderWidth = 1.0;
    _imageViewEmail.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imageViewEmail.layer.cornerRadius = 5.0;
    
    _imageViewPass.layer.borderWidth = 1.0;
    _imageViewPass.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imageViewPass.layer.cornerRadius = 5.0;

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];    // it shows
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - action
- (IBAction)buttonLoginPressed:(id)sender {
    NSString *name = _textFieldEmail.text;
    NSString *password = _textFieldPassword.text;
    UIAlertView *alertView;
    if (name.length == 0 || password.length == 0) {
        //        alertView  = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill username and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //        [alertView show];
        _labelLoginFailed.text = @"Invalid username or password";
    } else {
        alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Username and password correct" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)dismissKeypad:(id)sender
{
    [_textFieldEmail resignFirstResponder];
    [_textFieldPassword resignFirstResponder];
}

- (IBAction)forgotPass:(id)sender
{
 
    RBResetPasswordViewController *controller = [RBResetPasswordViewController controllerWithStoryBoard:self.storyboard];
    [self.navigationController pushViewController:controller animated:YES];
    
}


//- (IBAction)buttonCreateAccountPressed:(id)sender {
//
// RBCreateAccountViewController *controller = [RBCreateAccountViewController controllerWithStoryBoard:self.storyboard];
//[self presentViewController:controller animated:YES completion:nil];
//   
//}



@end
