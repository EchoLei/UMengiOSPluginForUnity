//
//  GKNotificationBinding.m
//  Unity-iPhone
//
//  Created by Radar on 13-1-15.
//
//

#import "MobClick.h"
#import "JSONKit.h"

// Converts NSString to C style string by way of copy (Mono will free it)
#define MakeStringCopy( _x_ ) ( _x_ != NULL && [_x_ isKindOfClass:[NSString class]] ) ? strdup( [_x_ UTF8String] ) : NULL

// Converts C style string to NSString
#define GetStringParam( _x_ ) ( _x_ != NULL ) ? [NSString stringWithUTF8String:_x_] : [NSString stringWithUTF8String:""]

// Converts C style string to NSString as long as it isnt empty
#define GetStringParamOrNil( _x_ ) ( _x_ != NULL && strlen( _x_ ) ) ? [NSString stringWithUTF8String:_x_] : nil


void _startWithAppkey( const char * appkey){
    [MobClick startWithAppkey:GetStringParam(appkey)];
}
    
void _sendEvent(const char * eventId){
    [MobClick event:GetStringParam(eventId)];
}

void _sendEventWithLabel(const char * eventId, const char *eventLabel){
    [MobClick event:GetStringParam(eventId) label:GetStringParam(eventLabel)];
}

void _sendEventWithParam(const char * eventId, const char *json){
    NSString *jsonString = GetStringParamOrNil( json );
    NSMutableDictionary *dict = [jsonString objectFromJSONString];
        
    if( ![dict isKindOfClass:[NSMutableDictionary class]] )
        return;
        
    [MobClick event:GetStringParam(eventId) attributes:dict];
}


