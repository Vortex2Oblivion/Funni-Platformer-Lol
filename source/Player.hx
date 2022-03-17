package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.display.Sprite;

class Player extends FlxSprite
{
	override public function new()
	{
		// Creates The Sprite
		super(0, 0);
		loadGraphic(AssetPaths.apple__png);
		// Pixel Perfect rendering
		pixelPerfectRender = true;
		// Pixel Perfect positioning
		pixelPerfectPosition = true;
		x = FlxG.width / 2 - width / 2;
		y = FlxG.height / 2 - height / 2;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// Keyboard Movement
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
			x--;
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
			x++;
		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
			y--;
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
			y++;
		if (FlxG.keys.justPressed.SPACE)
		{
			y = FlxG.height / 2 - height / 2;
			x = FlxG.width / 2 - width / 2;
		}

		// Mouse Movement
		if (FlxG.mouse.pressed)
			setPosition(FlxG.mouse.getPosition().x - width / 2, FlxG.mouse.getPosition().y - height / 2);

		if (FlxG.mouse.justReleasedRight)
		{
			y = FlxG.height / 2 - height / 2;
			x = FlxG.width / 2 - width / 2;
			scale.set(1, 1);
		}

		if (FlxG.mouse.wheel != 0)
			scale.add(FlxG.mouse.wheel * 0.1, FlxG.mouse.wheel * 0.1);
	}
}
