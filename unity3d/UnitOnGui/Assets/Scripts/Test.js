#pragma strict

function Start () {
	
}

function Update () {
	
}

var count = 1;

var btnTexture:Texture;
var atnTexture:Texture;
var textureToDisplay:Texture2D;

public static var backgroundColor:Color;
public static var color:Color;

var stringToEdit:String="Hello Edit";

var scrollPosition:Vector2 = Vector2.zero;

var hSliderValue:float = 0.0;
var vSliderValue:float = 0.0;

var toolbarInt:int = 0;
var toolbarStrings:String[] = ["toolbar1", "toolbar2", "toolbar3"];

function OnGUI() {
	if (GUI.Button(Rect(0,0,100,50), "click here")) {
		print("you have click here! "+count);
		count++;
	}

	if (!btnTexture) {
		Debug.LogError("Please assign a texture on the inspector");
		return;
	}
	if (!atnTexture) {
		Debug.LogError("Please assign a texture on the inspector");
		return;
	}

	if (GUI.Button(Rect(Screen.width/2-50, Screen.height/2+130, 70, 70),atnTexture)){
		Application.LoadLevel("play");
	}
	if (GUI.Button(Rect(Screen.width/2+30, Screen.height/2+130, 70, 70), btnTexture)) {
		Application.LoadLevel("exit");
	}

	GUI.Box(Rect(Screen.width-100,0,100,50), "Box\nTop-Right");
	GUI.Box(Rect(0, Screen.height-50, 100,50), "Box\nButtom-Left");
	GUI.Box(Rect(Screen.width-100,Screen.height-50, 100,50), "Box\nButtom-Right");

	if (!textureToDisplay) {
		Debug.LogError("Please assign a texture on the inspector: textureToDisplay");
		return;
	}

	GUI.Label(Rect(10, 100, 100, 20),"Hello World!");
	GUI.Label(Rect(10, 140, textureToDisplay.width, textureToDisplay.height), textureToDisplay);

	GUI.backgroundColor = Color.yellow;
    GUI.Button(Rect(10, 210, 70, 30), "A button");
	
	GUI.color = Color.red;
	GUI.Box(Rect(200, 50, 50, 50), "A BOX");

	Debug.Log(GUI.TextField(Rect(260,50,100,30), stringToEdit, 25));
	Debug.Log(GUI.TextArea(Rect(380,50,200,80), "Hello TextArea\n next line"));

	scrollPosition = GUI.BeginScrollView(Rect(580,50,100,100), scrollPosition, Rect(0,0,220,200));
    GUI.Button(Rect(0, 0, 100, 20), "Top-left");
    GUI.Button(Rect(120, 0, 100, 20), "Top-right");
    GUI.Button(Rect(0, 180, 100, 20), "Bottom-left");
    GUI.Button(Rect(120, 180, 100, 20), "Bottom-right");
    GUI.EndScrollView();

	hSliderValue = GUI.HorizontalSlider(Rect(100, 150, 100, 10), hSliderValue, 0.0, 10.0);
	vSliderValue = GUI.VerticalSlider(Rect(130, 160, 30, 60), vSliderValue, 10.0, 0.0);

	toolbarInt = GUI.Toolbar(Rect(25, 320, 250, 30), toolbarInt, toolbarStrings);
	Debug.Log("toolbarInt="+toolbarInt);
}
