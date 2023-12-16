<%@ Page Title="" Language="C#" MasterPageFile="~/MenuMaster.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="ExamenFinal_Progra2.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container text-center">
            <h6 > &nbsp;</h6>
            <h1 class="display-3" > Bienvenid@ a la encuesta </h1>
            <p class="display-3" > &nbsp;</p>

           <h3 class="display-6" > Debido a requisitos administrativos por favor solo llene la encuesta si su edad se encuentra entre 18 y 50 años. </h3>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
     </div>
      <div class="container">
        <p> 
          <asp:Label ID="lblNombre" class="lead" runat="server" Text="Nombre:"></asp:Label>
        </p>
        <p> 
        <asp:TextBox ID="tbNombre" class="round form-control" runat="server" placeholder="María Rodríguez" ></asp:TextBox>
        </p>
        <p> 
            <asp:Label ID="lblEdad" class="lead" runat="server" Text="Edad:"></asp:Label>
    </p>
    <p> 
        <asp:TextBox ID="tbEdad" class="round form-control" runat="server" placeholder="35" ></asp:TextBox>
    </p>
    <p> 
        <asp:Label ID="lblCorreo" class="lead" runat="server" Text="Correo Electrónico:" ></asp:Label>
    </p>
    <p> 
        <asp:TextBox ID="tbCorreo" class="round form-control" runat="server" placeholder="name@example.com" ></asp:TextBox>
    </p>
    <p> 
        <asp:Label ID="lblPartidoP" class="lead" runat="server" Text="Partido político al que apoya:"></asp:Label>
    </p>
    <p> 
        <asp:DropDownList ID="ddlPartidoP"  class="round form-control" runat="server" OnSelectedIndexChanged="Page_Load"></asp:DropDownList>
    </p>
            <p> 
                <div id="alertBox1" runat="server" role="alert"></div>
                <div id="alertBox2" runat="server" role="alert"></div>
                <div id="alertBox3" runat="server" role="alert"></div>
                &nbsp;</p>
    <p> &nbsp;</p>
 </div>
     <div class=" container text-end">
        <asp:Button ID="btnEnviar" class="btn btn-outline-primary" runat="server" Text="Enviar" OnClick="btnEnviar_Click" Height="53px" Width="116px" />
         <br />
         <br />
     </div>
      



</asp:Content>
