package;

import Discord;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import lime.app.Application;


class PlayState extends FlxState
{
	var scaleFactor = 0.1;
	var Player:FlxSprite; // Defines the player
	var enemy:FlxSprite; // Defines the enemy
	var Ground:FlxSprite; // Defines the ground
	var healthText:FlxText; // Defines the text

	override function create()
	{
		super.create();
		Player = new FlxSprite(AssetPaths.holyshititshaxe__png); // Creates the player's sprite.
		Player.x = FlxG.width / 2 - Player.width / 2; // Sets the player's x position. Makes it based off the player's sprite or something like that to make it always centered.
		Player.acceleration.y = 75; // Sets the player's acceleration.
		Player.velocity.y = 150; // Sets the player's velocity.
		Player.maxVelocity.y = 200; // Sets the player's max velocity.
		Player.pixelPerfectRender = true; // Pixel Perfect rendering.
		Player.pixelPerfectPosition = true; // Pixel Perfect positioning.
		Player.health = 10;

		enemy = new FlxSprite(AssetPaths.godot__png);
		enemy.y = 250;
		enemy.pixelPerfectRender = true; // Pixel Perfect rendering.
		enemy.pixelPerfectPosition = true; // Pixel Perfect positioning.

		Ground = new FlxSprite(AssetPaths.ground__png);
		Ground.pixelPerfectRender = true; // Pixel Perfect rendering.
		Ground.pixelPerfectPosition = true; // Pixel Perfect positioning.
		Ground.x = FlxG.width / 2 - FlxG.width / 2; // Sets the ground's x postion. Makes it based off the player's sprite or something like that to make it always centered.
		Ground.y = 300; // Sets the ground's y postion.
		Ground.maxVelocity.y = 0; // Sets the ground's max velocity.

		healthText = new FlxText();
		healthText.size = 16;
		healthText.text = "Health: 5";
		healthText.autoSize = false;
		healthText.wordWrap = false;
		healthText.fieldWidth = FlxG.width;
		healthText.color = FlxColor.WHITE;
		healthText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2, 1);
		healthText.alignment = FlxTextAlign.CENTER;
		healthText.screenCenter(FlxAxes.X);
		healthText.y = 8;


		// Pretty self-expanitory, you can figure it out
		Music.playMusic();
		add(Player);
		add(Ground);
		add(enemy);
		add(healthText);


		DiscordClient.initialize();

		Application.current.onExit.add(function(exitCode)
		{
			DiscordClient.shutdown();
		}, false, 100);
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

		// Player Health and Damage
		if (Player.health < -1)
		{
			Player.health = 10;
			Player.revive();
		}


		if (Player.health > 0)
			healthText.text = "Health: " + Std.string(Math.ceil(Player.health));
		else
			healthText.text = "DEAD!";

		if (FlxG.overlap(Player, enemy))
			Player.health -= 1;
	}
}
