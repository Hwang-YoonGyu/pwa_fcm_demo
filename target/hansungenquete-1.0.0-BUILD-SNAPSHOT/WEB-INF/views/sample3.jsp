KMC ����Ȯ�μ��� ��� ������ ���� �˾� ���� ������
<%
    response.setHeader("Pragma","no-cache");			// HTTP1.0 ĳ�� ����
    response.setDateHeader("Expires",0);				// proxy ������ ĳ�� ����
    response.setHeader("Pragma", "no-store");			// HTTP1.1 ĳ�� ����
    if(request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 ĳ�� ����
%>
<%@ page contentType = "text/html;charset=ksc5601"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%
    // ���� -------------------------------------------------------------------------------------------------------------
    String rec_cert		= "";           // �������DATA
    String k_certNum	= "";			// ��û��ȣ �Ķ����
    String certNum		= ""; 			// ��û��ȣ
    String date			= "";			// ��û�Ͻ�
    String CI			= "";			// ��������(CI)
    String DI			= "";			// �ߺ�����Ȯ������(DI)
    String mNumber		= "";			// �޴�����ȣ
    String mCorp		= "";			// �̵���Ż�
    String birth		= "";			// �������
    String gender		= "";			// ����
    String nation		= "";			// ������
    String name			= "";			// ����
    String reserve1		= "";			// �����ʵ�
    String reserve2		= "";			// �����ʵ�
    String reserve3		= "";			// �����ʵ�
    String reserve4		= "";			// �����ʵ�
    String result		= "";			// �����

    String certMet		= "";			// ����Ȯ�ι��
    String ip			= "";			// ip�ּ�
    String plusInfo		= "";

    String encPara		= "";
    String encMsg1		= "";
    String encMsg2		= "";
    String msgChk		= "";

    try {
        // Parameter ���� --------------------------------------------------------------------
        rec_cert = request.getParameter("rec_cert").trim();
        k_certNum = request.getParameter("certNum").trim();
%>
[��ȣȭ �ϱ��� ���Ű�]<br><br>
rec_cert : <%=rec_cert%><br><br>
k_certNum : <%=k_certNum%><br><br>
<%
    //01. ��ȣȭ ��� (jar) Loading
    com.icert.comm.secu.IcertSecuManager seed    = new com.icert.comm.secu.IcertSecuManager();

    //02. 1�� ��ȣȭ
    rec_cert  =  seed.getDec(rec_cert, k_certNum);

    //03. 1�� �Ľ�
    int inf1 = rec_cert.indexOf("/",0);
    int inf2 = rec_cert.indexOf("/",inf1+1);

    encPara  = rec_cert.substring(0,inf1);         //��ȣȭ�� ���� �Ķ����
    encMsg1  = rec_cert.substring(inf1+1,inf2);    //��ȣȭ�� ���� �Ķ������ Hash��

    //04.������ ����
    encMsg2  = seed.getMsg(encPara);

    if(encMsg2.equals(encMsg1)){
        msgChk="Y";
    }

    if(msgChk.equals("N")){
%>
<script language=javascript>
    alert("���������� �����Դϴ�.!!<%=msgChk%>");
</script>
<%
        return;
    }

    //05. 2�� ��ȣȭ
    rec_cert  = seed.getDec(encPara, k_certNum);

    //06. 2�� �Ľ�
    int info1  = rec_cert.indexOf("/",0);
    int info2  = rec_cert.indexOf("/",info1+1);
    int info3  = rec_cert.indexOf("/",info2+1);
    int info4  = rec_cert.indexOf("/",info3+1);
    int info5  = rec_cert.indexOf("/",info4+1);
    int info6  = rec_cert.indexOf("/",info5+1);
    int info7  = rec_cert.indexOf("/",info6+1);
    int info8  = rec_cert.indexOf("/",info7+1);
    int info9  = rec_cert.indexOf("/",info8+1);
    int info10 = rec_cert.indexOf("/",info9+1);
    int info11 = rec_cert.indexOf("/",info10+1);
    int info12 = rec_cert.indexOf("/",info11+1);
    int info13 = rec_cert.indexOf("/",info12+1);
    int info14 = rec_cert.indexOf("/",info13+1);
    int info15 = rec_cert.indexOf("/",info14+1);
    int info16 = rec_cert.indexOf("/",info15+1);
    int info17 = rec_cert.indexOf("/",info16+1);
    int info18 = rec_cert.indexOf("/",info17+1);

    certNum		= rec_cert.substring(0,info1);
    date		= rec_cert.substring(info1+1,info2);
    CI			= rec_cert.substring(info2+1,info3);
    mNumber	    = rec_cert.substring(info3+1,info4);
    mCorp		= rec_cert.substring(info4+1,info5);
    birth		= rec_cert.substring(info5+1,info6);
    gender		= rec_cert.substring(info6+1,info7);
    nation		= rec_cert.substring(info7+1,info8);
    name		= rec_cert.substring(info8+1,info9);
    result		= rec_cert.substring(info9+1,info10);
    certMet		= rec_cert.substring(info10+1,info11);
    ip			= rec_cert.substring(info11+1,info12);
    reserve1	= rec_cert.substring(info12+1,info13);
    reserve2	= rec_cert.substring(info13+1,info14);
    reserve3	= rec_cert.substring(info14+1,info15);
    reserve4	= rec_cert.substring(info15+1,info16);
    plusInfo   	= rec_cert.substring(info16+1,info17);
    DI			= rec_cert.substring(info17+1,info18);

    //07. CI, DI ��ȣȭ
    CI  = seed.getDec(CI, k_certNum);
    DI  = seed.getDec(DI, k_certNum);
    }catch(Exception ex){
        System.out.println("[KMCIS] Receive Error -"+ex.getMessage());
    }
%>

<html>
<head>
    <script language="JavaScript">

        // ��� ������ ��� ����
        var move_page_url = "/agreePop";

        function end() {
            var UserAgent = navigator.userAgent;

            document.form.action = move_page_url;
            var input1 = document.createElement('input');
            input1.type = 'hidden';
            input1.name = 'certPhoneNumber';
            input1.value = '<%=mNumber%>';
            document.form.appendChild(input1);

            // ������� ��� (�������� ���� ��� �߰� �ʿ�!)
            if (UserAgent.match(/iPhone|iPad|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
            {

                document.form.submit();
            }
            // ������� �ƴ� ���
            else {
                document.form.target = opener.window.name;
                document.form.submit();
                self.close();
            }
            // ����� app ȯ�濡 �°� ���� End
        }
    </script>
</head>

<body onload="javascript:end()">
<form id="form" name="form" method="post">
    <input type="hidden" id="name" value="<%=name%>" />
</form>
</body>
</html>