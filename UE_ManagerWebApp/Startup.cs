using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using UE_ManagerWebApp.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Http;
using UE_ManagerWebApp.CustomAttributes;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.ViewFeatures;

namespace UE_ManagerWebApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc(options => options.EnableEndpointRouting = false);
            services.AddSession(options => {
                options.IdleTimeout = TimeSpan.FromMinutes(120);
            });
            services.AddSingleton<ITempDataProvider, CookieTempDataProvider>();

            services.AddDbContext<UEManagerDBContext>(options =>
                    options.UseSqlServer(Configuration.GetConnectionString("UETDBConn")));

            services.AddDbContext<AuthDBContext>(options =>
                    options.UseSqlServer(Configuration.GetConnectionString("AuthDBConn")));

            //services.AddSingleton<IAuthorizationHandler, RoleRequirement>();

            services.AddSingleton<IAuthorizationHandler, RoleHandler>();

            services.AddAuthorization(options =>
            {
                options.AddPolicy("IsAdmin",
                    policy => policy.RequireClaim("AccessLevel")
                    .AddRequirements(new RoleRequirement("")));
            });

            


            //Provide a secret key to Encrypt and Decrypt the Token - JRozario
            var SecretKey = Encoding.ASCII.GetBytes("YourKey-2374-OFFKDI940NG7:56753253-tyuw-5769-0921-kfirox29zoxv");
            //Configure JWT Token Authentication - JRozario
            services.AddAuthentication(auth =>
            {
                auth.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                auth.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(token =>
            {
                token.RequireHttpsMetadata = false;
                token.SaveToken = true;
                token.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(SecretKey),
                    ValidateIssuer = true,
                    //Usually this is your application base URL - JRozario
                    ValidIssuer = "http://localhost:44327/",
                    ValidateAudience = true,
                    //Here we are creating and using JWT within the same application. In this case base URL is fine - JRozario
                    //If the JWT is created using a web service then this could be the consumer URL - JRozario
                    ValidAudience = "http://localhost:44327/",
                    RequireExpirationTime = true,
                    LifetimeValidator = LifetimeValidator,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public bool LifetimeValidator(DateTime? notBefore, DateTime? expires, SecurityToken securityToken, TokenValidationParameters validationParameters)
        {
            if (expires != null)
            {
                if (DateTime.UtcNow < expires.Value.ToLocalTime()) return true;
            }
            return false;
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseCookiePolicy();

            //Addd User session - JRozario
            app.UseSession();

            //Add JWToken to all incoming HTTP Request Header - JRozario
            app.Use(async (context, next) =>
            {
                var JWToken = context.Session.GetString("JWToken");
                if (!string.IsNullOrEmpty(JWToken))
                {
                    context.Request.Headers.Add("Authorization", "Bearer " + JWToken);
                }
                await next();
            });
            //Add JWToken Authentication service - JRozario
            app.UseAuthentication();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Authentication}/{action=LoginUser}/{id?}");
            });
        }
    }
}
