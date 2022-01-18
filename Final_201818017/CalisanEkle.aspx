<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalisanEkle.aspx.cs" Inherits="Final_201818017.CalisanEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1>YAPIMCILAR</h1>
    <p>
        Buğra Kaan Saka
    </p>
    <p>Doğukan Onur Korkmaz</p>
    <form id="form1" runat="server">
        <div style="height: 629px">
            <asp:Label ID="Label1" runat="server" Text="Adı : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="Ad" runat="server"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" controltovalidate="Ad" runat="server" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Soyadı : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="Soyad" runat="server"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="Soyad" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="TC Kimlik No : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TCno" runat="server"></asp:TextBox>
            &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" controltovalidate="TCno" runat="server" ValidationExpression="[0-9]{11}" ErrorMessage="Lütfen 11 haneli TC numaranızı giriniz."></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Cinsiyet : "></asp:Label>
            <asp:RadioButtonList ID="cinsiyetrb" runat="server">
                <asp:ListItem Value="K">Kadın</asp:ListItem>
                <asp:ListItem Value="E">Erkek</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Doğum Yılı : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="DogumYil" runat="server" TextMode="Number"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controltovalidate="DogumYil" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="1950 ve 2004 tarihleri arasında girilmelidir" controltovalidate="DogumYil" MaximumValue="2004" MinimumValue="1950"></asp:RangeValidator>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Bölüm : "></asp:Label>
            <asp:DropDownList ID="bolum" runat="server" DataSourceID="SqlDataSource2" DataTextField="BolumAdi" DataValueField="Id" AppendDataBoundItems="True">
            </asp:DropDownList>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" controltovalidate="bolum" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [BolumAdi] FROM [Bolum]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Ünvan : "></asp:Label>
            <asp:DropDownList ID="unvan" runat="server" DataSourceID="SqlDataSource1" DataTextField="UnvanAdi" DataValueField="Id" AppendDataBoundItems="True" style="width: 88px">
            </asp:DropDownList>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" controltovalidate="unvan" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [UnvanAdi] FROM [Unvan]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Başlangıç Tarihi : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="BasTarih" runat="server" TextMode="Date"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" controltovalidate="BasTarih" ErrorMessage="Boş Bırakılamaz."></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Bitiş Tarihi : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="BitTarih" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="kaydet" runat="server" Height="30px" Text="Kaydet" Width="120px" OnClick="kaydet_Click" />

            <br />
            <br />
            <br />

            <asp:Button ID="Link" runat="server" Text="Çalışan Listesi" OnClick="Link_Click" />

        </div>
    </form>
</body>
</html>
