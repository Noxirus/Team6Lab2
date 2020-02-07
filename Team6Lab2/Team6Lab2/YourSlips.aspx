﻿<%@ Page Title="YourSlips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="YourSlips.aspx.cs" Inherits="Team6Lab2.YourSlips" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Your slip reservation history<%: Title %>.</h2>
    <h3>List below of all your slips</h3>
    <p>&nbsp;</p>
    <p>
        <asp:DropDownList ID="ddlCurrentCustomer" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="gvCustomerLeases" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="SlipID" HeaderText="SlipID" SortExpression="SlipID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Lease] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCurrentCustomer" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="frmviewSlipInfo" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource4">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                width:
                <asp:TextBox ID="widthTextBox" runat="server" Text='<%# Bind("width") %>' />
                <br />
                length:
                <asp:TextBox ID="lengthTextBox" runat="server" Text='<%# Bind("length") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                ElectricalService:
                <asp:CheckBox ID="ElectricalServiceCheckBox" runat="server" Checked='<%# Bind("ElectricalService") %>' />
                <br />
                WaterService:
                <asp:CheckBox ID="WaterServiceCheckBox" runat="server" Checked='<%# Bind("WaterService") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                width:
                <asp:TextBox ID="widthTextBox" runat="server" Text='<%# Bind("width") %>' />
                <br />
                length:
                <asp:TextBox ID="lengthTextBox" runat="server" Text='<%# Bind("length") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                ElectricalService:
                <asp:CheckBox ID="ElectricalServiceCheckBox" runat="server" Checked='<%# Bind("ElectricalService") %>' />
                <br />
                WaterService:
                <asp:CheckBox ID="WaterServiceCheckBox" runat="server" Checked='<%# Bind("WaterService") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                width:
                <asp:Label ID="widthLabel" runat="server" Text='<%# Bind("width") %>' />
                <br />
                length:
                <asp:Label ID="lengthLabel" runat="server" Text='<%# Bind("length") %>' />
                <br />

                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                ElectricalService:
                <asp:CheckBox ID="ElectricalServiceCheckBox" runat="server" Checked='<%# Bind("ElectricalService") %>' Enabled="false" />
                <br />
                WaterService:
                <asp:CheckBox ID="WaterServiceCheckBox" runat="server" Checked='<%# Bind("WaterService") %>' Enabled="false" />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT slip.id, slip.width, slip.length, dock.Name, dock.ElectricalService, dock.WaterService
FROM slip join lease
ON slip.ID = lease.SlipID
JOIN dock
ON slip.DockID = dock.ID
WHERE slip.ID = 20">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>