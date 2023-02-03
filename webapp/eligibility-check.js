	var request;
	function sendInfo() {
		var v = document.vform.name.value;
		var url = "FetchData.jsp?val=" + v;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			console.log("Unable to connect to server", e);
		}
	}
	function getInfo() {
		if (request.readyState == 4) {
			var val = JSON.parse(request.responseText);
			document.getElementById("nameinfo").innerHTML = val.Name;
			document.getElementById("genderinfo").innerHTML = val.gender;
			document.getElementById("ageinfo").innerHTML = val.age;
			document.getElementById("emailinfo").innerHTML = val.email;
			document.getElementById("countryinfo").innerHTML = val.country;
			document.getElementById("qualinfo").innerHTML = val.qualification;
			document.getElementById("workplaceinfo").innerHTML = val.workplace;
			document.getElementById("salinfo").innerHTML = val.minsalary;
			document.getElementById("expinfo").innerHTML = val.experience;
			document.getElementById("skillinfo").innerHTML = val.skills;
			document.getElementById("techskillinfo").innerHTML = val.technicalskills;
		}
	}

	function selectJobpost(event) {
		document.getElementById("selected_jobpost").value = event.innerHTML;
		document.getElementById("jobpost").innerHTML = event.innerHTML;
	}

	function sendJobtype() {
		var v = document.getElementById("selected_jobpost").value;
		var url = "Fetchfields.jsp?val2=" + v;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getJobtype;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			console.log("Unable to connect to server", e);
		}
	}

	function getJobtype() {
		if (request.readyState == 4) {
			var val2 = JSON.parse(request.responseText);
			document.getElementById("table").innerHTML = val2.table;
			document.getElementById('ElFormula').value = val2.formula ;
		}
	}
	var request;
	
	function formulaevaluate(event) {
		event.preventDefault();
		var name = document.vform.name.value;

		var formula = document.vform.ElFormula.value;
		var post = document.getElementById("selected_jobpost").value;

		var json = {
			"name" : name,
			"formula" : formula,
			"post" : post
		};
		var myJSON = JSON.stringify(json);

		var url = "GetNameJobFormula.jsp";

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {

			request.onreadystatechange = getText;
			request.open("POST", url, true);
			//var param = "myjson=" + myJSON;
			request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			request.send("strJson="+myJSON);
		} 
		catch (e) {
			alert("Unable to connect to server");
		}
	}

	const eligibleImage = document.getElementById("eligibleimg");
	function getText() {
		if (request.readyState == 4) {
			var element = document.getElementById('normalimg');
			if(element){
				element.parentNode.removeChild(element);
			}
			//	if(status == "success"){  
			//	var val = JSON.parse(request.responseText
			var val1 = request.responseText;
			//	const obj = JSON.parse(val);
			console.log("what is it"+ val1);
			var valll = val1.trim();
			if(valll==='true')
				{
				var img = document.createElement('img');
				img.src = './resources/img/yesss.jpg';
				img.style.width = "170px";
				img.style.height = "170px";
				var temp = document.getElementById('eligibleimg').replaceWith(img);
				}
			else
				{	
				var img = document.createElement('img');
				img.src = './resources/img/no.jpg';
				img.style.width = "170px";
				img.style.height = "170px";
				var temp = document.getElementById('eligibleimg').replaceWith(img);
				}

		}
	}