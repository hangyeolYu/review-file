function inputCheck () {
    // 모든 입력 데이터가 입력받아야만 회원가입 가능
    if(document.regForm.id.value==""){
        alert("아이디를 입력해 주세요");
        document.regForm.id.focus();
        return;
    }

    if(document.regForm.pwd.value==""){
        alert("비밀번호를 입력해 주세요");
        document.regForm.pwd.focus();
        return;
    }
    if(document.regForm.repwd.value==""){
        alert("비밀번호를 입력해 주세요");
        document.regForm.repwd.focus();
        return;
    }
    if(document.regForm.name.value==""){
        alert("이름을 입력해 주세요");
        document.regForm.name.focus();
        return;
    }
    if(document.regForm.birthday.value==""){
        alert("생년월일을 입력해 주세요");
        document.regForm.birthday.focus();
        return;
    }
    if(document.regForm.email.value==""){
        alert("이메일을 입력해 주세요");
        document.regForm.email.focus();
        return;
    }
    //데이터 형식 맞는지
    if(document.regForm.pwd.value.length<8
    ||document.regForm.pwd.value.length>16 ){
        alert("비밀번호 길이 8~16 사이로 입력해주세요!");
        document.regForm.pwd.focus();
        return;
    }

    //생년월일 확인 (정규 표현식 확인)
    const reg_birth = /\d{4}-\d{2}-\d{2}/;
    if(document.regForm.birthday.value.search(reg_birth)==-1){
        alert("생년월일 형식이 맞지않습니다!");
        document.regForm.birthday.focus();
        return;
    }
    //이메일 정규표현식 확인
    const reg_email = /[A-Za-z0-9\-\.]+\@[A-Za-z0-9\-\.]+(\.[A-Za-z0-9]{2,3}){1,2}/ig;
    if(document.regForm.email.value.search(reg_email)==-1){
        //serch 가 되면 그 인덱스 반환 없으면 -1 반환
        alert("이메일 형식에 맞게 입력해주세요!");
        document.reForm.email.focus();
        return;

    }

    document.regForm.submit();
    //if 문 전부다 통과!

}