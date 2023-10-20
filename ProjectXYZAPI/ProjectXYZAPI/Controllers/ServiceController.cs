using ProjectXYZAPI.Model;
using ProjectXYZAPI.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using WinSCP;
using static ProjectXYZAPI.FunctionHelper;

namespace ProjectXYZAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly Repo repo;
        private readonly SqlDBHelper sql;
        private readonly DBConn _DBConnection;
        private IConfiguration _config;

        public ServiceController(DBConn DBConnect, IConfiguration config)
        {
            _config = config;
            repo = new Repo(_config);
            sql = new SqlDBHelper();
            _DBConnection = DBConnect;
        }

        #region isLoginValidOrNot
        [Route("isLoginValidOrNot")]
        [HttpPost]
        public dynamic isLoginValidOrNot([FromBody] isLogin param)
        {
            try
            {
                dynamic status = repo.isLoginValidOrNot(param);
                return status;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return StatusCode(result.code, result.desc);
            }
        }

        [Route("isLoginSession")]
        [HttpPost]
        public dynamic isLoginSession([FromBody] isLogin param)
        {
            try
            {
                dynamic status = repo.isLoginSession(param);
                return status;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return StatusCode(result.code, result.desc);
            }
        }

        [Route("is_User_Validation")]
        [HttpPost]
        public dynamic is_User_Validation([FromBody] isLogin param)
        {
            try
            {
                string status = repo.is_User_Validation(param);
                return status;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return StatusCode(result.code, result.desc);
            }
        }

        [Route("is_User_Validation_Change")]
        [HttpPost]
        public dynamic is_User_Validation_Change([FromBody] isLogin param)
        {
            try
            {
                string status = repo.is_User_Validation_Change(param);
                return status;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return StatusCode(result.code, result.desc);
            }
        }

        [Route("is_User_Unlocked")]
        [HttpPost]
        public dynamic is_User_Unlocked([FromBody] isLogin param)
        {
            try
            {
                string status = repo.is_User_Unlocked(param);
                return status;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return StatusCode(result.code, result.desc);
            }
        }

        #endregion

        #region USER

        [Route("getDataUser")]
        [HttpPost]
        public dynamic getDataUser([FromBody] UserLogin param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.getDataUser(param);
                return dt;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return result;
            }
        }

        [Route("SignUpUser")]
        [HttpPost]
        public dynamic SignUpUser([FromBody] UserAccount param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SignUpUser(param);
                return dt;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return result;
            }
        }

        #endregion

        #region Employee

        [Route("GetAccessRight")]
        [HttpGet]
        public dynamic GetAccessRight()
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetAccessRight();
                return dt;
            }
            catch (Exception ex)
            {
                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.ToString()
                };
                return result;
            }
        }

        #endregion

    }

}
