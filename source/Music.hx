package;

import flixel.FlxG;
import flixel.FlxState;

class Music extends FlxState
{
	override public function create()
	{
		FlxG.sound.playMusic(AssetPaths.Yes__ogg);
	}
}
