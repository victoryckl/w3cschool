#pragma strict

function Start () {
	
}

function Update () {
	
}

var windowRect:Rect = Rect(300,20,120,50);

var windowRect0:Rect=Rect(500, 20, 120, 50);
var windowRect1:Rect=Rect(500, 100, 120, 50);

var aTexture:Texture;
private var toggleTxt:boolean=false;
private var toggleImg:boolean=false;

function OnGUI() {
	GUI.Box(Rect(5,35,210,175), GUIContent("Box", "this box has a tooltip"));
	GUI.Button(Rect(30,85,100,20), "No tooltip here");
	GUI.Button(Rect(30,120,100,20), 
		GUIContent("I have a tooltip", "The button overrides the box"));
	GUI.Label(Rect(10,40,100,100), GUI.tooltip);

	windowRect = GUI.Window(0, windowRect, DoMyWindow, "My Window");

    GUI.color=Color.red;
    windowRect0=GUI.Window(1, windowRect0, DoMyWindow2, "Red Window");
    GUI.color=Color.green;
    windowRect1=GUI.Window(2, windowRect1, DoMyWindow2, "Green Window");

	if(!aTexture){
        Debug.LogError("Assign a Texture in the inspector.");
        return;
    }
    GUI.DrawTexture(Rect(260, 100, 150, 150), aTexture);

	toggleTxt=GUI.Toggle(Rect(550, 180, 100, 30), toggleTxt, "A Toggle text");
    toggleImg=GUI.Toggle(Rect(550, 210, 50, 50), toggleImg, aTexture);
}

function DoMyWindow(windowID:int) {
	GUI.DragWindow(Rect(0,0,10000,50));
}

function DoMyWindow2(windowID:int){
    if(GUI.Button(Rect(10, 20, 100, 20), "Hello World2"))
    print("Got a click in window with color"+GUI.color);
    GUI.DragWindow(Rect(0, 0, 10000, 10000));
}
