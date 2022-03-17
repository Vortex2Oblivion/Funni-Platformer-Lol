package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

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
		Player.acceleration.y = 5;
		Player.maxVelocity.y = 200;
		// Pixel Perfect rendering
		Player.pixelPerfectRender = true;
		// Pixel Perfect positioning
		Player.pixelPerfectPosition = true;

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

			FlxG.collide(Player, Ground);

			if (Player.y <= 0)
				Player.velocity.y *= 0;
			if (Ground.y >= FlxG.width - Ground.width)
				Ground.velocity.y *= 0;
		}

		function collision(Player:FlxSprite, Ground:FlxSprite)
		{
			Player.velocity.y = 0;
			Ground.velocity.y = 0;
		}

		// Keyboard Movement
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
			Player.x--;
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
			Player.x++;
		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
			Player.y--;

		if (FlxG.mouse.wheel != 0)
			Player.scale.add(FlxG.mouse.wheel * 0.1, FlxG.mouse.wheel * 0.1);
	}
}
