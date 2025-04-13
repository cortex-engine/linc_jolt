package jolt;


//
@:unreflective
extern enum abstract Native_JPH_PhysicsUpdateError(Native_JPH_PhysicsUpdateErrorImpl) {
    @:native("JPH_PhysicsUpdateError::JPH_PhysicsUpdateError_None")
    var JPH_PhysicsUpdateError_None;

    @:native("JPH_PhysicsUpdateError::JPH_PhysicsUpdateError_ManifoldCacheFull")
    var JPH_PhysicsUpdateError_ManifoldCacheFull;

    @:native("JPH_PhysicsUpdateError::JPH_PhysicsUpdateError_BodyPairCacheFull")
    var JPH_PhysicsUpdateError_BodyPairCacheFull;

    @:native("JPH_PhysicsUpdateError::JPH_PhysicsUpdateError_ContactConstraintsFull")
    var JPH_PhysicsUpdateError_ContactConstraintsFull;

    @:native("JPH_PhysicsUpdateError::_JPH_PhysicsUpdateError_Count")
    var _JPH_PhysicsUpdateError_Count;

    @:native("JPH_PhysicsUpdateError::_JPH_PhysicsUpdateError_Force32")
    var _JPH_PhysicsUpdateError_Force32;
}
@:unreflective
@:native('JPH_PhysicsUpdateError')
@:lincCppiaDef('HxJPH_PhysicsUpdateError', 'enum')
extern class Native_JPH_PhysicsUpdateErrorImpl { }
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapEnumExtern('Native_JPH_PhysicsUpdateError'))
    enum abstract HxJPH_PhysicsUpdateError(Int) from Int to Int {}
#else
    typedef HxJPH_PhysicsUpdateError = Native_JPH_PhysicsUpdateError;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_JobSystem")
@:lincCppiaDef('HxJPH_JobSystem', 'struct')
extern class Native_JPH_JobSystem {
    public function new();
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_JobSystem'))
    class HxJPH_JobSystem {}
#else
    typedef HxJPH_JobSystem = Native_JPH_JobSystem;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_ObjectLayerPairFilter")
@:lincCppiaDef('HxJPH_ObjectLayerPairFilter', 'struct')
extern class Native_JPH_ObjectLayerPairFilter {
    public function new();
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_ObjectLayerPairFilter'))
    class HxJPH_ObjectLayerPairFilter {}
#else
    typedef HxJPH_ObjectLayerPairFilter = Native_JPH_ObjectLayerPairFilter;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_BroadPhaseLayerInterface")
@:lincCppiaDef('HxJPH_BroadPhaseLayerInterface', 'struct')
extern class Native_JPH_BroadPhaseLayerInterface {
    public function new();
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_BroadPhaseLayerInterface'))
    class HxJPH_BroadPhaseLayerInterface {}
#else
    typedef HxJPH_BroadPhaseLayerInterface = Native_JPH_BroadPhaseLayerInterface;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_ObjectVsBroadPhaseLayerFilter")
@:lincCppiaDef('HxJPH_ObjectVsBroadPhaseLayerFilter', 'struct')
extern class Native_JPH_ObjectVsBroadPhaseLayerFilter {
    public function new();
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_ObjectVsBroadPhaseLayerFilter'))
    class HxJPH_ObjectVsBroadPhaseLayerFilter {}
#else
    typedef HxJPH_ObjectVsBroadPhaseLayerFilter = Native_JPH_ObjectVsBroadPhaseLayerFilter;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_PhysicsSystemSettings")
@:lincCppiaDef('HxJPH_PhysicsSystemSettings', 'struct')
extern class Native_JPH_PhysicsSystemSettings {
    public function new();
    public var maxBodies:cpp.UInt32; /* 10240 */
    public var numBodyMutexes:cpp.UInt32; /* 0 */
    public var maxBodyPairs:cpp.UInt32; /* 65536 */
    public var maxContactConstraints:cpp.UInt32; /* 10240 */
    // uint32_t _padding;
    public var broadPhaseLayerInterface:cpp.Star<Native_JPH_BroadPhaseLayerInterface>;
    public var objectLayerPairFilter:cpp.Star<Native_JPH_ObjectLayerPairFilter>;
    public var objectVsBroadPhaseLayerFilter:cpp.Star<Native_JPH_ObjectVsBroadPhaseLayerFilter>;
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_PhysicsSystemSettings'))
    class HxJPH_PhysicsSystemSettings {}
#else
    typedef HxJPH_PhysicsSystemSettings = Native_JPH_PhysicsSystemSettings;
#end

//
@:include('linc_jolt.h')
@:structAccess
@:unreflective
@:semantics(reference)
@:native("JPH_PhysicsSystem")
@:lincCppiaDef('HxJPH_PhysicsSystem', 'struct')
extern class Native_JPH_PhysicsSystem {
    public function new();
}
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapStructExtern('Native_JPH_PhysicsSystem'))
    class HxJPH_PhysicsSystem {}
#else
    typedef HxJPH_PhysicsSystem = Native_JPH_PhysicsSystem;
#end


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

    @:native('JPH_SetTraceHandler')
    public static function setTraceHandler(_str:cpp.Callable<cpp.ConstCharStar->Void>):Void;

    //
    @:native('JPH_JobSystemThreadPool_Create')
    public static function jobSystemThreadPool_Create(_config:cpp.Star<cpp.Void>):cpp.Star<Native_JPH_JobSystem>;

    @:native('JPH_JobSystem_Destroy')
    public static function jobSystemThreadPool_Destroy(_config:cpp.Star<Native_JPH_JobSystem>):Void;

    //
    @:native('JPH_PhysicsSystem_Create')
    public static function physicsSystem_Create(_settings:cpp.Star<Native_JPH_PhysicsSystemSettings>):cpp.Star<Native_JPH_PhysicsSystem>;

    @:native('JPH_PhysicsSystem_Destroy')
    public static function physicsSystem_Destroy(_system:cpp.Star<Native_JPH_PhysicsSystem>):Void;

    @:native('JPH_PhysicsSystem_OptimizeBroadPhase')
    public static function physicsSystem_OptimizeBroadPhase(_system:cpp.Star<Native_JPH_PhysicsSystem>):Void;

    @:native('JPH_PhysicsSystem_Update')
    public static function physicsSystem_Update(_system:cpp.Star<Native_JPH_PhysicsSystem>, _deltaTime:cpp.Float32, _collisionSteps:Int, _jobSystem:cpp.Star<Native_JPH_JobSystem>):HxJPH_PhysicsUpdateError;

    // ObjectLayerPairFilterTable
    @:native('JPH_ObjectLayerPairFilterTable_Create')
    public static function objectLayerPairFilterTable_Create(_numObjectLayers:cpp.UInt32):cpp.Star<Native_JPH_ObjectLayerPairFilter>;

    @:native('JPH_ObjectLayerPairFilterTable_EnableCollision')
    public static function objectLayerPairFilter_EnableCollision(_objFilter:cpp.Star<Native_JPH_ObjectLayerPairFilter>, _layer1:cpp.UInt32, _layer2:cpp.UInt32):Void;

    @:native('JPH_ObjectLayerPairFilterTable_DisableCollision')
    public static function objectLayerPairFilter_DisableCollision(_objFilter:cpp.Star<Native_JPH_ObjectLayerPairFilter>, _layer1:cpp.UInt32, _layer2:cpp.UInt32):Void;

    @:native('JPH_ObjectLayerPairFilterTable_ShouldCollide')
    public static function objectLayerPairFilter_ShouldCollide(_objFilter:cpp.Star<Native_JPH_ObjectLayerPairFilter>, _layer1:cpp.UInt32, _layer2:cpp.UInt32):Bool;

    //
    @:native('JPH_BroadPhaseLayerInterfaceTable_Create')
    public static function broadPhaseLayerInterfaceTable_Create(_numObjectLayers:cpp.UInt32, _numBroadPhaseLayers:cpp.UInt32):cpp.Star<Native_JPH_BroadPhaseLayerInterface>;

    @:native('JPH_BroadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer')
    public static function broadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(_bpInterface:cpp.Star<Native_JPH_BroadPhaseLayerInterface>, _objectLayer:cpp.UInt32, _broadPhaseLayer:cpp.UInt32):Void;

    @:native('JPH_ObjectVsBroadPhaseLayerFilterTable_Create')
    public static function objectVsBroadPhaseLayerFilterTable_Create(
        _bpInterface:cpp.Star<Native_JPH_BroadPhaseLayerInterface>, _numBroadPhaseLayers:cpp.UInt32,
        _objFilter:cpp.Star<Native_JPH_ObjectLayerPairFilter>, _numObjectLayers:cpp.UInt32):cpp.Star<Native_JPH_ObjectVsBroadPhaseLayerFilter>;
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