package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import js.lib.intl.Collator.Collation;

class PlayState extends FlxState
{
	var scaleFactor = 0.1;
	var Player:FlxSprite;
	var Ground:FlxSprite;

	override function create()
	{
		super.create();
		Player = new FlxSprite("assets/holyshititshaxe.png");
		Player.x = FlxG.width / 2 - Player.width / 2;
		Player.acceleration.y = 0;
		Player.maxVelocity.y = 200;

		Ground = new FlxSprite(AssetPaths.ground__png);
		// Pixel Perfect rendering
		Ground.pixelPerfectRender = true;
		// Pixel Perfect positioning
		Ground.pixelPerfectPosition = true;
		Ground.x = FlxG.width / 2 - FlxG.width / 2;
		Ground.y = 300;

		Player.velocity.y = 150;
		Music.playMusic();
		add(Player);
		add(Ground);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// Gravity Shit
		if (Player.velocity.y > 0 && Player.y >= FlxG.height + 8)
		{
			Player.y = FlxG.height + 8;
			Player.acceleration.y = 0;
			Player.velocity.y = -100;
		}
		else if (Player.velocity.y < 0 && Player.y <= 0)
		{
			Player.y = 0;
			Player.velocity.y = 0;
			Player.acceleration.y = 800;
		}

		{
			super.update(elapsed);

			FlxG.collide(Player, Ground, Collation);

			if (Player.x <= 0)
				Player.velocity.x *= -1;
			if (Ground.x >= FlxG.width - Ground.width)
				Ground.velocity.x *= -1;
		}

		function collision(Player:FlxSprite, Ground:FlxSprite)
		{
			Player.velocity.x = -150;
			Ground.velocity.x = 150;
		}

		// Keyboard Movement
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
			Player.x--;
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
			Player.x++;
		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
			Player.y--;
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
			Player.y++;
		if (FlxG.keys.justPressed.SPACE)
		{
			Player.y = FlxG.height / 2 - Player.height / 2;
			Player.x = FlxG.width / 2 - Player.width / 2;
		}

		// Mouse Movement
		if (FlxG.mouse.pressed)
			Player.setPosition(FlxG.mouse.getPosition().x - Player.width / 2, FlxG.mouse.getPosition().y - Player.height / 2);

		if (FlxG.mouse.justReleasedRight)
		{
			Player.y = FlxG.height / 2 - Player.height / 2;
			Player.x = FlxG.width / 2 - Player.width / 2;
			Player.scale.set(1, 1);
		}

		if (FlxG.mouse.wheel != 0)
			Player.scale.add(FlxG.mouse.wheel * 0.1, FlxG.mouse.wheel * 0.1);
	}
}
