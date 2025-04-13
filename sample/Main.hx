import jolt.Jolt;

enum abstract Layers(Int) to Int {
    var OBJ_NonMoving;
    var OBJ_Moving;
    var OBJ_NumLayers;
}

enum abstract BroadPhaseLayers(Int) to Int {
    var BPL_NonMoving;
    var BPL_Moving;
    var BPL_NumLayers;
}

class Main {

    static function log(_str:cpp.ConstCharStar) {
        trace(_str);
    }

    public static function main() {
        Jolt.init();

        Jolt.setTraceHandler(cpp.Callable.fromStaticFunction(log));

        var jobSystem = Jolt.jobSystemThreadPool_Create(null);

        // We use only 2 layers: one for non-moving objects and one for moving objects
        var objectLayerPairFilterTable = Jolt.objectLayerPairFilterTable_Create(OBJ_NumLayers);
        Jolt.objectLayerPairFilter_EnableCollision(objectLayerPairFilterTable, OBJ_NonMoving, OBJ_Moving);
        Jolt.objectLayerPairFilter_EnableCollision(objectLayerPairFilterTable, OBJ_Moving, OBJ_NonMoving);

        // We use a 1-to-1 mapping between object layers and broadphase layers
        var broadPhaseLayerInterfaceTable = Jolt.broadPhaseLayerInterfaceTable_Create(OBJ_NumLayers, BPL_NumLayers);
        Jolt.broadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(broadPhaseLayerInterfaceTable, OBJ_NonMoving, BPL_NonMoving);
        Jolt.broadPhaseLayerInterfaceTable_MapObjectToBroadPhaseLayer(broadPhaseLayerInterfaceTable, OBJ_Moving, BPL_Moving);

        var objectVsBroadPhaseLayerFilter = Jolt.objectVsBroadPhaseLayerFilterTable_Create(
            broadPhaseLayerInterfaceTable, BPL_NumLayers,
            objectLayerPairFilterTable, OBJ_NumLayers);

        var settings = new HxJPH_PhysicsSystemSettings();
        settings.maxBodies = 65536;
        settings.numBodyMutexes = 0;
        settings.maxBodyPairs = 65536;
        settings.maxContactConstraints = 65536;
        settings.broadPhaseLayerInterface = broadPhaseLayerInterfaceTable;
        settings.objectLayerPairFilter = objectLayerPairFilterTable;
        settings.objectVsBroadPhaseLayerFilter = objectVsBroadPhaseLayerFilter;
        var system = Jolt.physicsSystem_Create(settings);

        // TODO: add body and shit

        // We simulate the physics world in discrete time steps. 60 Hz is a good rate to update the physics system.
        final cDeltaTime = 1/60;

        // If you take larger steps than 1 / 60th of a second you need to do multiple collision steps in order to
        // keep the simulation stable. Do 1 collision step per 1 / 60th of a second (round up).
        final cCollisionSteps = 1;

        // Optional step: Before starting the physics simulation you can optimize the broad phase. This improves collision
        // detection performance (it's pointless here because we only have 2 bodies).
        // You should definitely not call this every frame or when e.g. streaming in a new level section as it is
        // an expensive operation.
        // Instead insert all new objects in batches instead of 1 at a time to keep the broad phase efficient.
        Jolt.physicsSystem_OptimizeBroadPhase(system);

        // while () { // TODO:
            // Step the world
            Jolt.physicsSystem_Update(system, cDeltaTime, cCollisionSteps, jobSystem);
        // }

        Jolt.physicsSystem_Destroy(system);

        Jolt.jobSystemThreadPool_Destroy(jobSystem);

        Jolt.shutdown();
    }
}