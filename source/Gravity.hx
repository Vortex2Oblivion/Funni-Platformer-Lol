package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets;
import openfl.display.Sprite;

class Gravity extends FlxSprite
{
	var Player = new FlxSprite();

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		Player.y++;
		if (Player.y > FlxG.height)
			Player.y = 0 - 64;
	}
}
