# GRAD Mortargame
Generates random tragets to practice your mortar skill.

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)

## Installation
Add the following lines of code to the `description.ext`:

```sqf
#define MODULES_DIRECTORY node_modules
class CfgFunctions {
    #include "node_modules\grad-mortargame\cfgFunctions.hpp"
};
```
If you want to name the folder differently than *node_modules*, make sure to change the MODULES_DIRECTORY define as well.

### Manually
1. Create a folder in your mission root folder and name it `node_modules`. Then create one inside there and call it `grad-mortargame`.
2. Download the latest release and put it into the directory you just created.
