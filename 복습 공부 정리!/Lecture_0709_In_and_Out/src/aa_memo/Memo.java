package aa_memo;

public class Memo {
    /*
    [ IO (Input Output) 패키지 ]

- 데이터 입력 (Input): 사용자로부터 키보드 입력을 받거나
					파일로부터 데이터를 입력받을 수 있음
- 데이터 출력 (Output): 파일/모니터로 출력되어 저장할 수 있음
- 데이터를 하나의 스트림 (Stream)을 통해 입출력
cf) 스트림 (Stream): 데이터를 하나의 흐름으로 간주
(출발지 -> 도착지)


	● 입력 스트림 (Input Stream)
	: 프로그램을 기준으로 데이터가 들어옴
	ex) 엑셀에 저장되어있는 회원 정보를 들고 옴

	● 출력 스트림 (Output Stream)
	: 프로그램을 기준으로 데이터를 보냄
	ex) 회원 정보 중 30세 이상 회원만 뽑아서 엑셀에 저장함

	* 스트림은 단방향 (하나의 방향)
	=> 하나의 스트림으로 입출력을 모두 할 수 없음
	=> 입출력 스트림이 따로 필요함


	* 자바에서는 데이터 입출력을 위해 API를 java.io 제공
	ex) Input, Reader - 입력
	ex) Output, Writer - 출력


	● 스트림 클래스
	- 바이트 (byte) 기반
		: 문자/그림/동영상 등 모든 종류의 데이터 입출력 가능
		: InputStream (입력), OutputStream (출력)

	- 문자 (character) 기반
		: 문자만 입출력 가능
		: Reader (입력), Writer (출력)

	1) InputStream
	: 바이트 기반 입력 스트림 클래스

	InputStream > FileInputStream
				> BufferedInputStream
				> DataInputStream

	- 메소드
	a. int read()
	: 1바이트 읽음
	: 더이상 읽을 수 없으면 -1 리턴
	ex) 30바이트를 읽어야 함 ... => "반복문"

	while(read() != -1){...}


	b. int read(byte[] b)
	: b의 배열의 사이즈만큼 읽어서 b 배열에 저장
	: 주어진 배열 b에 저장하고 실제 읽은 바이트 수 리턴
	: 더이상 읽을 수 없으면 -1 리턴

	ex) b 배열의 사이즈가 100바이트고,
		읽어야하는 데이터의 용량이 550바이트
		100바이트 * 5번
		50바이트 * 1번
		=> 6번 반복함

	while(read(b) != -1){...}

	read() vs read(byte[] b)
	=> 누가 조금 반복할까요 ...?
	=> read(byte[] b)
	=> 많은 양의 바이트를 읽을 경우에는 read(byte[] b) 좋음


	c. int read(byte[] b, int off, int len)
	: 한 번에 len만큼 읽을 수 있음
	: 실제로 읽은 바이트 수만큼 리턴
	: 더이상 읽을 수 없다면 -1 리턴
	ex) 읽어야 하는 데이터 용량이 360바이트
		len => 100바이트

		100 * 3번
		60 * 1번

	: 배열에서 시작되는 인덱스를 off(set) 지정할 수 있음
	: read(byte[] b)와 동일해지려면 ..?
	: off: 0, len: b의 길이

	byte[] readBytes = new byte[360];
	read(readBytes, 0, 360);

	d. void close()
	: 사용한 시스템 자원 반납하고 입력 스트림 닫음


	2) OutputStream
	: 바이트 기반 출력 스트림

	OutputStream > FileOutputStream
				 > BufferedOutputStream
				 > DataOutputStream

	a. void write(int b)
	: 출력 스트림으로 1바이트 보냄

	OutputStream os
	= new FileOutputStream(File 위치);

	byte[] data = "ABC".getBytes();
	for(int i = 0; i < data.length; i ++){
		os.write(data[i]); // "A", "B", "C" 하나씩 출력
	}


	// 'A': 1바이트
	// '가': 2바이트

	b. void write(byte [] b)
	: 출력 스트림으로 주어진 바이트 배열 b의 모든 바이트를 보냄

	OutputStream os
	= new FileOutputStream(File 위치);

	byte[] data = "ABC".getBytes();
	os.write(data); // "ABC" 모두 출력

	c. void write(byte[] b, int off, int len)
	: 주어진 배열 b[off]부터 len개까지 바이트를 보냄

	OutputStream os
	= new FileOutputStream(File 위치);

	byte[] data = "ABC".getBytes();
	os.write(data, 1, 2); // "BC"만 모두 출력

	d. void flush()
	: 출력 스트림은 버퍼 (buffer)가 존재
	=> 데이터 출력 전에 버퍼 쌓여서 순서대로 출력
	: 버퍼에 잔류하는 모든 바이트를 출력 (버퍼 비워짐)

	e. void close()
	: 시스템 자원 반납 후 출력 스트림을 닫음
	: OutputStream을 더이상 사용하지 않을 경우 자원 풀어줌

	OutputStream os
	= new FileOutputStream(File 위치);

	byte[] data = "ABC".getBytes();
	os.write(data);
	os.flush(); // 버퍼에 잔류 데이터 지움
	os.close(); // 자원 반납


	3) Reader
	: 문자 기반 입력 스트림

	Reader > FileReader
		   > BufferedReader
		   > InputStreamReader


	a. int read()
	: 입력 스트림으로부터 한 개의 문자 (2bytes)를 읽음
	: 더 이상 읽을 수 없으면 -1 반환

	InputStream read() vs Reader read()
	1byte (바이트)		  2bytes (문자)

	Reader reader = new FileReader(File 위치);
	int readData;
	while((readData = reader.read()) != -1) {...}

	b. int read(char[] cbuf)
	: 읽은 문자들을 주어진 문자 배열 cbuf 저장
	: 실제로 읽은 문자수 리턴
	: 더 이상 읽을 수 없으면 -1 반환

	Reader reader = new FileReader(File 위치);
	char[] cbuf = new char[2];
	int readData;
	while((readData = reader.read(cbuf)) != -1) {...}

	ex) 가지고 와야하는 문자의 길이 5개 "ABCDE"
		반복횟수 => 3번 (2, 2, 1)

	: 많은 양의 문자를 읽을 때 read(char[] cbuf) 메소드 사용

	c. int read(char[] cbuf, int off, int len)
	: len개 문자 읽고 매개값으로 주어진 cbuf[off]부터 len까지 저장
	: 실제로 읽은 문자수 리턴
	: 더 이상 읽을 수 없으면 -1 반환

	char[] cbuf = new char[3];
	ex) read(cbuf, 1, 2);
	// cbuf[1], cbuf[2]에 데이터 저장


	read(cbuf) vs read(cbuf, off, len)
	: off: 0, len: 배열의 길이 => read(cbuf) 동일

	d. void close()
	: 자원 반납, 입력 스트림 닫음
	: 더이상 Reader 사용하지 않을 경우 close() 호출

	4) Writer
	: 문자 기반 출력 스트림

	Writer > FileWriter
		   > BufferedWriter
		   > PrintWriter

	a. void write(int c)
	: 주어진 한 문자를 보냄 (2바이트)

	Writer writer = new FileWriter(File 위치);
	char[] data = {'a', 'b', 'c'};
	for(int i = 0; i < data.length; i ++){
		writer.write(data[i]);
	}

	b. void write(char[] cbuf)
	: 주어진 문자 배열 cbuf의 모든 문자를 보냄

	Writer writer = new FileWriter(File 위치);
	char[] data = {'a', 'b', 'c'};
	writer.write(data);


	c. void write(char[] cbuf, int off, int len)
	: 주어진 문자 배열 cbuf[off]부터 len개까지 문자를 보냄

	Writer writer = new FileWriter(File 위치);
	char[] data = {'a', 'b', 'c'};
	writer.write(data, 1, 2); // 'b', 'c'만 출력


	d. void write(String s)
	: 출력 스트림으로 주어진 문자를 모두 보냄

	e. void write(String s, int off, int len)
	: 출력 스트림으로 주어진 문자열 off 인덱스부터 len개까지 보냄

	f. void flush()
	: 버퍼 잔류 데이터 지움

	g. void close()
	: 시스템 자원 반납, 출력 스트림 닫음


    @ 콘솔 입출력
    :콘솔 (console)
    : 시스템을 사용하기 위해 키보드 입력을 받고 화면으로 출력하는 공간
    :유닉스나 리눅스 OS: 터미널 (Terminal)
    :윈도우 OS : 명령 프롬포트 (cmd) (command prompt)

    (시스템 클래스의 스태틱 필드 )
    :입력 : System.in
    :데이터의 출력은 System.out
    :에러 : System.err (error)

    1)System.in 필드
    :콘솔을 통해 데이터 입력
    ex) InputStream is = System.in;
    is.read();
    //콘솔에 입력한 값을 한 바이트 읽음
    int a = is.read();
    //int 값에는 아스키코드 들어가 있음!
    //(char)is.read();

    'a' => 97
    'A'=> 65

    2) System.out 필드
    //System 클래스의 out 변수
    :콘솔을 통해 데이터 출력
    ex) OutputStream os = System.out;
    //콘솔을 통해 한 바이트를 출력한다 (아스키 코드)
    //write() => 문자로 콘솔 출력

    a = in.read()
    os.write (a+"test");//"97test"
    os.write ((char)a+"test");//"atest"

    :OutputStream 의 write () 메소드
    숫자 ,영어 , 특수문자 (1바이트)  => 출력 가능
    한글 (2바이트) => 출력 불가능

    String name = "구트아카데미";
    byte [] nameBytes = name.getByte();
    os.write (nameBytes);
    os.flush();

    3) Console 클래스

    :자바 6 부터 콘솔에서 입력받은 문자열을 쉽게 읽을수 있도록
    java.io.Console  클래스 제공

    ex) Console console = System.console();
    //null 값을 리턴하기 때문에 cmd(터미널) 실행해야함!

    -메소드
    String readLine() : Enter 전의 모든 문자열을 읽음
    char [] readPassword() :  콘솔에 보여주지 않고 문자열 읽음


    4) Scanner 클래스
    :Console 클래스 문자열만 읽음
    :Scanner 클래스는 기본 타입 (정수 ,실수 )읽을수 있음
    :java.util.Scanner  (ㅎㅇ ㅋ)



    @ 파일 입출력
    1) file 클래스
    :IO 패키지 (java.io)
    :파일 생성/삭제 ,디렉토리 (폴더 )생성, 파일 리스트 얻는 기능
    :파일의 데이터를 읽고 쓰는 기능 지원 X

    *디렉토리 구분자

    -윈도우 : \(문자열 내에서는 (\\))또는 / 사용
    -유닉스/리눅스 : /

     boolean createNewFile (): 새로운 파일 생성
     boolean mkdir(): 새로운 디렉토리 생성
     (make directory)
     boolean delete(): 파일 또는 디렉토리 삭제

     @보조 스트림
     :다른 스트림 (Input/OutputStream,Writer/Readr)과
     연결해서 사용하는 스트림

     :자체적으로 입출력 불가능
     :입출력 성능 향상,객체 입출력 가능 제공

  -Buffer 스트림(입출력 성능 향상)
     =>바이트 기반 스트림 : BufferdInputStream,BufferdOutputStream
     =>문자 기반 스트림 : BufferdWriter,BufferdReader

     :8192 버퍼 사이즈 가짐

     * 버퍼가 가득 찼을 떄만 출력을 하기 때문에
     마지막 버퍼에 남겨있는 데어터가 목적지로 가지 못할 수 있음

    *flush();를 통해 버퍼(에 잔류 데이터를 모두 보내줌 )를 비워 줌!

 -기본 타입으로 입출력
    : 바이트 스트림 (inputStream,OutputStream ) 바이트 단위로 입출력
    :boolean,char,int,float,double 단위로도 입출력
    :InputStream - DataInputStream - 프로그램 - DataOutputStream - OutputStream
    -사탕껍질 씌어서 보내진다고 보면됨! (포장 )

 -객체 입출력 보조 스트림
    :객체를 파일 입출력
    : 객체는 문자가 아니기 때문에 바이트 기반 스트림으로 출력해야 함
    :객체 직렬화 (serialization)
    => 객체를 출력하기 위해서는
     필드값들을 일렬로 늘어선 연속적인 바이트 단위로 변경
     ex) Student 필드 : id,name
     id - name

     :객체 역질렬화(deserialization)
     => 연속적인 바이트를 다시 객체로 복원하는 것

     :ObjectInputStream, ObjectOutputStream
     :ObjectOutputStream: 바이트 출력 스트림과 연결되어서 객체 직렬화
     ObjectInputStream : 바이트 입력 스트림과 연결되어서 객체 역 직렬화

    :InputStream - ObjectInputStream - 프로그램 - ObjectOutputStream - OutputStream
    readObject() - ObjectInputStream(역 직렬화)
    writeObject() - ObjectOutputStream (직렬화 )

    @네트워크
    :네트워크 (network) : 여러 대의 컴퓨터를 통신 회선 연결한 것

    1) 서버와 클라이언트
    :서버 (server): 서비스를 제공하는 프로그램
    :클라이언트 (client): 서비스를 받는 프로그램

    a. 클라이언트 -> 연결 요청
    b.서버 -> 연결 수락 -> 처리 -> 처리결과 -> 클라이언트
    :클라이언트 / 서버 (C/S : Client/server)모델
    -서버 1대 , 다수의 클라이언트 구성
    :P2P (peer to peer)모델
    -두개의 프로그램이 서버인 동시에 클라이언트 역할하는 모델
    ex) 1:1 채팅, 파일 공유 프로그램

    2) IP 주소와 포트
    : IP (Internet Protocol): 컴퓨터 고유 주소
    :xxx.xxx.xxx.xxxx
    :xxx: 0~255

    :DNS (Domain Name System)
    :IP 주소 (숫자)외우기 어려워서 주소 이름을 설정
    ex) 주소이름은 외우기 쉽지만 우편 번호는 외우기 어려움!

    DNS : www.naver.com (toString 했다 보면됨!)
    IP : 222.122.195.5
    => 도메인 이름 검색 -> 해당 IP 를 가진 서버 연결

   Port (포트 번호) : 컴퓨터에 현재 실행 중인 서버를 선택하기 위한 정보
   ex) 하나의 컴퓨터에는 다양한 서버 프로그램이 있을 수 있음
   웹 서버 => 80번, FTP 서버 => 21 번..

   3) InetAddress 로 IP 주소 얻기
   :java.net.InetAddress IP주소를 객체로 표현
   : InetAddress : 로컬 컴퓨터의 IP 주소와
   도메인 이름을 검색해서 IP 주소를 가지고 올수 있음!

   @TCP(Transmission Control Protocol)    //보통은 섞어서 구축을함!
   -연결 지향적 프로토콜
   -클라이언트가 연결 요청을 하고 서버가 수락을할때 통신의 선로가 생성이 되고 고정된 선로로 움직임(통신 선로 고정)
   -TCP 장점 : 데이터가 정확하고 안정적으로 전달
   -TCP 단점 : 시간이 많이 걸림 (반드시 연결 형성)
   *자바에서는 java.net.ServerSocket, java.net.Socket 클래스 제공
   *Socket (소켓): 프로세스가 네트워크를 통해 데이터를 송수신하려면 열어야하는 창구

     @UDP(User Datagram Protocol)                           //보통은 섞어서 구축을함!
   -데이터 전송 속도를 지향하는 프로토콜
   -UDP의 장점 :전송 방식이 단순,속도 효율적
   -UDP 단점 : 신뢰성 낮음 (데이터 전송이 잘 되었는지 확인 불가 )


   1)ServerSocket과 Socket
   a.클라이언트 연결 요청을 수락 => Server Socket
   b.연결된 클라이언트 통신 => Socket

   *서버는 이미 클라이언트가 접속할 포트를 가지고 있어야 함 => 바인딩(binding) 포트
   *서버는 고정된 포트 번호에 바인딩해서 실행
   *ServerSocket 생성시 포트 번호 넘겨줌
     * 포트 = 네트워크 상 아이피 주소 중에서도 그 안의 프로세스들 마다 접근하기 위한 고유 식별 번호


    2) ServerSocket
    나도 열고~ 서버도 열고~
    ServerSocket socket = new ServerSocket(5001);
    //5001 포트를 바인딩하는 ServerSocket 생성

    -ServerSocket socket = new ServerSocket ();
    socket.bind(new InetSocketAddress(5001));

    ServerSocket socket = new ServerSocket ();
    socket.bind(new InetSocketAddress("LocalHost",5001));// 나의 주소 보냄!,아이피 번호를 넣어도 문자열
    표시를 해줘야함!

    a.클라이언트의 연결 수락 accept()
    *accept(): 클라이언트가 연결 요청하기 전까지 블로킹 (스레드 대기상태)됨
    b. accept()은 연결 요청이 완료되면 클라이언트와 통신할 Socket 리턴
    (연결 수락)
    c.더이상 클라이언트 연결 수락이 필요없으면
    ServerSocket close();(해당 포트를 언바인딩)
    => 다른 프로그램에서 해당 포트 재사용할 수 있음!

    3) Socket 생성과 연결 요청
    :클라이언트가 서버에 연결요청을 하려면 Socket 사용
    a. Socket 객체 생성함과 동시에 연결 요청하려면
        생성자의 매게값으로 해서 IP 주소와 바인딩 포트 번호를 제공

        new Socket("localhost",5001);//방법 1
        new Socket
          (new InetSocketHost("localhost",50001));//방법 2

          b. 기본생성자로 Socket();을 생성한후
    :connect() 호출
    socket = new Sokcet();
    socket.connect(
    new InetSocketHost(""localhost),5001)

    4) Socket 데이터 통신
    :압력 스트림(InputStream)과 출력 스트림(OutputStream) 데이터 통신

    //입력스트림
    InputStream is = socket.getInputStream();

    //출력 스트림
    OutputStream is = socket.getOutputStream();

    ex) String data = "보낼데이터";//보낼때
    byte [] byteArr = data.getBytes("UTF-8");
    OutputStream outputStream = socket.getOutputStream();
    outputStream.write(byteArr);
    outputStream.flush();
    outputStream.close();

    InputStream inputStream
     = socket.getInputStream();
    byte [] byteArr = new byte[100];
    int readCount = inputStream.read(byteArr);
    String data =new String (byteArr,0,readCount,"UTF-8")
    inputStream.flush();
    inputStream.close();

    클라이언트 데이터 전달 => 서버
    Output  => input

    서버 데이터 전달    => 클라이언트
    Output  => input













:



























     */
}
