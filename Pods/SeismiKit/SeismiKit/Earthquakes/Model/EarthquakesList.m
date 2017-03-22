//
//  EarthquakesList.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesList.h"
#import "Earthquake.h"

@implementation EarthquakesList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *propertyToJsonMappings = @{@"count": @"count",
                                             @"earthquakes": @"earthquakes"};

    return propertyToJsonMappings;
}

+ (NSValueTransformer *)earthquakesJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:Earthquake.class];
}

+ (NSValueTransformer *)countJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *count, BOOL *success, NSError *__autoreleasing *error) {
        return [self.numberFormatter numberFromString:count];
    } reverseBlock:^id(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [self.numberFormatter stringFromNumber:value];
    }];
}

+ (NSNumberFormatter *)numberFormatter
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterNoStyle;
    return formatter;
}

@end
