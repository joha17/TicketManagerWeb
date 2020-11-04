using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UE_ManagerWebApp.Migrations
{
    public partial class Add_ticketlogs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_Applications_Departments_DepartmentId",
            //    table: "Applications");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Applications_ApplicationId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Causes_CauseId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Customers_CustomerId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Departments_DepartmentId",
            //    table: "Tickets");

            //migrationBuilder.AlterColumn<int>(
            //    name: "DepartmentId",
            //    table: "Tickets",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int",
            //    oldNullable: true);

            //migrationBuilder.AlterColumn<int>(
            //    name: "CustomerId",
            //    table: "Tickets",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int",
            //    oldNullable: true);

            //migrationBuilder.AlterColumn<int>(
            //    name: "CauseId",
            //    table: "Tickets",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int",
            //    oldNullable: true);

            //migrationBuilder.AlterColumn<int>(
            //    name: "ApplicationId",
            //    table: "Tickets",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int",
            //    oldNullable: true);

            //migrationBuilder.AlterColumn<int>(
            //    name: "DepartmentId",
            //    table: "Applications",
            //    nullable: false,
            //    oldClrType: typeof(int),
            //    oldType: "int",
            //    oldNullable: true);

            migrationBuilder.CreateTable(
                name: "TicketLog",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TicketNumber = table.Column<int>(nullable: false),
                    CreationDate = table.Column<DateTime>(nullable: false),
                    DestinationUser = table.Column<string>(nullable: true),
                    FromUser = table.Column<string>(nullable: true),
                    CommentLog = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TicketLog", x => x.Id);
                });

            //migrationBuilder.CreateTable(
            //    name: "Users",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Username = table.Column<string>(nullable: false),
            //        Password = table.Column<string>(nullable: false),
            //        FirstName = table.Column<string>(nullable: false),
            //        LastName = table.Column<string>(nullable: false),
            //        EmailID = table.Column<string>(nullable: false),
            //        AccessLevel = table.Column<string>(nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Users", x => x.Id);
            //    });

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Applications_Departments_DepartmentId",
            //    table: "Applications",
            //    column: "DepartmentId",
            //    principalTable: "Departments",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Applications_ApplicationId",
            //    table: "Tickets",
            //    column: "ApplicationId",
            //    principalTable: "Applications",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Causes_CauseId",
            //    table: "Tickets",
            //    column: "CauseId",
            //    principalTable: "Causes",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Customers_CustomerId",
            //    table: "Tickets",
            //    column: "CustomerId",
            //    principalTable: "Customers",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Departments_DepartmentId",
            //    table: "Tickets",
            //    column: "DepartmentId",
            //    principalTable: "Departments",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropForeignKey(
            //    name: "FK_Applications_Departments_DepartmentId",
            //    table: "Applications");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Applications_ApplicationId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Causes_CauseId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Customers_CustomerId",
            //    table: "Tickets");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_Tickets_Departments_DepartmentId",
            //    table: "Tickets");

            migrationBuilder.DropTable(
                name: "TicketLog");

            migrationBuilder.DropTable(
                name: "Users");

            //migrationBuilder.AlterColumn<int>(
            //    name: "DepartmentId",
            //    table: "Tickets",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int));

            //migrationBuilder.AlterColumn<int>(
            //    name: "CustomerId",
            //    table: "Tickets",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int));

            //migrationBuilder.AlterColumn<int>(
            //    name: "CauseId",
            //    table: "Tickets",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int));

            //migrationBuilder.AlterColumn<int>(
            //    name: "ApplicationId",
            //    table: "Tickets",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int));

            //migrationBuilder.AlterColumn<int>(
            //    name: "DepartmentId",
            //    table: "Applications",
            //    type: "int",
            //    nullable: true,
            //    oldClrType: typeof(int));

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Applications_Departments_DepartmentId",
            //    table: "Applications",
            //    column: "DepartmentId",
            //    principalTable: "Departments",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Restrict);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Applications_ApplicationId",
            //    table: "Tickets",
            //    column: "ApplicationId",
            //    principalTable: "Applications",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Restrict);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Causes_CauseId",
            //    table: "Tickets",
            //    column: "CauseId",
            //    principalTable: "Causes",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Restrict);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Customers_CustomerId",
            //    table: "Tickets",
            //    column: "CustomerId",
            //    principalTable: "Customers",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Restrict);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_Tickets_Departments_DepartmentId",
            //    table: "Tickets",
            //    column: "DepartmentId",
            //    principalTable: "Departments",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Restrict);
        }
    }
}
