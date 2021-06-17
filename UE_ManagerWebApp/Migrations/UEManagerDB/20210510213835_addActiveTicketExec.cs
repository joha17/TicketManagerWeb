using Microsoft.EntityFrameworkCore.Migrations;

namespace UE_ManagerWebApp.Migrations.UEManagerDB
{
    public partial class addActiveTicketExec : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Active",
                table: "TicketExecution",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Active",
                table: "TicketExecution");
        }
    }
}
