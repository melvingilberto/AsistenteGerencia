<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img class="center-block img-responsive" src="img/slider.jpg" />
    <div class="container welcome">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Bienvenido</h2>
                <br />
            </div>
        </div>
        <div class="col-sm-12 col-md-4">
            <p class="text-center">
                <span class="glyphicon glyphicon-user"></span>
            </p>
            <p class="text-center">
                Administración de usuarios de manera fácil y eficiente, ahorra tiempo y aumenta la productividad
            </p>
        </div>
        <div class="col-sm-12 col-md-4">
            <p class="text-center text-warning">
                <span class="glyphicon glyphicon-cloud"></span>
            </p>
            <p class="text-center">
                Administra de en cualquier parte a tus empleados sin dificultad
            </p>
        </div>
        <div class="col-sm-12 col-md-4">
            <p class="text-center text-warning">
                <span class="glyphicon glyphicon-list-alt"></span>
            </p>
            <p class="text-center">
                Revisa reportes de tus empleados a cualquier hora en cualquier lugar del mundo
            </p>
        </div>
    </div>

</asp:Content>

