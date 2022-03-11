package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets;

class Ground extends FlxSprite
{
	override public function new()
	{
		super(0, 0);

		loadGraphic(AssetPaths.ground__png);
		// Pixel Perfect rendering
		pixelPerfectRender = true;
		// Pixel Perfect positioning
		pixelPerfectPosition = true;
		x = FlxG.width / 2 - width / 2;
		y = 300;
		pixelPerfectRender = true;
	}
}
