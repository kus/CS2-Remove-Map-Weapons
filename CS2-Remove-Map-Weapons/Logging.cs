namespace CS2_Remove_Map_Weapons
{
	public partial class CS2_Remove_Map_Weapons
	{

		private void Log(string message)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine($"{DateTime.Now.ToString("HH:mm:ss.fff")} [{this.ModuleName}] {message}");
			Console.ResetColor();
		}

	}
}