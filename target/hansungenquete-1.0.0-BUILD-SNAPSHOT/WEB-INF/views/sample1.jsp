����Ȯ�� ���� ȣ���� ������ �Է� ���� ������
<%
  response.setHeader("Pragma","no-cache");			// HTTP1.0 ĳ�� ����
  response.setDateHeader("Expires",0);				// proxy ������ ĳ�� ����
  response.setHeader("Pragma", "no-store");			// HTTP1.1 ĳ�� ����
  if(request.getProtocol().equals("HTTP/1.1"))
    response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 ĳ�� ����
%>
<%@ page  contentType = "text/html;charset=ksc5601"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
  //��¥ ����
  Calendar today = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
  String day = sdf.format(today.getTime());

  java.util.Random ran = new Random();
  //���� ���� ����
  int numLength = 6;
  String randomStr = "";

  for (int i = 0; i < numLength; i++) {
    //0 ~ 9 ���� ���� ����
    randomStr += ran.nextInt(10);
  }

  //reqNum�� �ִ� 40byte ���� ��� ����
  String reqNum = day + randomStr;
%>

<html>
<head>
  <title>KMC ����Ȯ�μ��� �׽�Ʈ</title>
  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
  <meta name="robots" content="noindex">
  <style>
    <!--
    body,p,ol,ul,td
    {
      font-family: ����;
      font-size: 12px;
    }

    a:link { size:9px;color:#000000;text-decoration: none; line-height: 12px}
    a:visited { size:9px;color:#555555;text-decoration: none; line-height: 12px}
    a:hover { color:#ff9900;text-decoration: none; line-height: 12px}

    .style1 {
      color: #6b902a;
      font-weight: bold;
    }
    .style2 {
      color: #666666
    }
    .style3 {
      color: #3b5d00;
      font-weight: bold;
    }
    -->
  </style>
</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<center>
  <br><br><br>
  <span class="style1">KMC ����Ȯ�μ��� �׽�Ʈ</span>
  <br><br>

  <form name="reqForm" method="post" action="/sample2">

    <table cellpadding=1 cellspacing=1>
      <tr>
        <td align=center><font color="red">*</font> ȸ����ID</td>
        <td align=left><input type="text" name="cpId" id="cpId" size='41' maxlength ='10' value = ""></td>
      </tr>
      <tr>
        <td align=center><font color="red">*</font> URL�ڵ�</td>
        <td align=left><input type="text" name="urlCode" id="urlCode" size='41' maxlength ='6' value=""></td>
      </tr>
      <tr>
        <td align=center><font color="red">*</font> ��û��ȣ</td>
        <td align=left><input type="text" name="certNum" id="certNum" size='41' maxlength ='40' value='<%=reqNum%>'></td>
      </tr>
      <tr>
        <td align=center><font color="red">*</font> ��û�Ͻ�</td>
        <% // ����ð� ����(YYYYMMDDHI24MISS) %>
        <td align=left><input type="text" name="date" size="41" maxlength ='14' value="<%=day%>"></td>
      </tr>
      <tr>
        <td align=center><font color="red">*</font>����Ȯ�ι��</td>
        <td align=left>
          <select name="certMet" id="certMet" style="width:300">
            <option value="M" selected>����Ȯ�ι�� ����</option>
          </select>
        </td>
      </tr>
      <tr>
        <td align=center><font color="red">*</font> �������URL</td>
        <td align=left><input type="text" name="tr_url" size="41" value="/sample3"></td>
      </tr>
      <tr>
        <td align=center>�߰�DATA����</td>
        <td align=left><input type="text" name="plusInfo"  size="41" maxlength ='320' value=""></td>
      </tr>
      <tr>
        <td align=center>IFrame��뿩��</td>
        <td align=left>
          <select name="tr_add" style="width:300">
            <option value="N">�̻��</option>
            <option value="Y">���</option>
          </select>
        </td>
      </tr>
    </table>

    <br><br>
    <input type="submit" value = "KMC ����Ȯ�μ��� �׽�Ʈ">
    <br><br>
    �� Sampleȭ���� KMC ����Ȯ�μ��� �׽�Ʈ�� ���� �����ϰ� �ִ� ȭ���Դϴ�.<br><br>
    <font color="red">*</font> �ʼ� �Է� �׸��Դϴ�!
  </form>
</center>
</body>
</html>