#include "ui_toolkit.hpp"
#include "baseDefines.hpp"
#include "defines.hpp"
#include "baseRsc.hpp"

class grad_adlerBase_rscDisplayManual {
    idd = -1;
    closeOnMissionEnd = 1;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "_this call compile preprocessFileLineNumbers 'manual\onLoad.sqf'";
    onUnload = "_this call compile preprocessFileLineNumbers 'manual\onUnload.sqf'";

    class controlsBackground {
        class title: grad_adlerBase_manualRscText {
            moving = true;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};

            x = grad_adlerBase_manualTotalX;
            y = grad_adlerBase_manualTotalY;
            w = grad_adlerBase_manualTotalW;
            h = grad_adlerBase_manualBarH;

            sizeEx = 0.04 * TEXT_SCALE;
            text = "WILLKOMMEN BEI GRUPPE ADLER";
        };

        class listBG: grad_adlerBase_manualRscBackground {
            colorBackground[] = {0, 0, 0, 0.6};

            x = grad_adlerBase_manualListBGX;
            y = grad_adlerBase_manualListBGY;
            w = grad_adlerBase_manualListBGW;
            h = grad_adlerBase_manualContentBGH;
        };

        class contentBG: grad_adlerBase_manualRscBackground {
            colorBackground[] = {0, 0, 0, 0.6};

            x = grad_adlerBase_manualContentBGX;
            y = grad_adlerBase_manualContentBGY;
            w = grad_adlerBase_manualContentBGW;
            h = grad_adlerBase_manualContentBGH;
        };
    };

    class controls {
        class closeButton: grad_adlerBase_manualRscButton {
            x = grad_adlerBase_manualCloseButtonX;
            y = grad_adlerBase_manualButtonY;
            w = grad_adlerBase_manualButtonW;
            h = grad_adlerBase_manualBarH;

            text = "SCHLIESSEN";
            action = "closeDialog 1";
        };

        class checkBoxText: grad_adlerBase_manualRscText {
            x = grad_adlerBase_manualCheckBoxBGX;
            y = grad_adlerBase_manualButtonY;
            w = grad_adlerBase_manualCheckBoxBGW;
            h = grad_adlerBase_manualBarH;

            style = ST_RIGHT;
            colorBackground[] = {0, 0, 0, 0.8};
            text = "NICHT MEHR ANZEIGEN";
        };

        class checkBox: grad_adlerBase_manualCheckBox {
            idc = GRAD_ADLERBASE_MANUALIDCCHECKBOX;

            x = grad_adlerBase_manualCheckBoxBGX;
            y = grad_adlerBase_manualButtonY;
            w = grad_adlerBase_manualCheckBoxW;
            h = grad_adlerBase_manualCheckBoxH;

            text = "ASDASD";
        };

        class playerName: grad_adlerBase_manualRscText {
            idc = GRAD_ADLERBASE_MANUALIDCPLAYERNAME;

            x = grad_adlerBase_manualTotalX;
            y = grad_adlerBase_manualTotalY;
            w = grad_adlerBase_manualTotalW;
            h = grad_adlerBase_manualBarH;

            style = ST_RIGHT;
            colorBackground[] = {0, 0, 0, 0};
            sizeEx = 0.04 * TEXT_SCALE;
        };

        class list: grad_adlerBase_manualListBox {
            idc = GRAD_ADLERBASE_MANUALIDCLIST;

            onLBSelChanged = "_this call compile preprocessFileLineNumbers 'manual\onLBSelChanged.sqf'";

            x = grad_adlerBase_manualListX;
            y = grad_adlerBase_manualListY;
            w = grad_adlerBase_manualListW;
            h = grad_adlerBase_manualContentH;
        };

        class contentTitle: grad_adlerBase_manualRscStructuredText {
            idc = GRAD_ADLERBASE_MANUALIDCCONTENTTITLE;

            x = grad_adlerBase_manualContentX;
            y = grad_adlerBase_manualContentY;
            w = grad_adlerBase_manualContentW;
            h = grad_adlerBase_manualContentTitleH;

            class Attributes: Attributes {
                font = "PuristaLight";
                size = "4.0";
            };
        };

        class contentText: grad_adlerBase_manualRscStructuredText {
            idc = GRAD_ADLERBASE_MANUALIDCCONTENT;

            x = grad_adlerBase_manualContentX;
            y = grad_adlerBase_manualContentTextY;
            w = grad_adlerBase_manualContentW;
            h = grad_adlerBase_manualContentTextH;

            class Attributes: Attributes {
                size = "2.2";
            };
        };
    };
};
