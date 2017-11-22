
sleep 0.01;

 
waitUntil {!isnil "timer_01"};
 
while {(timer_01 >= 0)} do {		// Runden und max Zeit
// hintSilent parsetext format ["<t size='1.5' align='center'>%1</t>",(timer_01 / 3600) call compile loadfile "scripts\simmax\SM_time_01.sqf"];
      timer_01 = timer_01 + 1;
      publicvariable "timer_01";
      sleep 1;
};

exit;