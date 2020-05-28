using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using UE_ManagerWebApp.CustomAttributes;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Services
{
    public class TokenProvider
    {

        public string LoginUser(string username, string password, Users user)
        {
            try
            {
                if (user == null)
                    return null;

                if (password == user.Password && username == user.Username)
                {
                    //user.AccessLevel = Roles.ADMIN.ToString();
                    //Authentication successful, Issue Token with user credentials
                    //Provide the security key which was given in the JWToken configuration in Startup.cs
                    var key = Encoding.ASCII.GetBytes
                              ("YourKey-2374-OFFKDI940NG7:56753253-tyuw-5769-0921-kfirox29zoxv");
                    //Generate Token for user 
                    var JWToken = new JwtSecurityToken(
                        issuer: "http://localhost:44327/",
                        audience: "http://localhost:44327/",
                        claims: GetUserClaims(user),
                        notBefore: new DateTimeOffset(DateTime.Now).DateTime,
                        expires: new DateTimeOffset(DateTime.Now.AddDays(1)).DateTime,
                        //Using HS256 Algorithm to encrypt Token
                        signingCredentials: new SigningCredentials(new SymmetricSecurityKey(key),
                                            SecurityAlgorithms.HmacSha256Signature)
                    );
                    var token = new JwtSecurityTokenHandler().WriteToken(JWToken);
                    return token;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private IEnumerable<Claim> GetUserClaims(Users user)
        {
            IEnumerable<Claim> claims = new Claim[]
            {
                new Claim(ClaimTypes.Name, user.FirstName + " " + user.LastName),
                new Claim("Username", user.Username),
                new Claim("EmailID", user.EmailID),
                new Claim("AccessLevel", user.AccessLevel.ToUpper()),
                new Claim("ReadOnly", user.ReadOnly.ToUpper())
            };
            return claims;
        }
    }
}
