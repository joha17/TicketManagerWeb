# API de Gestión de Tiempos de Tickets

## Descripción

Esta es una API RESTful para la gestión de tiempos de tickets, diseñada para ayudar a los equipos a rastrear y administrar el tiempo dedicado a cada ticket. La API permite crear, leer, actualizar y eliminar tickets, así como registrar el tiempo dedicado a cada uno.

## Características

- **Gestión de Tickets**: Crea, actualiza y elimina tickets.
- **Registro de Tiempos**: Añade y consulta el tiempo dedicado a cada ticket.
- **Filtrado**: Busca tickets por estado, prioridad y fecha.
- **Autenticación**: Seguridad a través de tokens JWT.

## Tecnologías Utilizadas

- **C#**: Lenguaje de programación.
- **ASP.NET Core**: Framework para construir la API.
- **Entity Framework Core**: Para la interacción con la base de datos.
- **SQL Server**: Base de datos para almacenar tickets y tiempos.
- **JWT**: Para la autenticación y autorización de usuarios.

## Requisitos

- .NET SDK >= 6.0
- SQL Server

## Instalación

1. Clona el repositorio:

   ```bash
   git clone https://github.com/joha17/TicketManagerWeb.git
   cd TicketManagerWeb
