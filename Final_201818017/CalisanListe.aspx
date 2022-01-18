<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalisanListe.aspx.cs" Inherits="Final_201818017.CalisanListe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 301px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id,Id1,Id2" DataSourceID="SqlDataSource1" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="Gainsboro" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Adi" HeaderText="Adı" SortExpression="Adi" />
                    <asp:BoundField DataField="Soyadi" HeaderText="Soyadı" SortExpression="Soyadi" />
                    <asp:BoundField DataField="TCKimlikNo" HeaderText="TC Kimlik No" SortExpression="TCKimlikNo" />
                    <asp:BoundField DataField="Cinsiyet" HeaderText="Cinsiyet" SortExpression="Cinsiyet" />
                    <asp:BoundField DataField="DogumYili" HeaderText="Doğum Yılı" SortExpression="DogumYili" />
                    <asp:BoundField DataField="BolumAdi" HeaderText="Bölum" SortExpression="BolumAdi" />
                    <asp:BoundField DataField="UnvanAdi" HeaderText="Ünvan" SortExpression="UnvanAdi" />
                    <asp:BoundField DataField="BasTarih" HeaderText="Başlangıç Tarihi" SortExpression="BasTarih" />
                    <asp:BoundField DataField="BitTarih" HeaderText="Bitiş Tarihi" SortExpression="BitTarih" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="detay" ShowHeader="True" Text="Detay" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#048400" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Calisan INNER JOIN Bolum ON (Calisan.BolumID=Bolum.Id) INNER JOIN Unvan ON(Calisan.UnvanID=Unvan.Id)
"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
