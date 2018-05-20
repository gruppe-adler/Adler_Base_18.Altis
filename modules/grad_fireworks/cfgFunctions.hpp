#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_fireworks {
    class client {
            file = MODULES_DIRECTORY\grad_fireworks\functions\client;
            class spawnFireworks {};
    };
    class server {
            file = MODULES_DIRECTORY\grad_fireworks\functions\server;
            class prepareFireworks {};
    };
};
