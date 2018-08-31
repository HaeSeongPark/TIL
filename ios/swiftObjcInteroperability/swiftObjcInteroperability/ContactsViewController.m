//
//  ViewController.m
//  swiftObjcInteroperability
//
//  Created by rhino Q on 31/08/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

#import "ContactsViewController.h"
#import "swiftObjcInteroperability-Swift.h"

@interface ContactsViewController ()
    
    @property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
//        NSArray *contactArray = @[@"Johnny Appleseed",
//                                  @"Calamity Jane",
//                                  @"Calamity Jane"];
        
//        Contact *c1 = [[Contact alloc] initWithContactName:@"Johnny Appleseed"];
//        Contact *c2 = [[Contact alloc] initWithContactName:@"Calamity Jane"];
//        Contact *c3 = [[Contact alloc] initWithContactName:@"Calamity Jane"];
        
        _contacts = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}
    - (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue {
        
    }
    
    - (IBAction)createNewContact:(UIStoryboardSegue *)segue {
        NewContactViewController *newContactVC = segue.sourceViewController;
        NSString *firstName = newContactVC.firstNameTextField.text;
        NSString *lastName = newContactVC.lastNameTextField.text;
        if (firstName.length != 0 || lastName.length != 0 ) {
            NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            Contact *newContact = [[Contact alloc] initWithContactName:name];
            [self.contacts addObject:newContact];
            [self.tableView reloadData];
        }
    }


@end
