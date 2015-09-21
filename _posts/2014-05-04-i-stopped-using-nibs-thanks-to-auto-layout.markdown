---
layout: post
title: 'I Stopped Using NIBs Thanks to Auto Layout'
category: programming
tags: [ios, auto layout, interface builder, xcode]
---
The subject to this post might suggest I don't like Auto Layout, but on the contrary I really like Auto Layout. I didn't always like Auto Layout. For the longest time Auto Layout was a major pain in my ass, but it turns out it was Interface Builder that was causing me the majority of headaches when I used Auto Layout. So I stopped using Auto Layout in IB and I started using it in code only.

It took me a while to get comfortable with Auto Layout in code, but once things clicked, I found it easy to get the layout I wanted. In fact, I have found Auto Layout saves me time when laying out a UI, and I've become so comfortable with Auto Layout that now I become annoyed if I have to work on a project that does not use Auto Layout.

Because I use Auto Layout in code I realized overtime I was using Interface Builder only to define the UI elements that made up the view. I would define all the Auto Layout constraints in code. This got me thinking, why do I need to define the UI elements in IB? So I did a small project with no NIBs or storyboards, and I loved it. I felt more productive, and I was banging my head against the wall a hell of a lot less.

(Credit also goes to [Matt Massicotte](https://twitter.com/mattie) for encouraging me to try a project with no NIB or storboard files.)

I've now done a number of iOS projects where I don't use a single NIB or storyboard, and I'm convinced this is the right approach for me. I see everything regarding a view and its subviews explicitly defined in source code, which makes it easier to see what's going on and to make changes. No more bouncing between inspectors to figure out what is causing a problem or to understand how a view is rendered. I see it all in the source code defined in a single *.m* file.

So how do I construct my views using only source code? I have a base class that I call [`WPSCompositeView`](https://github.com/kirbyt/WPSKit/blob/master/WPSKit/UIKit/WPSCompositeView.h) in my [WPSKit](https://github.com/kirbyt/WPSKit), a set of classes and categories I use to build apps. `WPSCompositeView` has a class method named `+addToSuperview:` that creates the instance of the view, which must be a subclass of `WPSCompositeView`, then calls `-loadView` on the instance of the view. I place all the code needed to create the subviews of the view in the `-loadView` implementation. The constraints for the view are implemented in the `-updateConstraints` that is called by iOS when needed. That's it.

Here's an example of a composer view for a new app I'm working on:

[![](https://farm8.staticflickr.com/7204/13920896030_e0da352daf_m.jpg)](https://farm8.staticflickr.com/7204/13920896030_4c53fbfe1c_o.jpg)

And the code for creating this view is as follows:

    - (void)loadView
    {
      UIView *containerView = self;

      WPSTextView *textView = [[WPSTextView alloc] init];
      [textView setTranslatesAutoresizingMaskIntoConstraints:NO];
      [textView setAlwaysBounceVertical:YES];
      [textView setInputAccessoryView:[self toolbar]];
      [textView setFont:[UIFont systemFontOfSize:17.0]];
      [textView setPlaceholderText:NSLocalizedString(@"What's up?", @"Placeholder text.")];
      [self setTextView:textView];

      UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [locationButton setTranslatesAutoresizingMaskIntoConstraints:NO];
      [locationButton setImage:[UIImage wps_imageNamed:@"location" withMaskColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];
      [locationButton setImage:[UIImage wps_imageNamed:@"location" withMaskColor:[UIColor wps_iOSDefaultBlue]] forState:UIControlStateSelected];
      [locationButton setSelected:NO];
      [locationButton addTarget:self action:@selector(_locationButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
      [self setLocationButton:locationButton];

      UILabel *locationLabel = [[UILabel alloc] init];
      [locationLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
      [locationLabel setTextColor:[UIColor lightGrayColor]];
      [locationLabel setTextAlignment:NSTextAlignmentLeft];
      [locationLabel setText:NSLocalizedString(@"Location Disabled", @"Location text.")];
      [self setLocationLabel:locationLabel];

      UILabel *characterCountLabel = [[UILabel alloc] init];
      [characterCountLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
      [characterCountLabel setTextColor:[UIColor lightGrayColor]];
      [characterCountLabel setTextAlignment:NSTextAlignmentRight];
      [self setCharacterCountLabel:characterCountLabel];

      [containerView addSubview:textView];
      [containerView addSubview:locationButton];
      [containerView addSubview:locationLabel];
      [containerView addSubview:characterCountLabel];

      [textView wps_setDidChange:^(UITextView *aTextView) {
        NSString *countString = nil;
        NSUInteger length = [[aTextView text] length];
        if (length > 0) {
          countString = [NSString stringWithFormat:@"%lu", (unsigned long)length];
        }
        [characterCountLabel setText:countString];
      }];
    }

    - (void)updateConstraints
    {
      WPSTextView *textView = [self textView];
      UILabel *characterCountLabel = [self characterCountLabel];
      UIButton *locationButton = [self locationButton];
      UILabel *locationLabel = [self locationLabel];

      [locationButton wps_constrainToHeight:38.0f];
      [locationButton wps_constrainToWidth:38.0f];

      NSDictionary *bindings = NSDictionaryOfVariableBindings(textView, characterCountLabel, locationButton, locationLabel);
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[textView]-4-[characterCountLabel]-0-|" options:0 metrics:nil views:bindings]];
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[textView]-0-|" options:0 metrics:nil views:bindings]];
      [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[locationButton]-[locationLabel]-[characterCountLabel]-8-|" options:0 metrics:nil views:bindings]];
      [self addConstraint:[NSLayoutConstraint constraintWithItem:locationLabel attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:characterCountLabel attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:0.0]];
      [self addConstraint:[NSLayoutConstraint constraintWithItem:locationButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:locationLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];

      [super updateConstraints];
    }

    - (UIToolbar *)toolbar
    {
      if (_toolbar == nil) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenBounds.size.width, 44)];
        [toolbar setTintAdjustmentMode:UIViewTintAdjustmentModeNormal];


        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        BOOL adnOn = [defaults cp_isAdnOn];
        BOOL facebookOn = [defaults cp_isFacebookOn];
        BOOL twitterOn = [defaults cp_isTwitterOn];

        UIColor *offColor = [UIColor lightGrayColor];
        UIColor *adnColor = adnOn ? [UIColor blackColor] : offColor;
        UIColor *facebookColor = facebookOn ? [UIColor wps_facebookBlue] : offColor;
        UIColor *twitterColor = twitterOn ? [UIColor wps_twitterBlue] : offColor;

        UIBarButtonItem *cameraButton = [self buttonWithImageName:@"camera" color:[UIColor wps_iOSDefaultBlue] action:@selector(_cameraButtonTapped:)];
        [self setCameraButton:cameraButton];

        UIBarButtonItem *adnButton = [self buttonWithImageName:@"adn" color:adnColor action:@selector(_adnButtonTapped:)];
        [adnButton setTag:adnOn];
        [self setAdnOn:adnOn];
        [self setAdnButton:adnButton];

        UIBarButtonItem *facebookButton = [self buttonWithImageName:@"facebook" color:facebookColor action:@selector(_facebookButtonTapped:)];
        [facebookButton setTag:facebookOn];
        [self setFacebookOn:facebookOn];
        [self setFacebookButton:facebookButton];

        UIBarButtonItem *twitterButton = [self buttonWithImageName:@"twitter" color:twitterColor action:@selector(_twitterButtonTapped:)];
        [twitterButton setTag:twitterOn];
        [self setTwitterOn:twitterOn];
        [self setTwitterButton:twitterButton];

        UIBarButtonItem *draftsButton = [self buttonWithImageName:@"drafts" color:[UIColor wps_iOSDefaultBlue] action:@selector(_draftsButtonTapped:)];
        [self setDraftsButton:draftsButton];

        UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [toolbar setItems:@[adnButton, facebookButton, twitterButton, flexibleButton, draftsButton, cameraButton] animated:NO];

        _toolbar = toolbar;
      }
      return  _toolbar;
    }

The only things not created or managed but this view are the navigation bar and collection view of photos. The navigation bar is provided by the `UINavigationController` used by the view controller that created this composer view. Also, the view controller uses controller containment to include the collection view of photos, which is actually managed by another view controller and custom view class.

Oh, I almost forgot to mention...I create the composite view in the `loadView` method implemented in the view controller. For example:

    - (void)loadView
    {
      [super loadView];
      UIView *contentView = [self view];

      CPComposeView *composeView = [CPComposeView addToSuperview:contentView];
      [self setComposeView:composeView];
    }

After I create the view I might add more layout constraints to position and size the subview as needed within the main content view. I do that in the view controller's `-loadView` when needed.

So that's it. That's why I have stopped using NIB and storyboard files in my iOS projects. This approach might not work for others, but it certainly works for me.
