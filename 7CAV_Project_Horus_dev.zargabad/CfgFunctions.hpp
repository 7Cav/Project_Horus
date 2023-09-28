class phm {

    class phPlayer {

    file = "functions\player";

       // class addActions {};
    };

    class phServer
    {

    file = "functions\server";

        class calculateForces {};
        class createCrew {};
        class createMission {};
        class createMissionMarker {};
        class findAO {};
        class selectMission {};
        class spawnOpForces {};
    };

    class phShared {

    file = "functions\shared";

        //class addActions {};
    };

    class phMissions {

    file = "mission_configs";

        class m_Patrol {};
    };

    class phDebug {

    file = "functions\debug";

        class markLocation {};
        class systemMessage {};
    };
}