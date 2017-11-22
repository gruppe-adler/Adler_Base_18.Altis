/*
 Simmax v. 0.9   Nov.2017
 Flashlight Area 3 - KSK
 
***************************** 




*****************************
*/



sleep 2;

  Private ["_vehicle"]; 
   
	_vehicle  = SM_Schild_01;
	_vehicle2 = SM_Schild_04;
	_vehicle3 = SM_Schild_06;		
	
strobe_counter1 = 0;
strobe_runden = 18;



 
// ***************************************
 
sleep 1;
 
 
 
while { strobe_counter1 < strobe_runden} do {   						// Schleife 1    
 

// if (Area_3_RundeAktiv == 0) ExitWith {}; 

 
  strobe_counter1 = strobe_counter1 +1;   	
	
		

    _lightleft3 = "#lightpoint" createVehicle getpos _vehicle;    
    sleep 0.1; 
    _lightleft3 setLightColor[1, 1, 0.5];  
    _lightleft3 setLightBrightness 0.7;   
    _lightleft3 setLightAmbient [0.1,0.07,0.07];  
    _lightleft3 lightAttachObject [_vehicle, [-1, -4, 2.5]];  //exact position of leftlight 

sleep(0.1 + random 0.2);

deletevehicle _lightleft3;


    _lightleft3 = "#lightpoint" createVehicle getpos _vehicle2;    
sleep(0.1 + random 0.2);
    _lightleft3 setLightColor[1, 1, 1];  
    _lightleft3 setLightBrightness 0.7;   
    _lightleft3 setLightAmbient [0.1,0.07,0.07];  
    _lightleft3 lightAttachObject [_vehicle2, [-1, -4, 2.5]];  //exact position of leftlight 


sleep(0.1 + random 0.2);
deletevehicle _lightleft3;


    _lightleft3 = "#lightpoint" createVehicle getpos _vehicle3;    
    sleep 0.1; 
    _lightleft3 setLightColor[1, 0, 0];  
    _lightleft3 setLightBrightness 0.5;   
    _lightleft3 setLightAmbient [0.1,0.01,0.01];  
    _lightleft3 lightAttachObject [_vehicle3, [-1, -4, 2.5]];  //exact position of leftlight 


sleep 0.2;
deletevehicle _lightleft3;




}


