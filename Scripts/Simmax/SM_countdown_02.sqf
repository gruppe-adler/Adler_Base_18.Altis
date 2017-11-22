
sleep 0.01;

 
waitUntil {!isnil "timer_02"};
 
while {(timer_02 >= 0)} do {		// Runden und max Zeit
// hintSilent parsetext format ["<t size='1.5' align='center'>%1</t>",(timer_02 / 3600) call compile loadfile "scripts\simmax\SM_time_02.sqf"];
      timer_02 = timer_02 + 1;
      publicvariable "timer_02";
      sleep 1;
};

exit;
