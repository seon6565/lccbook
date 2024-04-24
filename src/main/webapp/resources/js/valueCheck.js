//
// function errorMessage(errors){
// 	const result = {};
// 	for(let err in errors) {
// 		if (document.getElementById("div_err_"+err.getField()) != null) {
// 			document.getElementById("div_err_"+err.getField()).innerHTML = "<span style='color:red'>해당 영역은 필수 입력입니다."
// 			document.getElementById("div_err_"+err.getField()).style.display = "block"
// 		}
// 		result['${err.getField()}'] = '${err.defaultMessage}';
// 	}
// 	console.log(result);
// }
function checkInputId(id,textid,okflagid){

	document.getElementById(okflagid).value="0";
	let Check = document.getElementById(id);
	let Char = "";
	if(Check.value!=null) {
		Char = Check.value;
	}
	let text = document.getElementById(textid);
	const regex = /^[A-Za-z0-9]{5,15}$/;
	if(regex.test(Char)){
		 text.style.display = "none";
	}
	else{
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	//중복검사
	return true;
}

function idduplecheck(id,errordisplayId,okflagid,servletUrl){
	let checkid = document.getElementById(id);
	const xhr = new XMLHttpRequest();
	xhr.open("get",servletUrl+"?user_id="+checkid.value);
	xhr.send();
	xhr.onload = function (){
		if(xhr.status==200){
			if(xhr.response == "N"){
				document.getElementById(errordisplayId).style.display = "block";
				document.getElementById(okflagid).value="0";
				alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
			}
			else{
				document.getElementById(errordisplayId).style.display = "none"
				document.getElementById(okflagid).value="1";
				alert("중복 아이디가 없습니다.");
			}
		}
	}
}
function checkInputPw(id,textid){
let Check = document.getElementById(id);
let Char = Check.value;
let text = document.getElementById(textid);
const regex = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,16}$/;
if(regex.test(Char)){
	 text.style.display = "none";
}
else{
	text.style.display = "block";
	Check.focus();
	return false;
	event.preventDefault();
}
return true;
}

function checkInputPw2(id,id2,textid){
let Check = document.getElementById(id);
let Check2 = document.getElementById(id2);
let Char = Check.value;
let Char2 = Check2.value;
let text = document.getElementById(textid);
const regex = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,16}$/
if(regex.test(Char2)&& Char==Char2){
	 text.style.display = "none";
}
else{
	text.style.display = "block";
	Check2.focus();
	return false;
	event.preventDefault();
}
return true;
}

function checkInputName(id,textid){
	let Check = document.getElementById(id);
	let Char = Check.value;
	let text = document.getElementById(textid);
	const regex = /^[가-힣A-Za-z]{1,10}$/;
	if(regex.test(Char)){
		text.style.display = "none";
	}
	else{
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	return true;
}

function checkInputBirth(id,textid){
	let Check = document.getElementById(id);
	let Char = Check.value;
	let text = document.getElementById(textid);
	let now = Date.now();
	let input = new Date(Char)
	const regex = /^[가-힣]{1,5}$/;
	if(now>input){
		text.style.display = "none";
	}
	else{
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	return true;
}
function checkInputBirthFourteen(y,m,d,textid){
	const date1 = new Date(y,m,d);
	let text = document.getElementById(textid);
   	let year = document.getElementById(y);
   	let month = document.getElementById(m);
   	let day = document.getElementById(m);
   	let Char = year.value;
   	let Char2 = month.value;
   	let Char3 = day.value;
   	
	if((Char==0 && Char2==0&& Char3==0)){
		text.style.display = "block";
		year.focus();
		return false;
		event.preventDefault();
	}
	else{
       	let birthday = new Date(Char,Char2,Char3);
       	let now = new Date();
       	let dd = String(now.getDate()).padStart(2, '0');
       	let mm = String(now.getMonth() + 1).padStart(2, '0');
       	let yyyy = now.getFullYear();
       	let nowYMD = yyyy + '-' + mm + '-' + dd;
       	let today = new Date(nowYMD);
       	let years = today.getFullYear() - birthday.getFullYear();
       	birthday.setFullYear(today.getFullYear());
       	if (today < birthday)
       	{
       	    years--;
       	}
       	if(years>=14){
       	text.style.display = "none";
       	}
       	else{
       	text.style.display = "block";
		year.focus();
		return false;
		event.preventDefault();
       	}
	}
   	return true;
}

function checkInputPhone(id,textid){
	let Check = document.getElementById(id);
	let Char = Check.value;
	let text = document.getElementById(textid);
	const regex = /\d{2,3}-\d{3,4}-\d{4}/g
	if(regex.test(Char)){
		 text.style.display = "none";
	}
	else{
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	return true;
	}

	function checkInputEmail(id,textid){
		let Check = document.getElementById(id);
		let Char = Check.value;
		let text = document.getElementById(textid);
		const regex = /[@]*[.]/;
		if(regex.test(Char)){
			 text.style.display = "none";
		}
		else{
			text.style.display = "block";
			Check.focus();
			return false;
			event.preventDefault();
		}
		return true;
}


function checkInputInterest(id,id2,textid){
	let Check = document.getElementById(id);
	let Check2 = document.getElementById(id2);
	
	let Char = Check.value;
	let Char2 = Check2.value;
	console.log(Char,Char2);
	let text = document.getElementById(textid);
	if((Char==0 && Char2==0)){
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	else{
		text.style.display = "none";
	}
	return true;
}
function checkInputCheckBox(id,textid){
	let Check = document.getElementById(id);
	let text = document.getElementById(textid);
	if(Check.checked==true){
		 text.style.display = "none";
	}
	else{
		text.style.display = "block";
		Check.focus();
		return false;
		event.preventDefault();
	}
	return true;
}
function checklast(user_id,div_err_user_id,pwd,div_err_pwd,name,div_err_name,email,div_err_email,brithday,div_err_brithday,okflagid){
	if(checkInputPw(pwd,div_err_pwd)&&checkInputName(name,div_err_name)&&checkInputEmail(email,div_err_email)&&
		checkInputBirth(brithday,div_err_brithday)){
		if(document.getElementById(okflagid).value >0) {
			if(checkInputId(user_id,div_err_user_id,okflagid)) {
				alert("가입되었습니다.");
			}
			else{
				alert("아이디는 5~15자내의 숫자,영어만 입력하세요.");
				event.preventDefault();
			}
		}
		else{
			alert("아이디 중복 체크를 진행해주세요.");
			event.preventDefault();
		}
	}
	else{
		alert("조건에 맞게 수정해주세요.");
		event.preventDefault();
	}
}
// function checklast(iname,idn,password,password2,selectborn1,selectborn2,selectborn3,telnumber,email,interest1,interest2,
// cc1,cc2,textid,textid2,textid3,textid4,textid5,textid6,textid7,textid8,textid9,textid10,hiddenFlagId){
// 	if(checkInputIname(iname,textid)&& checkInputIdn(idn,textid2)&& checkInputPw(password,textid3) && checkInputPw2(password,password2,textid4)
// 			&&checkInputbirth(selectborn1,selectborn2,selectborn3,textid5) && checkInputPhone(telnumber,textid6)&& checkInputEmail(email,textid7)
// 			&&checkInputinterest(interest1,interest2,textid8)&& checkInputcc(cc1,textid9) && checkInputcc(cc2,textid10)){
// 		let result = document.getElementById(hiddenFlagId).value;
//    		if(result==1){
//    			alert("가입되었습니다.");
//    		}
// 	}
// 	else{
// 		alert("조건에 맞게 수정해주세요.");
// 		event.preventDefault();
// 	}
//
// }

