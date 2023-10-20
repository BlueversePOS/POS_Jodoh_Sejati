using ProjectXYZAPI.Model;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Interfaces;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;

namespace ProjectXYZAPI
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                 .SetBasePath(env.ContentRootPath)
                 .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                 .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                 .AddEnvironmentVariables();
            Configuration = builder.Build();
        }

        public IHostingEnvironment HostingEnvironment { get; private set; }

        public IConfiguration Configuration { get; }

        public static string DBConfigDS = string.Empty;
        public static string DBConfigDB = string.Empty;
        public static string DBConfigDYNC = string.Empty;
        public static string DBConfigDBAPI = string.Empty;
        public static string DBConfigUser = string.Empty;
        public static string DBConfigPwd = string.Empty;

        public static string _contentPath = string.Empty;

        //add by abdul 20220906
        public static string FTPUrl = string.Empty;
        public static string FTPUsername = string.Empty;
        public static string FTPPassword = string.Empty;
        public static string FTPPort = string.Empty;
        public static string SSHFingerPrint = string.Empty;
        
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials().Build());

            });

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = Configuration["JwtConfig:Issuer"],
                        ValidAudience = Configuration["JwtConfig:Issuer"],
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JwtConfig:Key"]))
                    };
                });

            services.Configure<FormOptions>(o =>
            {
                o.ValueLengthLimit = int.MaxValue;
                o.MultipartBodyLengthLimit = int.MaxValue;
                o.MultipartHeadersLengthLimit = int.MaxValue;
            });


            var dbConfig = Configuration
               .GetSection("DBConn")
               .Get<DBConn>();
            services.AddSingleton(dbConfig);


            //services.AddControllers();

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            // Register the Swagger generator, defining 1 or more Swagger documents
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1",
                    new Microsoft.OpenApi.Models.OpenApiInfo
                    {
                        Title = "API Blueverse POS",
                        Version = "v1",
                        Description = "An ASP.NET Core Web API Blueverse",
                        //TermsOfService = new Uri("https://openmyportal.com"),
                        License = new OpenApiLicense() { Name = "Blueverse License" }
                        //, Extensions = new Dictionary<string, IOpenApiExtension>
                        //{
                        //  {"x-logo", new OpenApiObject
                        //    {
                        //       {"url", new OpenApiString("https://openmyportal.com/main/adminlte/img/logoartha2.png")},
                        //       { "altText", new OpenApiString("Openmyportal")}
                        //    }
                        //  }
                        //}

                    });

                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());

                // Set the comments path for the Swagger JSON and UI.
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlFilePath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                if (File.Exists(xmlFilePath))
                    c.IncludeXmlComments(xmlFilePath);

                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.Http,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 1safsfsdfdfd\"",
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement {
                    {
                        new OpenApiSecurityScheme {
                            Reference = new OpenApiReference {
                                Type = ReferenceType.SecurityScheme,
                                    Id = "Bearer"
                            },
                            Scheme = "oauth2",
                            Name = "Bearer",
                            In = ParameterLocation.Header
                        },
                        new string[] {}
                    }
                });

                c.EnableAnnotations();
            });
        }

        public static TokenValidationParameters tokenValidationParameters;

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            this.HostingEnvironment = env;
            this.Configuration = configuration;
            _contentPath = env.ContentRootPath;
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            //app.UseCors("AllowAll");
            //if (env.IsDevelopment())
            //{
                app.UseDeveloperExceptionPage();

                app.UseSwagger();
                // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
                // specifying the Swagger JSON endpoint.
                app.UseSwaggerUI(c =>
                {
                    string swaggerJsonBasePath = string.IsNullOrWhiteSpace(c.RoutePrefix) ? "." : "..";
                    c.SwaggerEndpoint($"{swaggerJsonBasePath}/swagger/v1/swagger.json", "Version 1.0-API Blueverse");
                    //c.RoutePrefix = string.Empty;
                });
            //}            

            app.UseAuthentication();


            app.UseHttpsRedirection();
            app.UseMvc();
            DBConfigDS = Configuration["DBConfigDS"];
            DBConfigDB = Configuration["DBConfigDB"];
            DBConfigDYNC = Configuration["DBConfigDYNC"];
            DBConfigUser = Configuration["DBConfigUser"];
            DBConfigPwd = Configuration["DBConfigPwd"];

            //FTPUrl = Configuration["FTPUrl"];
            //FTPUsername = Configuration["FTPUsername"];
            //FTPPassword = Configuration["FTPPassword"];
            //FTPPort = Configuration["FTPPort"];
            //SSHFingerPrint = Configuration["SSHFingerPrint"];
        }

        public static string ConnectionStringBuild(string db)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();

            //string decryptPass = FunctionHelper.Decrypt(DBConfigPwd);

            db = string.IsNullOrEmpty(db) ? DBConfigDB : db;

            builder.DataSource = DBConfigDS;
            builder.InitialCatalog = db;
            builder.UserID = DBConfigUser;
            builder.Password = DBConfigPwd;

            return builder.ConnectionString;
        }
    }
}
