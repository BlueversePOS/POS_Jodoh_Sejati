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

        #region getListCompany
        [Route("getListCompany")]
        [HttpGet]
        public dynamic getListCompany()
        {
            try
            {
                List<Company> list = new List<Company>();
                list = repo.getListCompany(_DBConnection.dynamics);

                //list = repo.getListCompany(Startup.DBConfigDYNC);
                if (list.Count != 0)
                {
                    return list;
                }
                else
                {
                    return NotFound();
                }
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

        #region Lookup
        [Authorize]
        [Route("GetLookupGSR")]
        [HttpPost]
        public dynamic GetLookupGSR([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupGSR(param, db, user);
                return ds;
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

        [Authorize]
        [Route("GetLookupTransactionID")]
        [HttpPost]
        public dynamic GetLookupTransactionID([FromBody] mLookupParam param, string db)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupTransactionID(param, db);
                return ds;
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

        [Authorize]
        [Route("GetLookupSite")]
        [HttpPost]
        public dynamic GetLookupSiteByUser([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupSiteByUser(param, db, user);
                return ds;
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

        [Authorize]
        [Route("GetLookupSite2")]
        [HttpPost]
        public dynamic GetLookupSite([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupSite(param, db, user);
                return ds;
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

        [Authorize]
        [Route("GetLookupFrerNumber")]
        [HttpPost]
        public dynamic GetLookupFrerNumber([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupFrerNumber(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupBrancID")]
        [HttpPost]
        public dynamic GetLookupBrancID([FromBody] mLookupParam param, string db)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupBrancID(param, db);
                return ds;
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
        [Authorize]
        [Route("GetLookupUser")]
        [HttpPost]
        public dynamic GetLookupUser([FromBody] mLookupParam2 param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupUser(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupItembyTransaction")]
        [HttpPost]
        public dynamic GetLookupItembyTransaction([FromBody] mLookupParam2 param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupItembyTransaction(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupUofmByItem")]
        [HttpPost]
        public dynamic GetLookupUofmByItem([FromBody] mLookupParam2 param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupUofmByItem(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupBank")]
        [HttpPost]
        public dynamic GetLookupBank([FromBody] mLookupParam param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupBank(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupCurrency")]
        [HttpPost]
        public dynamic GetLookupCurrency([FromBody] mLookupParam2 param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupCurrency(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupITE_RefNo")]
        [HttpPost]
        public dynamic GetLookupITE_RefNo([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupITE_RefNo(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupITE_DocNbr")]
        [HttpPost]
        public dynamic GetLookupITE_DocNbr([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupITE_DocNbr(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupItemNbrBySiteID")]
        [HttpPost]
        public dynamic GetLookupItemNbrBySiteID([FromBody] mLookupParam2 param, string db)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupItemNbrBySiteID(param, db);
                return dt;
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
        [Authorize]
        [Route("GetLookupItemTransferNumber")]
        [HttpPost]
        public dynamic GetLookupItemTransferNumber([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupItemTransferNumber(param, db, user);
                return ds;
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
        [Authorize]
        [Route("getLookupItemTransferDocumenNumber")]
        [HttpPost]
        public dynamic getLookupItemTransferDocumenNumber([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupItemTransferDocumenNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("getLookupItemNumber")]
        [HttpPost]
        public dynamic getLookupItemNumber([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupItemNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("getLookupFREREntertainNumber")]
        [HttpPost]
        public dynamic getLookupFREREntertainNumber([FromBody] mLookupParam2 param, string db, string user)
            {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupFREREntertainNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("getLookupEntertainID")]
        [HttpPost]
        public dynamic getLookupEntertainID([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupEntertainID(param, db);
                return dt;
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
        [Authorize]
        [Route("getLookupFRERPerjalananDinasNumber")]
        [HttpPost]
        public dynamic getLookupFRERPerjalananDinasNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupFRERPerjalananDinasNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupFRERKotaTujuan")]
        [HttpPost]
        public dynamic GetLookupFRERKotaTujuan([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupFRERKotaTujuan(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupFRERKeperluanDinas")]
        [HttpPost]
        public dynamic GetLookupFRERKeperluanDinas([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupFRERKeperluanDinas(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupTravelExpense2")]
        [HttpPost]
        public dynamic GetLookupTravelExpense2([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupTravelExpense2(param, db, user);
                return dt;
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

        [Authorize]
        [Route("GetLookupTravelExpense")]
        [HttpPost]
        public dynamic GetLookupTravelExpense([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupTravelExpense(param, db, user);
                return dt;
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

        [Authorize]
        [Route("getLookupFRERPromotionNumber")]
        [HttpPost]
        public dynamic getLookupFRERPromotionNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupFRERPromotionNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupTransactionID_Promotion")]
        [HttpPost]
        public dynamic GetLookupTransactionID_Promotion([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupTransactionID_Promotion(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupLinkGSRNumber")]
        [HttpPost]
        public dynamic GetLookupLinkGSRNumber([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupLinkGSRNumber(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupPromotionExpense")]
        [HttpPost]
        public dynamic GetLookupPromotionExpense([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupPromotionExpense(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupDivisionID")]
        [HttpPost]
        public dynamic GetLookupDivisionID([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupDivisionID(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupPPH")]
        [HttpPost]
        public dynamic GetLookupPPH([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupPPH(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupVendorID")]
        [HttpPost]
        public dynamic GetLookupVendorID([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupVendorID(param, db, user);
                return ds;
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
        [Authorize]
        [Route("getlookupFRERBiayaUmumNumber")]
        [HttpPost]
        public dynamic getlookupFRERBiayaUmumNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getlookupFRERBiayaUmumNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupFRERCategoryTrxBU")]
        [HttpPost]
        public dynamic GetLookupFRERCategoryTrxBU([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupFRERCategoryTrxBU(param, db, user);
                return ds;
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

        [Authorize]
        [Route("GetLookupFRERCategoryTrxBUF")]
        [HttpPost]
        public dynamic GetLookupFRERCategoryTrxBUF([FromBody] mLookupParam param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupFRERCategoryTrxBUF(param, db, user);
                return ds;
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
        [Authorize]
        [Route("GetLookupTransactionID_BiayaUmum2")]
        [HttpPost]
        public dynamic GetLookupTransactionID_BiayaUmum2([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupTransactionID_BiayaUmum2(param, db, user);
                return dt;
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
        [Authorize]
        [Route("getlookupFRERBiayaUmumFinanceNumber")]
        [HttpPost]
        public dynamic getlookupFRERBiayaUmumFinanceNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getlookupFRERBiayaUmumFinanceNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("getLookupFRERPettycashNumber")]
        [HttpPost]
        public dynamic getLookupFRERPettycashNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.getLookupFRERPettycashNumber(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupFRERNumberByFRERType")]
        [HttpPost]
        public dynamic GetLookupFRERNumberByFRERType([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupFRERNumberByFRERType(param, db, user);
                return dt;
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
        [Authorize]
        [Route("GetLookupFRERSettlementNumber")]
        [HttpPost]
        public dynamic GetLookupFRERSettlementNumber([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupFRERSettlementNumber(param, db, user);
                return ds;
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

        [Authorize]
        [Route("GetLookupFRERInquiry")]
        [HttpPost]
        public dynamic GetLookupFRERInquiry([FromBody] mLookupParam2 param, string db, string user)
        {
            try
            {
                DataSet dt = null;
                dt = repo.GetLookupFRERInquiry(param, db, user);
                return dt;
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

        [Authorize]
        [Route("GetLookupPPN")]
        [HttpPost]
        public dynamic GetLookupPPN([FromBody] mLookupParam param, string db)
        {
            try
            {
                DataSet ds = null;
                ds = repo.GetLookupPPN(param, db);
                return ds;
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

        #region REPORT
        [Authorize]
        [Route("ReportStokGudang")]
        [HttpGet]
        public dynamic ReportStokGudang(string db, string FromLocCode, string ToLocCode, int AllOrNot, string sortBy)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ReportStokGudang(db, FromLocCode, ToLocCode, AllOrNot, sortBy);
                return dt;
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
        [Authorize]
        [Route("ReportMutasiStokGudang")]
        [HttpGet]
        public dynamic ReportMutasiStokGudang(string db, string FromDocDate, string ToDocDate, string FromLocCode, string ToLocCode, int AllOrNot)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ReportMutasiStokGudang(db, FromDocDate, ToDocDate, FromLocCode, ToLocCode, AllOrNot);
                return dt;
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
        [Authorize]
        [Route("ReportStatusDokumenPrioritas")]
        [HttpGet]
        public dynamic ReportStatusDokumenPrioritas(string db, string FromDocDate, string ToDocDate, string reqfrom, string regto, string gsrfrom, string gsrto, string status, string OrderBy)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ReportStatusDokumenPrioritas(db, FromDocDate, ToDocDate, reqfrom, regto, gsrfrom, gsrto, status, OrderBy);
                return dt;
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
        [Authorize]
        [Route("ReportOutstandingAdvPrioritas")]
        [HttpGet]
        public dynamic ReportOutstandingAdvPrioritas(string db, string frertype, string cfrom, string cto, string OrderBy)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ReportOutstandingAdvPrioritas(db, frertype, cfrom, cto, OrderBy);
                return dt;
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
        [Authorize]
        [Route("ReportStatusFRERPrioritas")]
        [HttpGet]
        public dynamic ReportStatusFRERPrioritas(string db, string reqfrom, string regto, string frertype, string frerfrom,
            string frerto, int FRERAdvanceInteger, string status, string OrderBy)
        {
            try
            {
                DataTable dt = null;
                dt = repo.ReportStatusFRERPrioritas(db, reqfrom, regto, frertype, frerfrom,
                frerto, FRERAdvanceInteger, status, OrderBy);
                return dt;
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
        [Authorize]
        [Route("GSRReport")]
        [HttpGet]
        public dynamic GSRReport(string db, string GSRNumber, string user)
        {
            try
            {
                DataTable dt = null;
                var date = DateTime.Now.ToString("yyyy-MM-dd");
                dt = repo.GSRReport(db, GSRNumber, user, date);
                return dt;
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
        [Authorize]
        [Route("FREREntertainReport")]
        [HttpGet]
        public dynamic FREREntertainReport(string db, string FRERNumber)
        {
            try
            {
                DataTable dt = null;
                dt = repo.FREREntertainReport(db, FRERNumber);
                return dt;
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
        [Authorize]
        [Route("FRERPerjalananDinasReport")]
        [HttpGet]
        public dynamic FRERPerjalananDinasReport(string db, string FRERNumber)
        {
            try
            {
                DataTable dt = null;
                dt = repo.FRERPerjalananDinasReport(db, FRERNumber);
                return dt;
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
        [Authorize]
        [Route("FRERPromotionReport")]
        [HttpGet]
        public dynamic FRERPromotionReport(string db, string FRERNumber)
        {
            try
            {
                DataTable dt = null;
                dt = repo.FRERPromotionReport(db, FRERNumber);
                return dt;
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
        [Authorize]
        [Route("FRERBiayaUmumReport")]
        [HttpGet]
        public dynamic FRERBiayaUmumReport(string db, string FRERNumber)
        {
            try
            {
                DataTable dt = null;
                dt = repo.FRERBiayaUmumReport(db, FRERNumber);
                return dt;
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
        [Authorize]
        [Route("FRERBiayaUmumFinanceReport")]
        [HttpGet]
        public dynamic FRERBiayaUmumFinanceReport(string db, string FRERNumber)
        {
            try
            {
                DataTable dt = null;
                dt = repo.FRERBiayaUmumFinanceReport(db, FRERNumber);
                return dt;
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

        #region UploadFile
        [Authorize]
        [Route("UploadFile")]
        [HttpPost]
        public string UploadFile([FromForm] UploadFile objfile, string location)
        {
            string retval = string.Empty;
            try
            {

                if (objfile.file.Length > 0)
                {
                    if (!Directory.Exists(location))
                    {
                        Directory.CreateDirectory(location);
                    }

                    using (FileStream fileStream = System.IO.File.Create(location + objfile.file.FileName))
                    {
                        objfile.file.CopyTo(fileStream);
                        fileStream.Flush();

                        retval = "";
                    }

                }
                else
                {
                    retval = "Backup Failed";
                }

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

            return retval;
        }

        [Authorize]
        [Route("DeleteFile")]
        [HttpPost]
        public string DeleteFile(string location)
        {
            string retval = string.Empty;
            try
            {

                if (location != "")
                {
                    FileInfo file = new FileInfo(location);
                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    retval = "";

                }
                else
                {
                    retval = "Delete Failed";
                }

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

            return retval;
        }

        [Authorize]
        [Route("UploadFile_WinSCP")]
        [HttpPost]
        public string UploadFile_WinSCP([FromForm] UploadFile objfile, string location)
        {
            string retval = "Backup Failed";
            string sourcefilepath = location + objfile.file.FileName;
            int type = objfile.type;
            string db = objfile.db;
            try
            {
                string length = string.Empty;
                if (objfile.file.Length >= (1 << 10))
                    length = string.Format("{0}", objfile.file.Length >> 10);


                string ftpurl = _config["FTPUrl"]; //"192.168.1.10";//ConfigurationManager.AppSettings["FTPUrl"];
                string ftpusername = _config["FTPUsername"]; //"administrator";//ConfigurationManager.AppSettings["FTPUsername"];
                string ftppassword = _config["FTPPassword"]; //"C8s0f09";//ConfigurationManager.AppSettings["FTPPassword"];
                int ftpport = Convert.ToInt32(_config["FTPPort"]); //22;//ConfigurationManager.AppSettings["FTPPort"];
                string ftpSSHFingerPrint = _config["SSHFingerPrint"]; //"LEFu0WUbBqmAFI/V43vg3YjU3iFRRaEFIZ9+4xCGyLE";//ConfigurationManager.AppSettings["SSHFingerPrint"];

                //string ftpfilepath = "E:/AttachmentEGER/"; //$@"{location.Replace("\\", @"/").Trim()}WinSCP/"; //lokasi simpan file

                string ftpfilepath = $@"{sourcefilepath.Replace("\\", @"/").Trim()}"; //lokasi simpan file
                ftpfilepath = ftpfilepath.Substring(2, ftpfilepath.Length - 2);


                string ftpdirpath = $@"{Path.GetDirectoryName(sourcefilepath).Replace("\\", @"/").Trim()}"; //lokasi simpan file
                ftpdirpath = ftpdirpath.Substring(2, ftpdirpath.Length - 2);

                SessionOptions sessionOptions = new SessionOptions
                {
                    Protocol = Protocol.Sftp,
                    HostName = ftpurl,
                    UserName = ftpusername,
                    Password = ftppassword,
                    PortNumber = ftpport,
                    SshHostKeyFingerprint = ftpSSHFingerPrint
                };

                if (objfile.file.Length > 0)
                {
                    if (!Directory.Exists(location))
                    {
                        Directory.CreateDirectory(location);
                    }

                    using (FileStream fileStream = System.IO.File.Create(sourcefilepath))
                    {
                        objfile.file.CopyTo(fileStream);
                        fileStream.Flush();
                        fileStream.Dispose();


                        string filename = Path.GetFileName(sourcefilepath);
                        //string ftpfullpath = ftpurl + "/" + filename;

                        using (Session session = new Session())
                        {
                            // Connect
                            session.Open(sessionOptions);

                            // Upload files
                            TransferOptions transferOptions = new TransferOptions();
                            transferOptions.TransferMode = TransferMode.Binary;
                            TransferOperationResult transferResult;

                            string[] strpath = ftpdirpath.Split('/');
                            string getpath = "";

                            foreach (var str in strpath)
                            {
                                getpath = getpath + str + "/";

                                if (str.Length > 1)
                                {
                                    if (!session.FileExists(Path.GetDirectoryName(getpath)))
                                    {
                                        session.CreateDirectory(getpath);
                                    }
                                }
                            }

                            transferResult = session.PutFiles(sourcefilepath, ftpfilepath, false, transferOptions);
                            //transferResult = session.GetFiles(sourcefilepath, "/WinSCP/", false, transferOptions);

                            // Throw on any error
                            transferResult.Check();

                            // Print results
                            foreach (TransferEventArgs transfer in transferResult.Transfers)
                            {
                                retval = "";

                                FileInfo file = new FileInfo(sourcefilepath);
                                if (file.Exists)
                                {
                                    file.Delete();
                                }
                            }
                        }
                    }

                }
                else
                {
                    retval = "Backup Failed";
                }

            }
            catch (Exception ex)
            {
                string thismethod = System.Reflection.MethodBase.GetCurrentMethod().Name;
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = db,
                    msg = ex.Message
                };
                Insert_Request_Logs(log);

                dynamic result = new
                {
                    code = (int)HttpStatusCode.BadRequest,
                    desc = ex.Message.Replace("\"", string.Empty)
                };
                //return StatusCode(result.code, result.desc);
                return ex.Message.ToString();
            }

            return retval;
        }
        #endregion

    }

}
