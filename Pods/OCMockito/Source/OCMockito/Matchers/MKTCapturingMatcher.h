//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import <OCHamcrest/HCIsAnything.h>


@interface MKTCapturingMatcher : HCIsAnything

- (NSArray *)allValues;
- (id)lastValue;

@end
