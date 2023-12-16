<%@ Page Title="" Language="C#" MasterPageFile="~/MenuMaster.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="ExamenFinal_Progra2.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center"> 
           
       <h1 class="display-3"></h1>
           <h1 class="display-3"> Reporte de Encuestas </h1>
           <p class="display-3"> &nbsp;</p>

       <div class="d-flex justify-content-center">
            <br />
            <br />
            <asp:GridView ID="gvReporte" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Número de Encuesta" HeaderText="Número de Encuesta" SortExpression="Número de Encuesta" />
                    <asp:BoundField DataField="Nombre Encuestante" HeaderText="Nombre Encuestante" SortExpression="Nombre Encuestante" />
                    <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                    <asp:BoundField DataField="Correo Electrónico" HeaderText="Correo Electrónico" SortExpression="Correo Electrónico" />
                    <asp:BoundField DataField="Partido Político" HeaderText="Partido Político" SortExpression="Partido Político" />
                </Columns>
            </asp:GridView>

            <br />
      </div>
  </div>
</asp:Content>
