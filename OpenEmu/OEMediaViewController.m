/*
 Copyright (c) 2013, OpenEmu Team

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
     * Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
     * Neither the name of the OpenEmu Team nor the
       names of its contributors may be used to endorse or promote products
       derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY OpenEmu Team ''AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL OpenEmu Team BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "OEMediaViewController.h"
#import "OEBlankSlateView.h"

@interface OEMediaViewController ()
{
    IBOutlet OEBlankSlateView *blankSlateView;
}
@end

@implementation OEMediaViewController

- (void)awakeFromNib
{
    //[[self gridView] setDataSource:self];
    //[[self gridView] setDelegate:self];
}

- (void)loadView
{
    [super loadView];
    
    // Setup View
    [[self view] setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        
    // Setup BlankSlate View
    [blankSlateView setDelegate:self];
    [blankSlateView setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    [blankSlateView registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
    
    [[self view] addSubview:blankSlateView];
    [blankSlateView setFrame:[[self view] bounds]];
}

- (NSString*)nibName
{
    return @"CollectionView";
}

- (void)setRepresentedObject:(id)representedObject
{
    //NSAssert([representedObject isKindOfClass:[OEMedia class]], @"Media View Controller can only represent OEMedia objects.");
    //[super setRepresentedObject:representedObject];
    //[representedObject setDelegate:self];
}
#pragma mark - OELibrarySubviewController Implementation -
- (id)encodeCurrentState
{
    return nil;
}

- (void)restoreState:(id)state
{
}

- (NSArray*)selectedGames
{
    return @[];
}

- (void)setLibraryController:(OELibraryController *)controller
{
    [[controller toolbarGridViewButton] setEnabled:FALSE];
    [[controller toolbarFlowViewButton] setEnabled:FALSE];
    [[controller toolbarListViewButton] setEnabled:FALSE];
    
    [[controller toolbarSearchField] setEnabled:NO];
    [[controller toolbarSlider] setEnabled:NO];
}

#pragma mark - GridView DataSource -
/*
- (OEGridViewCell *)gridView:(OEGridView *)view cellForItemAtIndex:(NSUInteger)index
{
    return nil;
}

- (NSUInteger)numberOfItemsInGridView:(OEGridView *)gridView
{
    //return [[[self representedObject] games] count];
    return 0;
}
*/
@end
