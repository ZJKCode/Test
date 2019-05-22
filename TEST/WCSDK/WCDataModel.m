//
//  WCDataModel.m
//  WCSDK
//
//  Created by zhangjikuan on 2019/5/22.
//  Copyright © 2019 winchannel. All rights reserved.
//

#import "WCDataModel.h"
#import <objc/runtime.h>

@interface WCDataModel ()

@property (nonatomic, strong) NSDictionary *propertyMappingObjcJsonDict;
@property (nonatomic, strong) NSDictionary *classNameForItemInArrayDict;
@property (nonatomic, strong) NSMutableArray *propertiesNeedToJsonArray;

@end

@implementation WCDataModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self preparePropertiesToJson];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)preparePropertiesToJson {
    self.propertyMappingObjcJsonDict = [WCDataModel propertyMappingDictionary];
    self.classNameForItemInArrayDict = [WCDataModel elementTypeOfCollectionPropertyDictionary];
    self.propertiesNeedToJsonArray = [NSMutableArray arrayWithArray:[WCDataModel propertiesNeedToJson]];
    if (![WCDataModel propertiesNeedToJson]) {
        self.propertiesNeedToJsonArray = [NSMutableArray arrayWithArray:[self allPropertiesOriginName]];
    }
    NSMutableArray *omitProperties = [NSMutableArray array];
    [self omitPropertiesNeedToJson:omitProperties];
    for (NSString *omitStr in omitProperties) {
        NSArray *copy= [self.propertiesNeedToJsonArray copy];
        NSInteger count = [copy count];
        for (int i=0;i< count;i++)
            if ([[copy objectAtIndex:i] isEqualToString:omitStr])
            {
                [self.propertiesNeedToJsonArray removeObject:[copy objectAtIndex:i]];
                break;
            }
    }

}

- (NSArray *)allPropertiesOriginName {
    NSMutableArray *retArray = [[NSMutableArray alloc] init];

    NSMutableDictionary *propertyToRealKeyMappingDict = [[NSMutableDictionary alloc] initWithCapacity:[self.propertyMappingObjcJsonDict count]];
    NSArray *keys = [self.propertyMappingObjcJsonDict allKeys];
    for (NSString *key in keys) {
        NSString *value = [self.propertyMappingObjcJsonDict objectForKey:key];
        [propertyToRealKeyMappingDict setObject:key forKey:value];
    }

    NSMutableArray *classArray = [[NSMutableArray alloc] init];
    Class curClass = [self class];
    NSString *curClassName = NSStringFromClass(curClass);

    while (![curClassName isEqualToString:@"WCDataModel"]) {
        [classArray addObject:curClass];
        curClass = [curClass superclass];
        curClassName = NSStringFromClass(curClass);
    }

    for (Class classItem in classArray) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(classItem, &outCount);
        for(i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char *propName = property_getName(property);
            if(propName) {
                NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
                NSString *orgKey = [propertyToRealKeyMappingDict objectForKey:propertyName];
                if (!orgKey) {
                    orgKey = propertyName;
                }
                if([orgKey isEqualToString:@"hash"]||[orgKey isEqualToString:@"superclass"]||[orgKey isEqualToString:@"description"]||[orgKey isEqualToString:@"debugDescription"])
                    continue;
                [retArray addObject:orgKey];
            }
        }
        free(properties);
    }

    return retArray;
}
- (void)omitPropertiesNeedToJson:(NSMutableArray *)propertiesToOmit
{
    //Override me!!!
    //子类不要删除父类已有的项
    [propertiesToOmit addObject:@"attachedFile"];
}

- (void)set:(id)data key:(NSString *)key {
    [self setValue:data forKey:key];
}

- (id)get:(NSString *)key {
    return [self valueForKey:key];
}

- (NSDictionary *)dictionaryValue {
    [self preparePropertiesToJson];
    NSMutableDictionary *retDict = [[NSMutableDictionary alloc] init];

    for (NSString *key in self.propertiesNeedToJsonArray) {
        NSString *realKey = [self.propertyMappingObjcJsonDict valueForKey:key];


        if (!realKey)
            realKey = key;
        Class objectClass = [self classForKey:realKey];
        objc_property_t theProperty =
        class_getProperty([self class], [realKey UTF8String]);
        const char * thePropertyName = property_getName(theProperty);
        id v = [self valueForKey:[NSString stringWithUTF8String:thePropertyName]];
        if (!v) {
            continue;
        }

        // 1, array
        if ([objectClass isSubclassOfClass:[NSArray class]]) {
            NSMutableArray *retArray = [[NSMutableArray alloc] init];
            for (id item in v) {
                if ([item isKindOfClass:[WCDataModel class]]) {
                    NSDictionary *itemJsonDict = [item dictionaryValue];
                    if (itemJsonDict)
                        [retArray addObject:itemJsonDict];
                } else if (![item isKindOfClass:[NSNull class]]){
                    [retArray addObject:item];
                }
            }
            [retDict setObject:retArray forKey:key];
        }
        // 2, IObjcJsonBase
        else if ([objectClass isSubclassOfClass:[WCDataModel class]]) {
            NSDictionary *itemJsonDict = [v dictionaryValue];
            if (itemJsonDict)
                [retDict setObject:itemJsonDict forKey:key];
        }
        // 3, string, number, dictionary, etc
        else {
            if (v && key) {

                [retDict setObject:v forKey:key];
            }
        }
    }

    return retDict;
}

// 子类重写
+ (NSDictionary <NSString *, NSString *> *)propertyMappingDictionary {
    return nil;
}
// 子类重写
+ (NSDictionary <NSString *, NSString *> *)elementTypeOfCollectionPropertyDictionary {
    return nil;
}

+ (NSArray *)propertiesNeedToJson {
    return nil;
}

+ (id)unsupportTypeWithRawData:(id)rawData
                    targetType:(Class)targetType
                  propertyName:(NSString *)propertyName{
    return nil;
}


+ (id)rawDataWithUnsupportTypeObject:(id)object
                        propertyName:(NSString *)propertyName {
    return nil;
}

#pragma mark -priate API
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}

- (void)setValue:(id)value forKey:(NSString *)key {
    NSString *realKey = [self.propertyMappingObjcJsonDict valueForKey:key];
    if (!realKey) {
        realKey = key;
    }
    // 1.数组 NSArray
    if ([value isKindOfClass:[NSArray class]]) {
        NSArray *arrayVulue = value;
        NSString *className = [self.classNameForItemInArrayDict objectForKey:realKey];
        Class itemClass = NSClassFromString(className);
        if (itemClass) {
            NSMutableArray *retArray = [[NSMutableArray alloc] init];
            for (id arryEntry in arrayVulue) {
                if ([itemClass instancesRespondToSelector:@selector(initWithDict:)]) {
                    id entry = [[itemClass alloc] initWithDict:arryEntry];
                    [retArray addObject:entry];
                } else {
                    [retArray addObject:arryEntry];
                }
            }
            [super setValue:retArray forKey:realKey];
        } else {
            [super setValue:value forKey:realKey];
        }
    }
    // 2.字典 NSDictionary
    else if ([value isKindOfClass:[NSDictionary class]]) {
        Class objClass = [self classForKey:realKey];
        BOOL isObject = [objClass instancesRespondToSelector:@selector(classForKey:)];
        if (isObject) {
            id modeObject = [[objClass alloc] initWithDict:value];
            [super setValue:modeObject forKey:realKey];
        } else {
            [super setValue:value forKey:realKey];
        }

    }
    // 3.String,Number,etc
    else if ([self.classNameForItemInArrayDict objectForKey:realKey] == nil) {
        NSString *class = NSStringFromClass([value class]);
        if ([class isEqualToString:@"__NSCFConstantString"]) {
            NSString *strValue = (NSString *)value;
            NSUInteger length = strValue.length;
            if (length == 0) {
                return;
            }
        }
        [super setValue:value forKey:realKey];
    }
}

- (Class)classForKey:(NSString *)key {
    Class objClass = [self class];
    NSString *accessorKey = key;
    objc_property_t theProperty = class_getProperty(objClass, [accessorKey UTF8String]);
    if (!theProperty) return nil;
    const char *propertyAttrs = property_getAttributes(theProperty);
    NSString *propertyString = [NSString stringWithUTF8String:propertyAttrs];
    NSString *startingStr = @"T@\"";
    NSString *endingStr = @"\",";
    NSInteger startingIndex = [propertyString rangeOfString:startingStr].location + startingStr.length;
    if (startingIndex < 0) return nil;
    NSString *propType = [propertyString substringFromIndex:startingIndex];
    NSInteger endingIndex = [propType rangeOfString:endingStr].location;
    if (endingIndex < 0) return nil;
    propType = [propType substringToIndex:endingIndex];
    Class propClass = NSClassFromString(propType);
    return propClass;
}

- (void)setNilValueForKey:(NSString *)key {
    [super setValue:@"" forKey:key];
}
#pragma mark - encoder
- (void)encodeWithCoder:(NSCoder *)aCoder {

}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    return nil;
}

@end
