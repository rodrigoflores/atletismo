/**
* MiniColorPicker v0.5
* 	By: me [at] daantje [dot] nl
*
* 	Last updated: Mon Nov 20 13:03:36 CET 2006
*
*	Documentation:
*		A realy small Photoshop like color picker in DHTML.
*		It should be compatible with MSIE and Mozilla based
*		browsers.
*
*	License:
*		LGPL
*
*	Support:
*		Not realy.
*
*	Thanks to:
*		Robert James Ellis for the big donation!
*		(the Graphite Pro Control Panel project)
*		http://www.sddepot.com/
*/


//Config ammount of colors
var bit = 16; 		//default color depth, increase to make picker bigger (and slower) Values: 8, 16, 24 or 32
var pixel = 10;     //make the picker pixels bigger or smaller.


//define globals, don't change!
bit = Math.round(255 / bit);
var ConvArray = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F');
var picked = new Array();
var pickedColorRGB = new Array();
var toolbarShow = new Array();
var donePickerInits = new Array();
var clickedPicker;
var MCPtmr = new Array();
var doExtraPickerCMD = new Array();


//this function is written by Guido Socher, guido at linuxfocus dot org
function dec2hex(value){
    var retval = '';
    var intnum;
    var tmpnum;
    var i = 0;

    intnum = parseInt(value,10);
    if (isNaN(intnum)){
        retval = 'NaN';
    }else{
        while (intnum > 0.9){
            i++;
            tmpnum = intnum;
            // cancatinate return string with new digit:
            retval = ConvArray[tmpnum % 16] + retval;
            intnum = Math.floor(tmpnum / 16);
            if (i > 100){
                // break infinite loops
                retval = 'NaN';
                break;
            }
        }
    }
	if(retval.length == 1)
		retval = '0' + retval;
	else if(retval.length == 0)
		retval = '00';
    return retval;
}


function HEXcolor2RGB(value){
	value = value.replace('#','');
	pickedColorRGB[0] = value.substr(0,2);
	pickedColorRGB[1] = value.substr(2,2);
	pickedColorRGB[2] = value.substr(4,2);
	for(i=0;i<3;i++){
		pickedColorRGB[i] = parseInt(pickedColorRGB[i],16);
	}
	return pickedColorRGB;
}


function buildPicker(depth){
	htmlStr = "<table border=0 cellpadding=0 cellspacing=0 width="+Math.round((255/depth) * pixel)+" height="+Math.round((255/depth) * pixel)+"><tr>";
	//palet
	for(x=0;x<=255;x=x+depth){
		for(y=0;y<=255;y=y+depth){
			htmlStr+= "<td id='"+depth+"_"+x+"_"+y+"' onclick=\"pickColor(picked[clickedPicker],"+x+","+y+")\" unselectable=on width="+pixel+" height="+pixel+"></td>";
		}
		htmlStr+= "</tr><tr>";
	}
	//grays
	for(x=0;x<=255;x=x+depth){
		c = dec2hex(x)+dec2hex(x)+dec2hex(x);
		htmlStr+= "<td bgcolor=\"#"+c+"\" onclick=\"pickColor("+x+","+x+","+x+")\" unselectable=on width="+pixel+" height="+pixel+"></td>";
	}
	htmlStr+= "</tr></table>";

	return htmlStr;
}


function changePallet(R,depth){
	depth = parseInt(depth);
	for(G=0;G<=255;G=G+depth){
		for(B=0;B<=255;B=B+depth){
            if(document.getElementById(depth+'_'+G+'_'+B))
				document.getElementById(depth+'_'+G+'_'+B).style.backgroundColor = '#'+dec2hex(R)+dec2hex(G)+dec2hex(B);
		}
	}
	picked[clickedPicker] = R;
}


function changePickerHue(depth){
	g = 0;
	b = 255;
	gS = 0;
	bS = 1;
	htmlStr = "<table border=0 cellpadding=0 cellspacing=0 width="+pixel+" height="+((255/depth) * pixel)+">";
	for(r=0;r<=255;r=r+depth){
		c = dec2hex(r)+dec2hex(g)+dec2hex(b);
		htmlStr+= "<tr><td bgcolor=\"#"+c+"\" onclick=\"changePallet("+r+","+depth+")\" width="+pixel+" height="+pixel+"></td></tr>";

		if(g == 255) gS = 1;
		else if(g == 0) gS = 0;

		if(b == 255) bS = 1;
		else if(b == 0) bS = 0;

		if(gS == 0)
			g = g + (depth * 2);
		else
			g = g - (depth * 2);

		if(bS == 0)
			b = b + (depth * 4);
		else
			b = b - (depth * 4);
	}
	htmlStr+= "<tr><td bgcolor=\"#ffffff\" onclick=\"changePallet(255,"+depth+")\" width="+pixel+" height="+pixel+"></td></tr>";
	htmlStr+= "</table>";

	return htmlStr;
}


function pickColor(r,g,b){
	c = '#'+dec2hex(r)+dec2hex(g)+dec2hex(b);
	document.getElementById(clickedPicker).style.backgroundColor = c;
	document.getElementById(clickedPicker+'Value').value = c;
	p = clickedPicker.split('_');
	if(doExtraPickerCMD[clickedPicker] && c && !c.indexOf('NaN')>-1 && c.length == 7)
		eval(doExtraPickerCMD[clickedPicker].substring(0,doExtraPickerCMD[clickedPicker].length - 1) + (doExtraPickerCMD[clickedPicker].substr(-2) != "()" ? "," : "") + "'" + c + "')");
  	killPicker(1,1500);
}


function setPickedColorFromForm(obj,fromScript){
	c = HEXcolor2RGB(obj.value);
	changePallet(c[0]);
	document.getElementById(obj.id.replace('Value','')).style.backgroundColor = obj.value;
  	if(!fromScript && doExtraPickerCMD[obj.id.replace('Value','')] && obj.value && !obj.value.indexOf('NaN')>-1 && obj.value.length == 7)
  		eval(doExtraPickerCMD[obj.id.replace('Value','')].substring(0,doExtraPickerCMD[obj.id.replace('Value','')].length - 1) + (doExtraPickerCMD[obj.id.replace('Value','')].substr(-2) != "()" ? "," : "") + "'" + obj.value + "')");
}


function placePickerToolbar(obj,depth){
	lastClickedPicker = clickedPicker;
	clickedPicker = obj.id;

    if(lastClickedPicker && lastClickedPicker != clickedPicker){
		p = lastClickedPicker.split('_');
    	document.getElementById('colorPickerTools_'+p[1]).style.visibility = 'hidden';
		toolbarShow[lastClickedPicker] = 0;
	}

	if(!depth && clickedPicker){
		p = clickedPicker.split('_');
    	depth = p[1];
	}

	if(MCPtmr[clickedPicker])
		clearTimeout(MCPtmr[clickedPicker]);

	if(toolbarShow[obj.id] == 0){
		toolbarShow[obj.id] = 1;

		t = obj.offsetTop + parseInt(obj.style.height) + 3;
		l = obj.offsetLeft;
		while(obj.offsetParent){
			t+= obj.offsetParent.offsetTop;
			l+= obj.offsetParent.offsetLeft;
			obj = obj.offsetParent;
		}
		document.getElementById('colorPickerTools_'+depth).style.top = t;
		document.getElementById('colorPickerTools_'+depth).style.left = l;
		document.getElementById('colorPickerTools_'+depth).style.visibility = 'visible';
		if(picked[clickedPicker] == null)
			changePallet(255,depth);
		else
			setPickedColorFromForm(document.getElementById(clickedPicker+'Value'),true);
	}else if(toolbarShow[obj.id] == 1){
		document.getElementById('colorPickerTools_'+depth).style.visibility = 'hidden';
		toolbarShow[obj.id] = 0;
	}
}


function killPicker(sw,t){
	if(clickedPicker){
		if(!t)
			t = 500;
		toolbarShow[clickedPicker] = sw;
		if(MCPtmr[clickedPicker])
			clearTimeout(MCPtmr[clickedPicker]);
		if(sw == 1)
 			MCPtmr[clickedPicker] = setTimeout('placePickerToolbar(document.getElementById(clickedPicker));',t);
	}
}


function initPicker(fieldName,fieldValue,depth,callFunc){
	if(!depth)
		depth = bit;
	else
		depth = Math.round(255 / depth);
	pickerScreen = buildPicker(depth);
	hueScreen = changePickerHue(depth);
	if(!fieldValue)
		fieldValue = "";

	if(!donePickerInits[depth]){
		donePickerInits[depth] = 0;
		document.write("<div id=colorPickerTools_"+depth+" onmouseout=\"killPicker(1)\" onmouseover=\"killPicker(0)\" style=\"z-Index:10000;visibility:hidden;cursor:crosshair;position:absolute;border:1px solid #000000;background-color:#ffffff\"></div>");
		document.getElementById('colorPickerTools_'+depth).innerHTML = '<table border=0 cellpadding=0 cellspacing=0><tr><td valign=top>'+pickerScreen+'</td><td valign=top style="border-left:1px solid #000000;">'+hueScreen+'</td></tr><tr><td colspan=2><table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td width=50% style="background-color:#ffffff;" onclick="pickColor(255,255,255);" height='+pixel+'></td><td width=50% style="background-color:#000000;" onclick="pickColor(0,0,0);" height='+pixel+'></td></tr></table></td></tr></table>';
	}
	s = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
	s+= "<td><div onmouseout=\"killPicker(1)\" onmouseover=\"killPicker(0)\" onclick=\"placePickerToolbar(this,"+depth+")\" style=\"width:15px;height:15px;border: 1px solid #000000;cursor:pointer;background-color:"+fieldValue+";\" id=pickedColor_"+depth+"_"+donePickerInits[depth]+"></div></td>";
	s+= "<td>&nbsp;<input type=\"text\" name=\""+fieldName+"\" id=pickedColor_"+depth+"_"+donePickerInits[depth]+"Value value=\""+fieldValue+"\" size=7 style=\"font-size:10px;\" onchange=\"setPickedColorFromForm(this)\"></td>";
	s+= "</table>";
	document.write(s);

	oid = "pickedColor_"+depth+"_"+donePickerInits[depth];

	toolbarShow[oid] = 0;
	if(callFunc)
		doExtraPickerCMD[oid] = callFunc;

	donePickerInits[depth]++;
}
