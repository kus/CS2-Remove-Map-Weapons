using CounterStrikeSharp.API;
using CounterStrikeSharp.API.Core;
using CounterStrikeSharp.API.Core.Attributes;

namespace CS2_Remove_Map_Weapons
{
	[MinimumApiVersion(167)]
	public partial class CS2_Remove_Map_Weapons : BasePlugin
	{
		public override string ModuleName => "Remove Map Weapons";
		public override string ModuleVersion => "1.0.1";
		public override string ModuleAuthor => "Kus (https://github.com/kus)";
		public override string ModuleDescription => "Remove the weapons from the map";

		public override void Load(bool hotReload)
		{
			Log(PluginInfo());
			Log(ModuleDescription);
			RegisterEventHandlers();
		}

		void RemoveMapWeapons()
		{
			Log($"Removing map weapons");
			foreach (var entity in Utilities.FindAllEntitiesByDesignerName<CBaseEntity>("weapon"))
			{
				if (entity == null) continue;
				if (entity.Entity == null) continue;
				if (!entity.DesignerName.StartsWith("weapon_")) continue;
				if (entity.OwnerEntity == null || !entity.OwnerEntity.IsValid)
				{
					entity.Remove();
				}
			}
		}

		private void RegisterEventHandlers()
		{
			RegisterListener<Listeners.OnMapStart>(OnMapStartHandler);
			RegisterEventHandler<EventRoundStart>(OnRoundStart); 
		}

		private void OnMapStartHandler(string mapName)
		{
			Log($"OnMapStartHandler");
			RemoveMapWeapons();
		}

		private HookResult OnRoundStart(EventRoundStart eventRoundStartPreEntity, GameEventInfo info)
		{
			Log($"OnRoundStart");
			RemoveMapWeapons();
			return HookResult.Continue;
		}

		private string PluginInfo()
		{
			return $"Plugin: {this.ModuleName} - Version: {this.ModuleVersion} by {this.ModuleAuthor}";
		}

	}
}