local Zulib_FirearmBaseUpdateVisualObj = FirearmBase.zz_UpdateVisualObj

function FirearmBase:zz_UpdateVisualObj(vis)
	Zulib_FirearmBaseUpdateVisualObj(self, vis)
	ApplyWeaponComponentOffset(self, vis) ---- From JA3 Common Mod Lib
end
