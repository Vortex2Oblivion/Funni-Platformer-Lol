package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets;

class Player extends FlxState
{
	var sprite:FlxSprite;
	var scaleFactor = 0.1;

	override public function create()
	{
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
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		// Keyboard Movement
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
			sprite.x--;
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
			sprite.x++;
		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
			sprite.y--;
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
			sprite.y++;
		if (FlxG.keys.justPressed.SPACE)
		{
			sprite.y = FlxG.height / 2 - sprite.height / 2;
			sprite.x = FlxG.width / 2 - sprite.width / 2;
		}

		// Mouse Movement
		if (FlxG.mouse.pressed)
		{
			sprite.setPosition(FlxG.mouse.getPosition().x - sprite.width / 2, FlxG.mouse.getPosition().y - sprite.height / 2);
		}
		// This does something. I just don't know what.
		if (FlxG.mouse.justReleasedRight)
		{
			sprite.y = FlxG.height / 2 - sprite.height / 2;
			sprite.x = FlxG.width / 2 - sprite.width / 2;
			sprite.scale.set(1, 1);
		}
		if (FlxG.mouse.wheel != 0)
		{
			sprite.scale.add(FlxG.mouse.wheel * scaleFactor, FlxG.mouse.wheel * scaleFactor);
		}
	}
}
