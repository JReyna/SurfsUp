//
//  SurfsUpViewController.m
//  Surf's Up
//
//  Created by Steven Baranski on 9/16/11.
//  Copyright 2011 Razeware LLC. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "SurfsUpViewController.h"

#import "DetailViewController.h"
#import "PlaceholderViewController.h"

@implementation SurfsUpViewController

#pragma mark - Private behavior and "Model" methods

- (NSString *)tripNameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return @"Kuta, Bali";
            break;
        case 1:
            return @"Lagos, Portugal";
            break;
        case 2:
            return @"Waikiki, Hawaii";
            break;
    }
    return @"-";
}

- (UIImage *)tripPhotoForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return [UIImage imageNamed:@"surf1.png"];
            break;
        case 1:
            return [UIImage imageNamed:@"surf2.png"];
            break;
        case 2:
            return [UIImage imageNamed:@"surf3.png"];
            break;
    }
    return nil;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [[cell imageView] setImage:[self tripPhotoForRowAtIndexPath:indexPath]];
    [[cell textLabel] setText:[self tripNameForRowAtIndexPath:indexPath]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc1 = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    [vc1 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:100]];
    
    PlaceholderViewController *vc2 = [[PlaceholderViewController alloc] initWithNibName:@"PlaceholderView" bundle:nil];
    [vc2 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:101]];
    
    PlaceholderViewController *vc3 = [[PlaceholderViewController alloc] initWithNibName:@"PlaceholderView" bundle:nil];
    [vc3 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:102]];

    UITabBarController *tabController = [[UITabBarController alloc] init];     
    [tabController setViewControllers:[NSArray arrayWithObjects:vc1, vc2, vc3, nil]];
    [tabController setTitle:[self tripNameForRowAtIndexPath:indexPath]];     
    UIBarButtonItem *aboutButton = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self 
                                                                  action:nil];    
    [[tabController navigationItem] setRightBarButtonItem:aboutButton animated:YES];        
    
    [[self navigationController] pushViewController:tabController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:[self tableView] cellForRowAtIndexPath:indexPath];
    return [cell frame].size.height;
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
