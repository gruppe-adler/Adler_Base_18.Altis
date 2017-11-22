
sleep 0.01;

 
waitUntil {!isnil "timer_04"};
 
while {(timer_04 >= 0)} do {		// Runden und max Zeit
// hintSilent parsetext format ["<t size='1.5' align='center'>%1</t>",(timer_02 / 3600) call compile loadfile "scripts\simmax\SM_time_02.sqf"];
      timer_04 = timer_04 + 1;
      publicvariable "timer_04";
      sleep 1;
};

exit;
