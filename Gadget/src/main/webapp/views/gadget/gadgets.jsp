<%--
  Created by IntelliJ IDEA.
  User: omar-
  Date: 26/08/2021
  Time: 06:09 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Listado de Aparatos Electronicos</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<div id="content">
    <br>
    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#create"><i class="fas fa-plus"></i> Agregar Aparato Eléctronico</button>
    <br>
    <table id="tableGadget" class="table">
        <thead class="table-dark">
        <th>No.</th>
        <th>Nombre del aparato</th>
        <th>Direccion del fabricante</th>
        <th>Fecha de registro</th>
        <th>Estado</th>
        <th>Acciones</th>
        </thead>
        <tbody >

        </tbody>

    </table>
</div>


<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar Videojuego</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                    <label>Nombre del aparato:</label>
                    <input class="form-control" type="text" name="name" id="name"  />

                    </div>
                    <div class="col-6">
                        <label>calle:</label>
                        <input class="form-control" type="text" name="street" id="street"  />

                    </div>
                    <div class="col-6">
                        <label>Colonia:</label>
                        <input class="form-control" type="text" name="suburb" id="suburb"  />

                    </div>
                    <div class="col-6">
                        <label>Código Postal:</label>
                        <input class="form-control" type="number" name="postalCode" id="postalCode"  />

                    </div>
                    <div class="col-6">
                        <label>Estado:</label>
                        <input class="form-control" type="text" name="state" id="state"  />

                    </div>
                    <div class="col-6">
                        <label>País:</label>
                        <input class="form-control" type="text" name="country" id="country"  />

                    </div>
                    <div class="col-6">
                        <label>Fecha de Registro:</label>
                        <input class="form-control" type="date" name="date" id="date"  />

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                <button type="button" class="btn btn-success" onclick="create();"> Agregar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Registrar película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/updateGadget" method="POST">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="idAddress" id="idAddress">
                    <div class="row">
                        <div class="col-6">
                            <label>Nombre del aparato:</label>
                            <input class="form-control" type="text" name="name" id="name1"  />

                        </div>
                        <div class="col-6">
                            <label>calle:</label>
                            <input class="form-control" type="text" name="street" id="street1"  />

                        </div>
                        <div class="col-6">
                            <label>Colonia:</label>
                            <input class="form-control" type="text" name="suburb" id="suburb1"  />

                        </div>
                        <div class="col-6">
                            <label>Código Postal:</label>
                            <input class="form-control" type="number" name="postalCode" id="postalCode1"  />

                        </div>
                        <div class="col-6">
                            <label>Estado:</label>
                            <input class="form-control" type="text" name="state" id="state1"  />

                        </div>
                        <div class="col-6">
                            <label>País:</label>
                            <input class="form-control" type="text" name="country" id="country1"  />

                        </div>
                        <div class="col-6">
                            <label>Fecha de Registro:</label>
                            <input class="form-control" type="date" name="date" id="date1"  />

                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="details" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Detalles del videojuego</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <label>Nombre del aparato:</label>
                        <br>
                        <span id="name3" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>Calle:</label>
                        <br>
                        <span id="street2" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>Colonia:</label>
                        <br>
                        <span id="suburb2" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>Código Postal:</label>
                        <br>
                        <span id="postalCode2" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>Estado:</label>
                        <br>
                        <span id="state2" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>País:</label>
                        <br>
                        <span id="country2" style="font-weight: bold"></span>

                    </div>
                    <div class="col-6">
                        <label>Fecha de Registro:</label>
                        <br>
                        <span id="date2" style="font-weight: bold"></span>

                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Detalles del videojuego</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/deleteGadget" method="POST">
                    <input type="hidden" name="id2" id="id2">
                    <input type="hidden" name="action" value="delete">
                    <label>Seguro que quieres eliminar el videojuego a</label>
                    <span id="name2" style="font-weight: bold"></span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                <button type="submit" class="btn btn-danger" ><i class="fas fa-trash"></i> Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${context}/assets/dist/js/main.js"></script>
</body>
</html>
