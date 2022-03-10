package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets;

class Ground extends FlxState
{
	var ground:FlxSprite;
	var scaleFactor = 0.1;

	override public function create()
	{
		// Creates The Sprite
		super.create();
		ground = new FlxSprite(AssetPaths.ground__png);
		// Pixel Perfect rendering
		ground.pixelPerfectRender = true;
		// Pixel Perfect positioning
		ground.pixelPerfectPosition = true;
		ground.x = FlxG.width / 2 - ground.width / 2;
		ground.y = 300;
		ground.pixelPerfectRender = true;
		add(ground);
	}
}
