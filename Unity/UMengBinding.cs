using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

public class UMengBinding{

	[DllImport("__Internal")]
    private static extern void _startWithAppkey( string appkey);

	// Reports an achievement notification the given title and content
    public static void StartWithAppkey( string appkey)
    {
        // Call plugin only when running on real device
        if( Application.platform == RuntimePlatform.IPhonePlayer )
			_startWithAppkey( appkey );
    }
	
	
	[DllImport("__Internal")]
    private static extern void _sendEvent( string eventId);

	// Reports an achievement notification the given title and content
    public static void SendEvent( string eventId)
    {
        // Call plugin only when running on real device
        if( Application.platform == RuntimePlatform.IPhonePlayer )
			_sendEvent( eventId );
    }
	
	[DllImport("__Internal")]
    private static extern void _sendEventWithLabel( string eventId, string label);

	// Reports an achievement notification the given title and content
    public static void SendEventWithLabel( string eventId, string label)
    {
        // Call plugin only when running on real device
        if( Application.platform == RuntimePlatform.IPhonePlayer )
			_sendEventWithLabel( eventId , label);
    }
	
		
	[DllImport("__Internal")]
    private static extern void _sendEventWithParam( string eventId, string param);

	// Reports an achievement notification the given title and content
    public static void SendEventWithParam( string eventId, Dictionary<string,string> param)
    {
        // Call plugin only when running on real device
        if( Application.platform == RuntimePlatform.IPhonePlayer )
			_sendEventWithParam( eventId , param.toJson());
    }
}
