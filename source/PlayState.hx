package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var ground:FlxSprite;
	var scaleFactor = 0.1;

	override public function create()
	{
		// Play sound effect without AssetPaths
		FlxG.sound.playMusic(AssetPaths.Yes__ogg);
		// Creates The Sprite
		super.create();
		sprite = new FlxSprite(AssetPaths.apple__png);
		// Pixel Perfect rendering
		sprite.pixelPerfectRender = true;
		// Pixel Perfect positioning
		sprite.pixelPerfectPosition = true;
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		sprite.pixelPerfectRender = true;
		ground = new FlxSprite(AssetPaths.ground__png);
		// Pixel Perfect rendering
		ground.pixelPerfectRender = true;
		// Pixel Perfect positioning
		ground.pixelPerfectPosition = true;
		ground.x = FlxG.width / 2 - sprite.width / 2;
		ground.y = 300;
		ground.pixelPerfectRender = true;
		add(sprite);
		add(ground);
	}
}
