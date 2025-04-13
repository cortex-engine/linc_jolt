package jolt;

@:keep
@:include('linc_jolt.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('jolt'))
#end
extern class Native_Jolt {
    @:native('JPH_Init')
    public static function init():Bool;

    @:native('JPH_Shutdown')
    public static function shutdown():Bool;
}

#if (scriptable || cppia)
    class Jolt {
        public static function init():Bool
            return Native_Jolt.init();

        public static function shutdown():Bool
            return Native_Jolt.shutdown();
    }
#else
    typedef Jolt = Native_Jolt;
#end