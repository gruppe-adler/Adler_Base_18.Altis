class BaseLoadout {
	class AllUnits {
		uniform = "SMM_Uniform_BW_MC";
		vest = "SMM_Vest_BW_MC";
		backpack = "";
		headgear = "grad_beret_red";
		primaryWeapon = "rhs_weap_hk416d10";
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		primaryWeaponOptics = "rhsusf_acc_g33_T1";
		primaryWeaponPointer = "";
		primaryWeaponMuzzle = "";
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
		handgunWeapon = "rhsusf_weap_glock17g4";
        handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_JHP";
		binoculars = "Binocular";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "ItemWatch";
		gps = "ItemGPS";
		radio = "tf_anprc152";
		nvgoggles = "";

        addItemsToUniform[] = {
            LIST_1("ACE_MapTools"),
            LIST_1("ACE_DefusalKit"),
            LIST_2("ACE_CableTie"),
            LIST_1("ACE_Flashlight_MX991"),

            LIST_4("ACE_packingBandage"),
            LIST_4("ACE_elasticBandage"),
            LIST_4("ACE_quikclot"),
            LIST_4("ACE_tourniquet"),
            LIST_2("ACE_morphine"),
            LIST_2("ACE_epinephrine")
        };
        addItemsToVest[] = {
            LIST_2("Chemlight_green"),
            LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
            LIST_7("rhs_mag_30Rnd_556x45_Mk318_Stanag")
        };
    };
};
