
 
    if (FlashligtArea_3 == 1) then {
	
	FlashligtArea_3 = 0;
	_text = " Flashligt off";
	_text remoteExec ["hint"];			
										
		
    } else {
 
	FlashligtArea_3 = 1;
	_text = " Flashligt on";
	_text remoteExec ["hint"];	
    };

    publicVariable "FlashligtArea_3";	
	
sleep 2;	

	_text = "";
	_text remoteExec ["hint"];		
	
	
	

 