function validateform(){  
	var name= document.myform.name.value;
	var age= document.myform.age.value;
	var phone= document.myform.phone.value;
	var email= document.myform.email.value;
	var country= document.myform.country.value;
	var qual= document.myform.qual.value;
	var minsalary= document.myform.minsalary.value;
	var exp= document.myform.exp.value;
	var skills= document.myform.skills.value;
	var technicalskills= document.myform.technicalskills.value;
	  
	if (name==null || name==""){
	  //alert("Name can't be blank");
		document.getElementById('Name').style.borderColor="red";
	  return false;
	}
	if (age==null || age==""){
		 // alert("Age can't be blank");
			document.getElementById('age').style.borderColor="red";
		  return false;
	}
	if (phone==null || phone==""){
		  //alert("phone number can't be blank");
			document.getElementById('phone').style.borderColor="red";
		  return false;
	}
	if (email==null || email==""){
		  //alert("email can't be blank");
			document.getElementById('email').style.borderColor="red";
		  return false;
	}
	if (country==null || country==""){
		  //alert("country can't be blank");
			document.getElementById('country').style.borderColor="red";
		  return false;
	}
	if (qual==null || qual==""){
		  //alert("qualilification can't be blank");
			document.getElementById('qual').style.borderColor="red";
		  return false;
	}
	else return true;
}