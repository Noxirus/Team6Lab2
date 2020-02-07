<%@ Page Title="AvailableSlips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AvailableSlips.aspx.cs" Inherits="Team6Lab2.AvailableSlips" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Available Slips<%: Title %>.</h2>
    <h3>Currently Available Slips</h3>
    <p>
        <asp:GridView ID="gvAvailableSlips" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DataSourceAvailableSlips">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataSourceAvailableSlips" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="select * from slip where ID not in (select SlipID from Lease)"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
    </p>
</asp:Content>
