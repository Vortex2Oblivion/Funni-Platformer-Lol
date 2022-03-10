package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override function create()
	{
		super.create();

		Music.playMusic();

		add(new Player());
		add(new Ground());
	}
}
