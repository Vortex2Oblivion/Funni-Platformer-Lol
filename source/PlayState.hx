package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public static var Player:FlxSprite;

	var sprite:FlxSprite;

	override function create()
	{
		super.create();
		sprite = new FlxSprite("assets/holyshititshaxe.png");
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.acceleration.y = 600;
		sprite.maxVelocity.y = 200;

		add(sprite);
		Music.playMusic();
		add(new Player());
		add(new Ground());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprite.velocity.y > 0 && sprite.y >= FlxG.height + 8)
		{
			sprite.y = FlxG.height + 8;
			sprite.acceleration.y = 0;
			sprite.velocity.y = -100;
		}
		else if (sprite.velocity.y < 0 && sprite.y <= 0)
		{
			sprite.y = 0;
			sprite.velocity.y = 0;
			sprite.acceleration.y = 800;
		}
	}
}
