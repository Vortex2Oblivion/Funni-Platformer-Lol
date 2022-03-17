package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSprite;
import flixel.FlxSubState;

class GravitySubState extends FlxSprite
{
	var Player:FlxSprite = PlayState.Player;

	override public function new()
	{
		super();

		Player.acceleration.y = 600;
		Player.maxVelocity.y = 200;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

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
	}
}
