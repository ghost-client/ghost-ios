//
//  ZHGSettingResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGSettingResponseBaseClass.h"
#import "ZHGSettingResponseMeta.h"
#import "ZHGSettingResponseSettings.h"


NSString *const kZHGSettingResponseBaseClassMeta = @"meta";
NSString *const kZHGSettingResponseBaseClassSettings = @"settings";


@interface ZHGSettingResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGSettingResponseBaseClass

@synthesize meta = _meta;
@synthesize settings = _settings;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.meta = [ZHGSettingResponseMeta modelObjectWithDictionary:[dict objectForKey:kZHGSettingResponseBaseClassMeta]];
    NSObject *receivedZHGSettingResponseSettings = [dict objectForKey:kZHGSettingResponseBaseClassSettings];
    NSMutableArray *parsedZHGSettingResponseSettings = [NSMutableArray array];
    if ([receivedZHGSettingResponseSettings isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHGSettingResponseSettings) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHGSettingResponseSettings addObject:[ZHGSettingResponseSettings modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHGSettingResponseSettings isKindOfClass:[NSDictionary class]]) {
       [parsedZHGSettingResponseSettings addObject:[ZHGSettingResponseSettings modelObjectWithDictionary:(NSDictionary *)receivedZHGSettingResponseSettings]];
    }

    self.settings = [NSArray arrayWithArray:parsedZHGSettingResponseSettings];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kZHGSettingResponseBaseClassMeta];
    NSMutableArray *tempArrayForSettings = [NSMutableArray array];
    for (NSObject *subArrayObject in self.settings) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSettings addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSettings addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSettings] forKey:kZHGSettingResponseBaseClassSettings];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.meta = [aDecoder decodeObjectForKey:kZHGSettingResponseBaseClassMeta];
    self.settings = [aDecoder decodeObjectForKey:kZHGSettingResponseBaseClassSettings];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kZHGSettingResponseBaseClassMeta];
    [aCoder encodeObject:_settings forKey:kZHGSettingResponseBaseClassSettings];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGSettingResponseBaseClass *copy = [[ZHGSettingResponseBaseClass alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.settings = [self.settings copyWithZone:zone];
    }
    
    return copy;
}


@end
