
if(::mods_getRegisteredMod("sato_retinue_mod") == null) {
    ::mods_registerMod("sato_retinue_mod", 1.0, "Sato's Rebalanced Retinue");
}

::mods_hookNewObject("retinue/followers/scout_follower", function(sf) {
    sf.onUpdate = function()
    {
        for( local i = 0; i < this.World.Assets.m.TerrainTypeSpeedMult.len(); i = ++i )
		{
            if (this.Const.World.TerrainTypeSpeedMult[i] <= 0.65 && this.Const.World.TerrainTypeSpeedMult[i] > 0.0) {
                // This division is necessary due to TerrainTypeSpeedMult in this.World.Assets being different from TerrainTypeSpeedMult in this.Const.World
                // More specifically:
                //   The mult in this.Const.World effects *every* party.
                //   The mult in this.World.Assets is *specifically* used for the player, *specifically* for the Scout.
                //   What happens is all the mults in this.World.Assets = 1.0 by default, which mults speed (which itself is mult'd by
                //     the TerrainTypeSpeedMult in this.Const.World).
                //   For example, lets say you have a base speed of 5 and are on Swamps. That gets multiplied by the this.Const.World
                //     TerrainTypeSpeedMult for Swamps, or 0.5. Your speed is now 5 * 0.5 = 2.5. It's then multiplied by the *player's*
                //     TerrainTypeSpeedMult in this.World.Assets, which we're setting below. The Vanilla scout implementation is to
                //     multiply the default value (1.0) by 1.15, resulting in a total mult of 1.15, and a final speed of 5 * 0.5 * 1.15,
                //     or 2.875. *This* implementation wants to turn that "* 1.15" piece into a speed equivalent to just 5 * (0.5 + 0.15).
                //
                //   The division here is to achieve that. 0.5 * ((0.5 + 0.15) / 0.5) == 0.5 * (0.65 / 0.5) == 0.5 * 1.3 == 0.65.
                this.World.Assets.m.TerrainTypeSpeedMult[i] *= (this.Const.World.TerrainTypeSpeedMult[i] + 0.15) / this.Const.World.TerrainTypeSpeedMult[i];
            }
		}
    };

    ::mods_addField(sf, "scout_follower", "Name", "The Guide");
    ::mods_addField(sf, "scout_follower", "Description", "The Guide is an expert in finding mountain passes, navigating through treacherous swamps, and guiding anyone safely through the darkest of forests.");
    ::mods_addField(sf, "scout_follower", "Effects", [
        "Reduces the movement penalty of difficult terrain by 15%",
        "Prevents sickness and accidents due to terrain"
    ]);
});
