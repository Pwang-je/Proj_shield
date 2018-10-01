<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<STYLE type="text/css">
</
script>body {
	font-family: Arial;
}

a {
	color: #00f;
	text-decoration: none;
}


div {
	display: none;
}
</STYLE>

<SCRIPT type="text/javascript">

function tryit(Array){
			document.getElementById("table1").innerHTML += "<tr>";

	    for(var i=0; i<Array.length; i++) {
	    	if(i==0){
	    	Array[0] = Array[0].charAt(0).toUpperCase() + Array[0].substr(1);
	        document.getElementById("table1").innerHTML += "<td style='font-weight:bold'>" + Array[0] + "</td><td>"
	    	} else if(i<Array.length-1 && i>0){
	    	document.getElementById("table1").innerHTML +=  Array[i] + ", "
	    	} else{
	    	document.getElementById("table1").innerHTML +=  Array[i] + "</td></tr>"
	    	}
	    }
	}

	function listbox_move(listID, direction) {
		var listbox = document.getElementById(listID);
		var selIndex = listbox.selectedIndex;
		if (-1 == selIndex) {
			alert("Please select an option to move.");
			return;
		}
		var increment = -1;
		if (direction == 'up')
			increment = -1;
		else
			increment = 1;
		if ((selIndex + increment) < 0
				|| (selIndex + increment) > (listbox.options.length - 1)) {
			return;
		}

		var selValue = listbox.options[selIndex].value;
		var selText = listbox.options[selIndex].text;
		listbox.options[selIndex].value = listbox.options[selIndex + increment].value;
		listbox.options[selIndex].text = listbox.options[selIndex + increment].text;
		listbox.options[selIndex + increment].value = selValue;
		listbox.options[selIndex + increment].text = selText;
		listbox.selectedIndex = selIndex + increment;
	}

	function listbox_moveacross(sourceID, destID) {
		var src = document.getElementById(sourceID);
		var dest = document.getElementById(destID);

		var picked1 = false;
		for (var count = 0; count < src.options.length; count++) {
			if (src.options[count].selected == true) {
				picked1 = true;
			}
		}

		if (picked1 == false) {
			alert("Please select an option to move.");
			return;
		}

		for (var count = 0; count < src.options.length; count++) {
			if (src.options[count].selected == true) {
				var option = src.options[count];
				var newOption = document.createElement("option");
				newOption.value = option.value;
				newOption.text = option.text;
				newOption.selected = true;
				try {
					dest.add(newOption, null);
					src.remove(count, null);
				} catch (error) {
					dest.add(newOption);
					src.remove(count);
				}
				count--;
			}
		}
	}

	function listbox_selectall(listID, isSelect) {
		var listbox = document.getElementById(listID);
		for (var count = 0; count < listbox.options.length; count++) {
			listbox.options[count].selected = isSelect;
		}
	}
	

		
	var array1 = [];
	var array2 = [];
	var array3 = [];
	var array4 = [];
	var array5 = [];

	//for(i = 1; i < 6; i++){
	// array[i]= new Array();
	//}
	function storeValue(listID){
		if(listID =="d1"){
		var options = document.getElementById(listID).options;
		var selectedItems_enh;
		 for (var i = 0; i < options.length; i++) {
             if (options[i].selected == true) {
                 if (selectedItems_enh) {
                     selectedItems_enh = selectedItems_enh + ";" + options[i].text;
                 }
                 else {
                     selectedItems_enh = "enhancement;" +  options[i].text;
                 }
             }
		}
		 //alert(selectedItems_enh);
		 if(array1 != null){
		 array1 = selectedItems_enh.split(';');
		 for (var i = 0; i < array1.length; i++) {
			 array1[i]= array1[i].replace(" ","_");
		 }
		 }else{
			 array1= null;
		 }
		 //alert(array1);

		} else if(listID =="d2"){
			var options = document.getElementById(listID).options;
			var selectedItems_emi;
			 for (var i = 0; i < options.length; i++) {
	             if (options[i].selected == true) {
	                 if (selectedItems_emi) {
	                     selectedItems_emi = selectedItems_emi + ";" + options[i].text;
	                 }
	                 else {
	                     selectedItems_emi = "emission;" +options[i].text;
	                 }
	             }
			}
			 //alert(selectedItems_emi);
			  if(array2 != null){
			 array2 = selectedItems_emi.split(';');
			 for (var i = 0; i < array2.length; i++) {
			 	array2[i]= array2[i].replace(' ', '_');
			 }
			  }else{
				  array2= null;
			  }
		}else if(listID =="d3"){
			var options = document.getElementById(listID).options;
			var selectedItems_man;
			 for (var i = 0; i < options.length; i++) {
	             if (options[i].selected == true) {
	                 if (selectedItems_man) {
	                     selectedItems_man = selectedItems_man + ";" + options[i].text;
	                 }
	                 else {
	                     selectedItems_man ="manipulation;" + options[i].text;
	                 }
	             }
			}
			 if(array3 != null){
			 array3 = selectedItems_man.split(';');
			 for (var i = 0; i < array3.length; i++) {
			 	array3[i]= array3[i].replace(' ', '_');
			 }
			 }else{
				 array3 = null;
			 }
		}else if(listID =="d4"){
			var options = document.getElementById(listID).options;
			var selectedItems_tra;
			 for (var i = 0; i < options.length; i++) {
	             if (options[i].selected == true) {
	                 if (selectedItems_tra) {
	                     selectedItems_tra = selectedItems_tra + ";" + options[i].text;
	                 }
	                 else {
	                     selectedItems_tra = "transformation;" +options[i].text;
	                 }
	             }
			}
			 if(array4 != null){
			 array4 = selectedItems_tra.split(';');
			 for (var i = 0; i < array4.length; i++) {
				 array4[i]= array4[i].replace(' ', '_');
			 }
			 }else{
				 array4 = null;
			 }
		
		}else{
			var options = document.getElementById(listID).options;
			var selectedItems_psi;
			 for (var i = 0; i < options.length; i++) {
	             if (options[i].selected == true) {
	                 if (selectedItems_psi) {
	                     selectedItems_psi = selectedItems_psi + ";" + options[i].text;
	                 }
	                 else {
	                     selectedItems_psi = "psionic;" +options[i].text;
	                 }
	             }
			}
			 if(array5 != null){
			 array5 = selectedItems_psi.split(';');
			 for (var i = 0; i < array5.length; i++) {
			 array5[i]= array5[i].replace(' ', '_');
			 }
			 }else{
				 array5 =null;
			 }
		}
	}
	
	function print(a1, a2, a3, a4, a5){
		var arrays = [a1, a2, a3, a4, a5];
		var list;
		for(var i = 0; i < arrays.length; i++) {
			    var array = arrays[i];
			    console.log(array)
			    array = array.slice(1, array.length);
			    for(var j = 0; j < array.length; j++) {
			    list += array[j] + "              ";
			    }
			}
		list = list.slice(9, list.length);
		opener.document.insertFrm.powerlist.value = list; //opener: 이파일을 부른 파일 (여기서는 register.jsp)
		console.log(list);
		window.close();
	}
		
	

	function goEmission() {
		document.getElementById("power1").style.display = "none";
		document.getElementById("power2").style.display = "block";
	}

	function goManipulation() {
		document.getElementById("power2").style.display = "none";
		document.getElementById("power3").style.display = "block";
	}

	function goTransformation() {
		document.getElementById("power3").style.display = "none";
		document.getElementById("power4").style.display = "block";
	}

	function goPsionic() {
		document.getElementById("power4").style.display = "none";
		document.getElementById("power5").style.display = "block";
	}

	function goConfirmPage() {
		document.getElementById("power5").style.display = "none";
		document.getElementById("confirm").style.display = "block";
	}

	function backEnhance() {
		document.getElementById("power1").style.display = "block";
		document.getElementById("power2").style.display = "none";
	}

	function backEmission() {
		document.getElementById("power2").style.display = "block";
		document.getElementById("power3").style.display = "none";
	}

	function backManipulation() {
		document.getElementById("power3").style.display = "block";
		document.getElementById("power4").style.display = "none";
	}

	function backTransformation() {
		document.getElementById("power4").style.display = "block";
		document.getElementById("power5").style.display = "none";
	}

	function backPsionic() {
		document.getElementById("power5").style.display = "block";
		document.getElementById("confirm").style.display = "none";
	}
</SCRIPT>

<TITLE>Listbox JavaScript functions</TITLE>

</HEAD>

<BODY>
	<div id="power1" style="display: block">


		<table border="1" align="center" style="border-collapse: collapse;">
			<tr>
				<td colspan="3" align="center"><font size="+2"><b>Power
							Type: Enhancement</b></font></td>
			</tr>
			<tr valign="top">

				<th colspan="3">
			<tr>
				<td>Not Added</td>
				<td></td>
				<td>Added</td>
				</th>
			</tr>
			<tr valign="top">

				<td><SELECT id="s1" size="10" multiple>
						<OPTION value="a">Agility</OPTION>
						<OPTION value="b">Dimensional Awareness</OPTION>
						<OPTION value="c">Cold Resistance</OPTION>
						<OPTION value="d">Durability</OPTION>
						<OPTION value="e">Flight</OPTION>
						<OPTION value="f">Danger Sense</OPTION>
						<OPTION value="g">Underwater breathing</OPTION>
						<OPTION value="h">Power Augmentation</OPTION>
						<OPTION value="i">Animal Attributes</OPTION>
						<OPTION value="j">Longevity</OPTION>
						<OPTION value="k">Intelligence</OPTION>
						<OPTION value="l">Super Strength</OPTION>
						<OPTION value="m">Stamina</OPTION>
						<OPTION value="n">Dexterity</OPTION>
						<OPTION value="o">Super Speed</OPTION>
						<OPTION value="p">Animal Oriented Powers</OPTION>
						<OPTION value="q">Death Touch</OPTION>
						<OPTION value="r">Enhanced Senses</OPTION>
						<OPTION value="s">Hyperkinesis</OPTION>
						<OPTION value="t">Jump</OPTION>
						<OPTION value="u">Clairvoyance</OPTION>
						<OPTION value="v">Peak Human Condition</OPTION>
						<OPTION value="w">Immortality</OPTION>
						<OPTION value="x">Enhanced Memory</OPTION>
						<OPTION value="y">Reflexes</OPTION>
						<OPTION value="z">Invulnerability</OPTION>
						<OPTION value="aa">Self-Sustenance</OPTION>
						<OPTION value="bb">Photographic Reflexes</OPTION>
						<OPTION value="cc">Seismic Power</OPTION>
						<OPTION value="dd">Enhanced Hearing</OPTION>
						<OPTION value="ee">Nova Force</OPTION>
						<OPTION value="ff">Enhanced Sight</OPTION>
						<OPTION value="gg">Adaptation</OPTION>
						<OPTION value="hh">Gliding</OPTION>
						<OPTION value="ii">Echolocation</OPTION>
						<OPTION value="jj">Levitation</OPTION>
						<OPTION value="kk">Heat Resistance</OPTION>
						<OPTION value="ll">Fire Resistance</OPTION>
						<OPTION value="mm">Enhanced Smell</OPTION>
						<OPTION value="nn">Omnipotent</OPTION>
						<OPTION value="oo">Power Cosmic</OPTION>
						<OPTION value="pp">Radiation Immunity</OPTION>
						<OPTION value="qq">Vision - Telescopic</OPTION>
						<OPTION value="rr">Toxin and Disease Resistance</OPTION>
						<OPTION value="ss">Energy Resistance</OPTION>
						<OPTION value="tt">Omnilingualism</OPTION>
						<OPTION value="uu">Sonar</OPTION>
						<OPTION value="vv">Enhanced Touch</OPTION>
						<OPTION value="ww">Sub-Mariner</OPTION>
						<OPTION value="xx">Intuitive aptitude</OPTION>
						<OPTION value="yy">Vision - Microscopic</OPTION>
						<OPTION value="zz">Wallcrawling</OPTION>
						<OPTION value="aaa">Vision - Night</OPTION>
						<OPTION value="bbb">Vision - Infrared</OPTION>
						<OPTION value="ccc">Vision - Heat</OPTION>
						<OPTION value="ddd">Radar Sense</OPTION>
						<OPTION value="eee">Radar Sense</OPTION>
						<OPTION value="fff">Vision - X-Ray</OPTION>
						<OPTION value="ggg">Vision - Thermal</OPTION>
						<OPTION value="hhh">Odin Force</OPTION>
						<OPTION value="iii">Speed Force</OPTION>
						<OPTION value="jjj">Phoenix Force</OPTION>
						<OPTION value="kkk">Vision - Cryo</OPTION>
						<OPTION value="lll">Omnipresent</OPTION>
						<OPTION value="mmm">Omniscient</OPTION>
				</SELECT></td>
				<td valign="middle"><a href="#"
					onclick="listbox_moveacross('s1', 'd1')">►</a> <br /> <a href="#"
					onclick="listbox_moveacross('d1', 's1')">◄</a></td>
				<td><SELECT id="d1" name="selected1" size="10" multiple>

				</SELECT></td>
			</tr>

			<tr>
				<td>Move <a href="#" onclick="listbox_move('a', 'up')">▲ up</a>,
					<a href="#" onclick="listbox_move('a', 'down')">▼ dn</a>
				</td>
				<td></td>
				<td></td>

			</tr>

			<tr>


				<td>Select <a href="#" onclick="listbox_selectall('s1', true)">all</a>,
					<a href="#" onclick="listbox_selectall('s1', false)">none</a>
				</td>
				<td></td>
				<td>Select <a href="#" onclick="listbox_selectall('d1', true)">all</a>,
					<a href="#" onclick="listbox_selectall('d1', false)">none</a>

				</td>
			</tr>

			<tr>
				<td colspan="3"><input type="button" value="Next"
					onclick="javascript:goEmission(); storeValue('d1')" style="width: 100%"> <input
					type="button" value="Exit" onclick="window.close()"
					style="width: 100%"></td>
			</tr>

		</table>
	</div>



	<div id="power2">



			<table border="1" align="center" style="border-collapse: collapse;">
				<tr>
					<td colspan="3" align="center"><font size="+2"><b>Power
								Type: Emission</b></font></td>
				</tr>
				<tr valign="top">

					<th colspan="3">
				<tr>
					<td>Not Added</td>
					<td></td>
					<td>Added</td>
					</th>
				</tr>
				<tr valign="top">
					<td><SELECT id="s2" size="10" multiple>
							<OPTION value="a">Energy Blasts</OPTION>
							<OPTION value="b">Energy Beams</OPTION>
							<OPTION value="c">Energy Constructs</OPTION>
							<OPTION value="d">Force Fields</OPTION>
							<OPTION value="e">Substance Secretion</OPTION>
							<OPTION value="f">Heat Generation</OPTION>
							<OPTION value="g">Illumination</OPTION>
							<OPTION value="h">Sonic Scream</OPTION>
							<OPTION value="i">Super Breath</OPTION>
							<OPTION value="j">Web Creation</OPTION>
							<OPTION value="k">Symbiote Costume</OPTION>

					</SELECT></td>
					<td valign="middle"><a href="#"
						onclick="listbox_moveacross('s2', 'd2')">►</a> <br /> <a href="#"
						onclick="listbox_moveacross('d2', 's2')">◄</a></td>
					<td><SELECT id="d2" name="selected2" size="10" multiple>
					</SELECT></td>
				</tr>

				<tr>
					<td>Move <a href="#" onclick="listbox_move('a', 'up')">▲
							up</a>, <a href="#" onclick="listbox_move('a', 'down')">▼ dn</a>
					</td>
					<td></td>
					<td></td>

				</tr>

				<tr>


					<td>Select <a href="#" onclick="listbox_selectall('s2', true)">all</a>,
						<a href="#" onclick="listbox_selectall('s2', false)">none</a>
					</td>
					<td></td>
					<td>Select <a href="#" onclick="listbox_selectall('d2', true)">all</a>,
						<a href="#" onclick="listbox_selectall('d2', false)">none</a>

					</td>
				</tr>

				<tr>
					<td colspan="3"><input type="button" value="Next"
						onclick="javascript:goManipulation(); storeValue('d2')" style="width: 100%">
						<input type="button" value="Back"
						onclick="javascript:backEnhance()" style="width: 100%"></td>
				</tr>

			</table>

	
	</div>

	<div id="power3">




			<table border="1" align="center" style="border-collapse: collapse;">
				<tr>
					<td colspan="3" align="center"><font size="+2"><b>Power
								Type: Manipulation</b></font></td>
				</tr>
				<tr valign="top">

					<th colspan="3">
				<tr>
					<td>Not Added</td>
					<td></td>
					<td>Added</td>
					</th>
				</tr>
				<tr valign="top">
					<td><SELECT id="s3" size="10" multiple>
							<OPTION value="a">Accelerated Healing</OPTION>
							<OPTION value="b">Lantern Power Ring</OPTION>
							<OPTION value="c">Energy Absorption</OPTION>
							<OPTION value="d">Marksmanship</OPTION>
							<OPTION value="e">Weapons Master</OPTION>
							<OPTION value="f">Cryokinesis</OPTION>
							<OPTION value="g">Density Control</OPTION>
							<OPTION value="h">Audio Control</OPTION>
							<OPTION value="i">Weapon-based Powers</OPTION>
							<OPTION value="j">Electrokinesis</OPTION>
							<OPTION value="k">Darkforce Manipulation</OPTION>
							<OPTION value="l">Telekinesis Magic</OPTION>
							<OPTION value="m">Element Control</OPTION>
							<OPTION value="n">Fire Control</OPTION>
							<OPTION value="o">Summoning</OPTION>
							<OPTION value="p">Anti-Gravity</OPTION>
							<OPTION value="q">Power Nullifier</OPTION>
							<OPTION value="r">Radiation Control</OPTION>
							<OPTION value="s">Animation</OPTION>
							<OPTION value="t">Power Absorption</OPTION>
							<OPTION value="u">Animal Control</OPTION>
							<OPTION value="v">Molecular Manipulation</OPTION>
							<OPTION value="w">Power Suit</OPTION>
							<OPTION value="x">Probability Manipulation</OPTION>
							<OPTION value="y">Gravity Control</OPTION>
							<OPTION value="z">Light Control</OPTION>
							<OPTION value="aa">Toxin and Disease Control</OPTION>
							<OPTION value="bb">Energy Manipulation</OPTION>
							<OPTION value="cc">Natural Weapons</OPTION>
							<OPTION value="dd">Time Travel</OPTION>
							<OPTION value="ee">Thirstokinesis</OPTION>
							<OPTION value="ff">Hair Manipulation</OPTION>
							<OPTION value="gg">Biokinesis</OPTION>
							<OPTION value="hh">Water Control</OPTION>
							<OPTION value="ii">Molecular Combustion</OPTION>
							<OPTION value="jj">Portal Creation</OPTION>
							<OPTION value="kk">Magnetism</OPTION>
							<OPTION value="ll">Plant Control</OPTION>
							<OPTION value="mm">Time Manipulation</OPTION>
							<OPTION value="nn">Magic Resistance</OPTION>
							<OPTION value="oo">Radiation Absorption</OPTION>
							<OPTION value="pp">Melting</OPTION>
							<OPTION value="qq">Wind Control</OPTION>
							<OPTION value="rr">Grim Reaping</OPTION>
							<OPTION value="ss">Matter Absorption</OPTION>
							<OPTION value="tt">The Force</OPTION>
							<OPTION value="uu">Terrakinesis</OPTION>
							<OPTION value="vv">Vitakinesis</OPTION>
							<OPTION value="ww">Qwardian Power Ring</OPTION>
							<OPTION value="xx">Weather Control</OPTION>
							<OPTION value="yy">Reality Warping</OPTION>
							<OPTION value="zz">Molecular Dissipation</OPTION>


					</SELECT></td>
					<td valign="middle"><a href="#"
						onclick="listbox_moveacross('s3', 'd3')">►</a> <br /> <a href="#"
						onclick="listbox_moveacross('d3', 's3')">◄</a></td>
					<td><SELECT id="d3" name="selected3" size="10" multiple>
					</SELECT></td>
				</tr>

				<tr>
					<td>Move <a href="#" onclick="listbox_move('a', 'up')">▲
							up</a>, <a href="#" onclick="listbox_move('a', 'down')">▼ dn</a>
					</td>
					<td></td>
					<td></td>

				</tr>

				<tr>


					<td>Select <a href="#" onclick="listbox_selectall('s3', true)">all</a>,
						<a href="#" onclick="listbox_selectall('s3', false)">none</a>
					</td>
					<td></td>
					<td>Select <a href="#" onclick="listbox_selectall('d3', true)">all</a>,
						<a href="#" onclick="listbox_selectall('d3', false)">none</a>

					</td>
				</tr>

				<tr>
					<td colspan="3"><input type="button" value="Next"
						onclick="javascript:goTransformation(); storeValue('d3')" style="width: 100%">
						<input type="button" value="Back"
						onclick="javascript:backEmission()" style="width: 100%"></td>
				</tr>

			</table>

	</div>
	<div id="power4">




			<table border="1" align="center" style="border-collapse: collapse;">
				<tr>
					<td colspan="3" align="center"><font size="+2"><b>Power
								Type: Transformation</b></font></td>
				</tr>
				<tr valign="top">

					<th colspan="3">
				<tr>
					<td>Not Added</td>
					<td></td>
					<td>Added</td>
					</th>
				</tr>
				<tr valign="top">
					<td><SELECT id="s4" size="10" multiple>
							<OPTION value="a">Stealth</OPTION>
							<OPTION value="b">Energy Armor</OPTION>
							<OPTION value="c">Duplication</OPTION>
							<OPTION value="d">Size Changing</OPTION>
							<OPTION value="e">Astral Travel</OPTION>
							<OPTION value="f">Omnitrix</OPTION>
							<OPTION value="g">Dimensional Travel</OPTION>
							<OPTION value="h">Shapeshifting</OPTION>
							<OPTION value="i">Camouflage</OPTION>
							<OPTION value="j">Phasing</OPTION>
							<OPTION value="k">Electrical Transport</OPTION>
							<OPTION value="l">Elasticity</OPTION>
							<OPTION value="m">Elemental Transmogrification</OPTION>
							<OPTION value="n">Natural Armor</OPTION>
							<OPTION value="o">Intangibility</OPTION>
							<OPTION value="p">Regeneration</OPTION>
							<OPTION value="q">Banish</OPTION>
							<OPTION value="r">Cloaking</OPTION>
							<OPTION value="s">Changing Armor</OPTION>
							<OPTION value="t">Invisibility</OPTION>
							<OPTION value="u">Resurrection</OPTION>

					</SELECT></td>
					<td valign="middle"><a href="#"
						onclick="listbox_moveacross('s4', 'd4')">►</a> <br /> <a href="#"
						onclick="listbox_moveacross('d4', 's4')">◄</a></td>
					<td><SELECT id="d4" name="selected4" size="10" multiple>
					</SELECT></td>
				</tr>

				<tr>
					<td>Move <a href="#" onclick="listbox_move('a', 'up')">▲
							up</a>, <a href="#" onclick="listbox_move('a', 'down')">▼ dn</a>
					</td>
					<td></td>
					<td></td>

				</tr>

				<tr>


					<td>Select <a href="#" onclick="listbox_selectall('s4', true)">all</a>,
						<a href="#" onclick="listbox_selectall('s4', false)">none</a>
					</td>
					<td></td>
					<td>Select <a href="#" onclick="listbox_selectall('d4', true)">all</a>,
						<a href="#" onclick="listbox_selectall('d4', false)">none</a>

					</td>
				</tr>

				<tr>
					<td colspan="3"><input type="button" value="Next"
						onclick="javascript:goPsionic(); storeValue('d4')" style="width: 100%"> <input
						type="button" value="Back" onclick="javascript:backManipulation()"
						style="width: 100%"></td>
				</tr>

			</table>
	</div>
	<div id="power5">


			<table border="1" align="center" style="border-collapse: collapse;">
				<tr>
					<td colspan="3" align="center"><font size="+2"><b>Power
								Type: Psionic</b></font></td>
				</tr>
				<tr valign="top">

					<th colspan="3">
				<tr>
					<td>Not Added</td>
					<td></td>
					<td>Added</td>
					</th>
				</tr>
				<tr valign="top">
					<td><SELECT id="s5" size="10" multiple>
							<OPTION value="a">Telepathy</OPTION>
							<OPTION value="b">Possession</OPTION>
							<OPTION value="c">Teleportation</OPTION>
							<OPTION value="d">Power Sense</OPTION>
							<OPTION value="e">Astral Projection</OPTION>
							<OPTION value="f">Projection</OPTION>
							<OPTION value="g">Empathy</OPTION>
							<OPTION value="h">Psionic Powers</OPTION>
							<OPTION value="i">Technopath/Cyberpath</OPTION>
							<OPTION value="j">Precognition</OPTION>
							<OPTION value="k">Mind Control</OPTION>
							<OPTION value="l">Insanity</OPTION>
							<OPTION value="m">Hypnokinesis</OPTION>
							<OPTION value="n">Mind Blast</OPTION>
							<OPTION value="o">Illusions</OPTION>
							<OPTION value="p">Spatial Awareness</OPTION>
							<OPTION value="q">Telepathy Resistance</OPTION>
							<OPTION value="r">Mind Control Resistance</OPTION>

					</SELECT></td>
					<td valign="middle"><a href="#"
						onclick="listbox_moveacross('s5', 'd5')">►</a> <br /> <a href="#"
						onclick="listbox_moveacross('d5', 's5')">◄</a></td>
					<td><SELECT id="d5" name="selected5" size="10" multiple>
					</SELECT></td>
				</tr>

				<tr>
					<td>Move <a href="#" onclick="listbox_move('a', 'up')">▲
							up</a>, <a href="#" onclick="listbox_move('a', 'down')">▼ dn</a>
					</td>
					<td></td>
					<td></td>

				</tr>

				<tr>


					<td>Select <a href="#" onclick="listbox_selectall('s5', true)">all</a>,
						<a href="#" onclick="listbox_selectall('s5', false)">none</a>
					</td>
					<td></td>
					<td>Select <a href="#" onclick="listbox_selectall('d5', true)">all</a>,
						<a href="#" onclick="listbox_selectall('d5', false)">none</a>

					</td>
				</tr>

				<tr>
					<td colspan="3"><input type="button" value="Next"
						onclick="javascript: goConfirmPage(); storeValue('d5'); tryit(array1); tryit(array2); tryit(array3); tryit(array4); tryit(array5)" style="width: 100%">
						<input type="button" value="Back"
						onclick="javascript:backTransformation()" style="width: 100%">
					</td>
				</tr>

			</table>

	</div>

	<div id="confirm">
	**CONFIRM PAGE**
<form action="powerproc_m.jsp?flag=insert" enctype="multipart/form-data"
		name="inspwrFrm" method="post">
	<input type="hidden">
<table id="table1">

</table>
<input type="button" value="Confirm" onclick="javasript:print(array1, array2, array3, array4, array5)">
</Form>



	</div>

</body>
</HTML>