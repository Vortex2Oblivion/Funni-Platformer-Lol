package;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public static var Player:FlxSprite;

	override function create()
	{
		super.create();
		Music.playMusic();
		add(new Player());
		add(new Ground());
	}
}
