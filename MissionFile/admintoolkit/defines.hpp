#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON          41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_CHECKBOX         77 //Arma 3
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP              100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
#define CT_ITEMSLOT         103

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144 //tileH and tileW params required for tiled image
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           1024

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "PuristaMedium" // The standard font in Arma 3 is "PuristaMedium"
#define FontT             "TahomaB"

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

class RscButton {
	idc = -1;
	type = CT_BUTTON;
    style = ST_CENTER;
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; 
	colorBackgroundActive[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {0, 0, 0, 0};
	colorFocused[] = {0,0,0,1};
	colorShadow[] = {0,0,0,1};
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	
	offsetX = 0.0;
	offsetY = 0.0;
	offsetPressedX = 0.0;
	offsetPressedY = 0.0;
	
	sizeEx = 0.03;
	shadow = 0;
	borderSize = 0.0;
	font = FontM;
 
	text = "Close";
	action = "closeDialog 0";
}

class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0, 0, 0, 0.5};
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; 
	colorBackgroundActive[] = {0, 0, 0, 0.5};
    colorText[] = {1,1,1,1};
    font = "Zeppelin32";
    sizeEx = 0.02;
    text = "";
};

class RscListBox
{
     access = 0;
     type = CT_LISTBOX;
     style = 0;
     font = FontM;
     sizeEx = 0.04;
     rowHeight = 0;
     colorText[] = {1,1,1,1};
     colorScrollbar[] = {1,1,1,1};
     colorSelect[] = {0,0,0,1};
     colorSelect2[] = {1,0.5,0,1};
     colorSelectBackground[] = {0.6,0.6,0.6,1};
     colorSelectBackground2[] = {0.2,0.2,0.2,1};
     colorBackground[] = {0,0,0,1};
     colorDisabled[] = {0, 0, 0, 0};
     maxHistoryDelay = 1.0;
     soundSelect[] = {"",0.1,1};
     period = 1;
     autoScrollSpeed = -1;
     autoScrollDelay = 5;
     autoScrollRewind = 0;
     arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
     arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
     shadow = 0;
     class ListScrollBar
     {
      color[] = {1,1,1,0.6};
      colorActive[] = {1,1,1,1};
      colorDisabled[] = {1,1,1,0.3};
      thumb = "#(argb,8,8,3)color(1,1,1,1)";
      arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
      arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
      border = "#(argb,8,8,3)color(1,1,1,1)";
      shadow = 0;
     };
};

class RscText {
  type = CT_STATIC;
  idc = -1;
  style = ST_LEFT;
  colorBackground[] = {0, 0, 0, 1};
  colorText[] = {1, 1, 1, 1};
  font = FontM;
  sizeEx = 0.04;
  h = 0.04;
  text = "";
};

class RscStructText {
  type = CT_STRUCTURED_TEXT;
  idc = -1;
  style = 0;
  colorBackground[] = {0, 0, 0, 1};
  text = "";
};

class RscHtml {
  idc = -1;
  type = CT_HTML; // defined constant (9)
  style = ST_LEFT; // defined constant (0)
  
  x = 0.25;
  y = 0.22;
  w = 0.5;
  h = 0.6; 
  
  filename = "welcome.html";
  text="";
  
  colorBackground[] = {0,0,0, 0.8};
  colorBold[] = {1, 0, 0, 1};
  colorLink[] = {0, 0, 1, 1};
  colorLinkActive[] = {1, 0, 0, 1};
  colorPicture[] = {1, 1, 1, 1};
  colorPictureBorder[] = {1, 0, 0, 1};
  colorPictureLink[] = {0, 0, 1, 1};
  colorPictureSelected[] = {0, 1, 0, 1};
  colorText[] = {1, 1, 1, 1};
  
  prevPage = "\ca\ui\data\arrow_left_ca.paa";
  nextPage = "\ca\ui\data\arrow_right_ca.paa";
	
	class H1 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.08;
	};
	
	class H2 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.07;
	};
	
	class H3 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.06;
	};
	
	class H4 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.05;
	};
	
	class H5 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.04;
	};
	
	class H6 {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.035;
	};
	
	class P {
		font = FontM;
		fontBold = FontM;
		sizeEx = 0.03;
	};
};