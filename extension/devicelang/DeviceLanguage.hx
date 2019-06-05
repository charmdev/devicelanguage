package extension.devicelang;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class DeviceLanguage {
	
	
	public static function getLang ():String {
		
		#if (android && openfl)
				
		return DeviceLanguage_android_getLang();
		
		#elseif ios
		
		return DeviceLanguage_ios_getLang();
		
		#elseif js
		
		return untyped __js__("navigator.language || navigator.userLanguage");
		
		#else
		
		return "null";
		
		#end
		
	}
	
	public static function getCountry ():String {
		
		#if (android && openfl)
		
		return DeviceLanguage_android_getCountry();
		
		#elseif ios
		
		return DeviceLanguage_ios_getCountry();
		
		#elseif js
		
		return "null";
		
		#else
		
		return "null";
		
		#end
		
	}
	
	#if ios
	private static var DeviceLanguage_ios_getLang = Lib.load ("devicelanguage", "devicelanguage_get_lang", 0);
	private static var DeviceLanguage_ios_getCountry = Lib.load ("devicelanguage", "devicelanguage_get_country", 0);

	#end
	
	#if (android && openfl)
	private static var DeviceLanguage_android_getLang = JNI.createStaticMethod ("com.devicelanguage.DeviceLanguage", "getLang", "()Ljava/lang/String;", true);
	private static var DeviceLanguage_android_getCountry = JNI.createStaticMethod ("com.devicelanguage.DeviceLanguage", "getCountry", "()Ljava/lang/String;",true);

	#end
	
	
}
