package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, Player));
		addChild(new FlxGame(0, 0, Music));
		addChild(new FlxGame(0, 0, Ground));
	}
}
