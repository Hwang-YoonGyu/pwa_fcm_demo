KMC ����Ȯ�μ��� ��� ������ ��ȣȭ ���� ������
<%
    response.setHeader("Pragma","no-cache");			// HTTP1.0 ĳ�� ����
    response.setDateHeader("Expires",0);				// proxy ������ ĳ�� ����
    response.setHeader("Pragma", "no-store");			// HTTP1.1 ĳ�� ����
    if(request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 ĳ�� ����
%>
<%@ page  contentType = "text/html;charset=ksc5601"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.regex.*" %>
<%@ page import = "java.text.*" %>

[KMC ����Ȯ�μ��� �׽�Ʈ ��� ���� Sample]<br><br>

<%
    // ���� -------------------------------------------------------------------------------------------------------------
    String rec_cert		= "";          // �������DATA
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

    try{
        // Parameter ���� --------------------------------------------------------------------
        rec_cert    = request.getParameter("rec_cert").trim();
        k_certNum   = request.getParameter("certNum").trim();
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
%>
<%!
    // �Ķ���� ��ȿ�� ���� --------------------------------------------
    boolean b = true;
    String regex = "";

    public Boolean paramChk(String patn, String param){
        Pattern pattern = Pattern.compile(patn);
        Matcher matcher = pattern.matcher(param);
        b = matcher.matches();
        return b;
    }
%>
<%
    if( certNum.length() == 0 || certNum.length() > 40){
        out.println("��û��ȣ ������");
        return;
    }

    regex = "[0-9]*";
    if( date.length() != 14 || !paramChk(regex, date) ){
        out.println("��û�Ͻ� ������");
        return;
    }

    regex = "[A-Z]*";
    if( certMet.length() != 1 || !paramChk(regex, certMet) ){
        out.println("����Ȯ�ι�� ������" + certMet);
        return;
    }

    regex = "[0-9]*";
    if( birth.length() != 8 || !paramChk(regex, birth) ){
        out.println("������� ������");
        return;
    }

    regex = "[0-9]*";
    if( gender.length() != 1 || !paramChk(regex, gender) ){
        out.println("���� ������");
        return;
    }

    regex = "[0-9]*";
    if( nation.length() != 1 || !paramChk(regex, nation) ){
        out.println("��/�ܱ��� ������");
        return;
    }

    regex = "[\\sA-Za-z��-?.,-]*";
    if( name.length() > 60 || !paramChk(regex, name) ){
        out.println("���� ������");
        return;
    }

    regex = "[A-Z]*";
    if( result.length() != 1 || !paramChk(regex, result) ){
        out.println("����� ������");
        return;
    }

    // End �Ķ���� ��ȿ�� ���� --------------------------------------------

    // Start - ���ų��� ��ȿ�� ����(�缳���� �缳 IP�� ���� �̻��, ������� ��� Ȯ�� �� ���) *********************/
    // 1. date �� ����
    SimpleDateFormat formatter	= new SimpleDateFormat("yyyyMMddHHmmss",Locale.KOREAN); // ���� ���� �ð� ���ϱ�
    String strCurrentTime	= formatter.format(new Date());

    Date toDate				= formatter.parse(strCurrentTime);
    Date fromDate			= formatter.parse(date);
    long timediff			= toDate.getTime()-fromDate.getTime();

    if ( timediff < -30*60*1000 || 30*60*100 < timediff  ){		%>
���������� �����Դϴ�. (��û�ð����)
<%			return;
}

    // 2. ip �� ����
    String client_ip = request.getHeader("HTTP_X_FORWARDED_FOR"); // �����IP ���ϱ�
    if ( client_ip != null ){
        if( client_ip.indexOf(",") != -1 )
            client_ip = client_ip.substring(0,client_ip.indexOf(","));
    }
    if ( client_ip==null || client_ip.length()==0 ){
        client_ip = request.getRemoteAddr();
    }

    if( !client_ip.equals(ip) ){		%>

���������� �����Դϴ�. (IP����ġ)
<%			return;
}
    // End - ���ų��� ��ȿ�� ����(�缳���� �缳 IP�� ���� �̻��, ������� ��� Ȯ�� �� ���) ***********************/
%>
<html>
<head>
    <meta name="robots" content="noindex">
</head>
<body>
<br><br>
[��ȣȭ �� ���Ű�] <br><br>
<table cellpadding=1 cellspacing=1>
    <tr>
        <td align=left>��,��������1</td>
        <td align=left><%=encMsg1%></td>
    </tr>
    <tr>
        <td align=left>��,��������2</td>
        <td align=left><%=encMsg2%></td>
    </tr>

    <tr>
        <td align=left>��û��ȣ</td>
        <td align=left><%=certNum%></td>
    </tr>
    <tr>
        <td align=left>��û�Ͻ�</td>
        <td align=left><%=date%></td>
    </tr>
    <tr>
        <td align=left>��������(CI)</td>
        <td align=left><%=CI%></td>
    </tr>
    <tr>
        <td align=left>�ߺ�����Ȯ������(DI)</td>
        <td align=left><%=DI%></td>
    </tr>
    <tr>
        <td align=left>�޴�����ȣ</td>
        <td align=left><%=mNumber%></td>
    </tr>
    <tr>
        <td align=left>�̵���Ż�</td>
        <td align=left><%=mCorp%></td>
    </tr>
    <tr>
        <td align=left>�������</td>
        <td align=left><%=birth%></td>
    </tr>
    <tr>
        <td align=left>������</td>
        <td align=left><%=nation%></td>
    </tr>
    <tr>
        <td align=left>����</td>
        <td align=left><%=gender%></td>
    </tr>
    <tr>
        <td align=left>����</td>
        <td align=left><%=name%></td>
    </tr>
    <tr>
        <td align=left>���</td>
        <td align=left><%=result%></td>
    </tr>
    <tr>
        <td align=left>����Ȯ�ι��</td>
        <td align=left><%=certMet%></td>
    </tr>
    <tr>
        <td align=left>ip�ּ�</td>
        <td align=left><%=ip%></td>
    </tr>
    <tr>
        <td align=left>�߰�DATA����</td>
        <td align=left><%=plusInfo%></td>
    </tr>
</table>

<br>
rec_cert : <%=rec_cert%> <br><br>
<a href="/sample1">[�ٽ� �׽�Ʈ]</a>

</body>
</html>
<%
    }catch(Exception ex){
        System.out.println("[KMCIS] Receive Error -"+ex.getMessage());
    }
%>