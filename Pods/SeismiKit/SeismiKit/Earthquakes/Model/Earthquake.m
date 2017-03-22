//
//  Earthquake.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "Earthquake.h"

@implementation Earthquake

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *propertyToJsonMappings = @{@"source": @"src",
                                             @"earthquakeId": @"eqid",
                                             @"earthquakeTime": @"timedate",
                                             @"latitude": @"lat",
                                             @"longitude": @"lon",
                                             @"magnitude": @"magnitude",
                                             @"depth": @"depth",
                                             @"regionName": @"region"};

    return propertyToJsonMappings;
}

+ (NSValueTransformer *)earthquakeTimeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error)
    {
         return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)longitudeJSONTransformer
{
    return [self decimalTransformer];
}

+ (NSValueTransformer *)latitudeJSONTransformer
{
    return [self decimalTransformer];
}

+ (NSValueTransformer *)magnitudeJSONTransformer
{
    return [self decimalTransformer];
}

+ (NSValueTransformer *)depthJSONTransformer
{
    return [self decimalTransformer];
}

+ (NSValueTransformer *)decimalTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *decimalAsString, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDecimalNumber decimalNumberWithString:decimalAsString];
    } reverseBlock:^id(NSDecimalNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [value stringValue];
    }];
}

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return dateFormatter;
}

@end
