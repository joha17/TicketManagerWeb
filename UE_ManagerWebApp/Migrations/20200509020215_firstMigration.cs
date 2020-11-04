using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UE_ManagerWebApp.Migrations
{
    public partial class firstMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Causes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(nullable: true),
                    CreationDate = table.Column<DateTime>(nullable: true),
                    CreationUser = table.Column<string>(nullable: true),
                    UpdateDate = table.Column<DateTime>(nullable: true),
                    UpdateUser = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Causes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerCode = table.Column<string>(nullable: true),
                    CustomerName = table.Column<string>(nullable: true),
                    Status = table.Column<string>(nullable: true),
                    IssuerAdquier = table.Column<string>(nullable: true),
                    CreationDate = table.Column<DateTime>(nullable: true),
                    CreationUser = table.Column<string>(nullable: true),
                    UpdateDate = table.Column<DateTime>(nullable: true),
                    UpdateUser = table.Column<string>(nullable: true),
                    CountryCode = table.Column<string>(nullable: true),
                    Wallet = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Departments",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(nullable: true),
                    Creation_Date = table.Column<DateTime>(nullable: true),
                    Create_User = table.Column<string>(nullable: true),
                    Update_Date = table.Column<DateTime>(nullable: true),
                    Update_User = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Departments", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Applications",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ApplicationName = table.Column<string>(nullable: true),
                    ApplicationType = table.Column<int>(nullable: false),
                    DepartmentId = table.Column<int>(nullable: true),
                    CreationDate = table.Column<DateTime>(nullable: true),
                    CreationUser = table.Column<string>(nullable: true),
                    UpdateDate = table.Column<DateTime>(nullable: true),
                    UpdateUser = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Applications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Applications_Departments_DepartmentId",
                        column: x => x.DepartmentId,
                        principalTable: "Departments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Tickets",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TicketNumber = table.Column<string>(nullable: true),
                    Keyword = table.Column<string>(nullable: true),
                    AssignDate = table.Column<DateTime>(nullable: true),
                    EndDate = table.Column<DateTime>(nullable: true),
                    Comment = table.Column<string>(nullable: true),
                    CreationUser = table.Column<string>(nullable: true),
                    CreationDate = table.Column<DateTime>(nullable: true),
                    UpdateUser = table.Column<string>(nullable: true),
                    UpdateDate = table.Column<DateTime>(nullable: true),
                    AssignUser = table.Column<string>(nullable: true),
                    ApplicationId = table.Column<int>(nullable: true),
                    CauseId = table.Column<int>(nullable: true),
                    DepartmentId = table.Column<int>(nullable: true),
                    CustomerId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tickets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Tickets_Applications_ApplicationId",
                        column: x => x.ApplicationId,
                        principalTable: "Applications",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Tickets_Causes_CauseId",
                        column: x => x.CauseId,
                        principalTable: "Causes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Tickets_Customers_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Tickets_Departments_DepartmentId",
                        column: x => x.DepartmentId,
                        principalTable: "Departments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Applications_DepartmentId",
                table: "Applications",
                column: "DepartmentId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_ApplicationId",
                table: "Tickets",
                column: "ApplicationId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_CauseId",
                table: "Tickets",
                column: "CauseId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_CustomerId",
                table: "Tickets",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_Tickets_DepartmentId",
                table: "Tickets",
                column: "DepartmentId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tickets");

            migrationBuilder.DropTable(
                name: "Applications");

            migrationBuilder.DropTable(
                name: "Causes");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropTable(
                name: "Departments");
        }
    }
}
