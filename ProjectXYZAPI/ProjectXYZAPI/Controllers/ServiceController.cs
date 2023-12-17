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
using Microsoft.OpenApi.Writers;

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

        [Route("ResetPassword")]
        [HttpPost]
        public dynamic ResetPassword([FromBody] UserLogin param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ResetPassword(param);
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
        [HttpPost]
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

        [Route("GetAccessRightDetail")]
        [HttpPost]
        public dynamic GetAccessRightDetail([FromBody] AccessRight param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetAccessRightDetail(param);
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

        [Route("SaveAccessRight")]
        [HttpPost]
        public dynamic SaveAccessRight([FromBody] AccessRight param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveAccessRight(param);
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

        [Route("SaveEmployee")]
        [HttpPost]
        public dynamic SaveEmployee([FromBody] Employee param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveEmployee(param);
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

        [Route("GetEmployee")]
        [HttpPost]
        public dynamic GetEmployee([FromBody] Employee param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetEmployee(param);
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

        #region Account

        [Route("GetDataAccount")]
        [HttpPost]
        public dynamic GetDataAccount([FromBody] Accounts param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataAccount(param);
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

        [Route("SaveAccount")]
        [HttpPost]
        public dynamic SaveAccount([FromBody] Accounts param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveAccount(param);
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

        #region Item List

        [Route("GetDataDiscount")]
        [HttpPost]
        public dynamic GetDataDiscount(string authorization)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataDiscount();
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

        [Route("SaveDiscount")]
        [HttpPost]
        public dynamic SaveDiscount([FromBody] Discount param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveDiscount(param);
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

        [Route("GetDataCategories")]
        [HttpPost]
        public dynamic GetDataCategories(string authorization)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataCategories();
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

        [Route("SaveCategories")]
        [HttpPost]
        public dynamic SaveCategories([FromBody] Category param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveCategories(param);
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

        [Route("SaveItem")]
        [HttpPost]
        public dynamic SaveItem([FromBody] ItemList param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveItem(param);
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

        [Route("GetCompositeItems")]
        [HttpPost]
        public dynamic GetCompositeItems([FromBody] FilterItem param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetCompositeItems(param);
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

        [Route("GetDataItems")]
        [HttpPost]
        public dynamic GetDataItems([FromBody] FilterItem param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataItems(param);
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

        [Route("GetDataItemComposite")]
        [HttpPost]
        public dynamic GetDataItemComposite([FromBody] FilterItem param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataItemComposite(param);
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

        [Route("GetDataItemVariant")]
        [HttpPost]
        public dynamic GetDataItemVariant([FromBody] FilterItem param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataItemVariant(param);
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

        #region Customers

        [Route("GetDatalistCustomer")]
        [HttpPost]
        public dynamic GetDatalistCustomer([FromBody] Customers param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDatalistCustomer(param);
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

        [Route("GetDataCustomer")]
        [HttpPost]
        public dynamic GetDataCustomer([FromBody] Customers param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataCustomer(param);
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

        [Route("SaveCustomer")]
        [HttpPost]
        public dynamic SaveCustomer([FromBody] Customers param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveCustomer(param);
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

        #region Setting

        [Route("GetDataFeatures")]
        [HttpPost]
        public dynamic GetDataFeatures([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataFeatures(param);
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

        [Route("SaveFeatures")]
        [HttpPost]
        public dynamic SaveFeatures([FromBody] Features param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveFeatures(param);
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

        [Route("GetDataPaymentType")]
        [HttpPost]
        public dynamic GetDataPaymentType([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataPaymentType(param);
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

        [Route("SavePaymentType")]
        [HttpPost]
        public dynamic SavePaymentType([FromBody] PaymentType param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SavePaymentType(param);
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

        [Route("GetDataTaxes")]
        [HttpPost]
        public dynamic GetDataTaxes([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataTaxes(param);
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

        [Route("GetDataStores")]
        [HttpPost]
        public dynamic GetDataStores([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataStores(param);
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

        [Route("SaveStore")]
        [HttpPost]
        public dynamic SaveStore([FromBody] Stores param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveStore(param);
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

        [Route("GetDataSalesType")]
        [HttpPost]
        public dynamic GetDataSalesType([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataSalesType(param);
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

        [Route("SaveSalesType")]
        [HttpPost]
        public dynamic SaveSalesType([FromBody] SalesType param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveSalesType(param);
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

        [Route("GetDataSites")]
        [HttpPost]
        public dynamic GetDataSites([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataSites(param);
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

        [Route("SaveSite")]
        [HttpPost]
        public dynamic SaveSite([FromBody] Sites param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveSite(param);
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

        [Route("GetDataDevices")]
        [HttpPost]
        public dynamic GetDataDevices([FromBody] Param param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.GetDataDevices(param);
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

        [Route("SaveDevice")]
        [HttpPost]
        public dynamic SaveDevice([FromBody] Devices param)
        {
            try
            {
                DataTable dt = null;
                dt = repo.SaveDevice(param);
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
