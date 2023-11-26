using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Employees.Models
{
	public class AccessRights
	{
		public string UserID { get; set; }
		public string Role_ID { get; set; }
		public string Role_Name { get; set; }
		public int POS_Flag { get; set; }
		public int POS_AccessPayments { get; set; }
		public int POS_ApplyDiscount { get; set; }
		public int POS_ChangeTaxes { get; set; }
		public int POS_ViewReceipt { get; set; }
		public int POS_ReprintSendReceipt { get; set; }
		public int POS_ViewShift { get; set; }
		public int POS_ManageItemsPOS { get; set; }
		public int POS_ViewCostPOS { get; set; }
		public int POS_ChangeSetting { get; set; }
		public int BckOffice_Flag { get; set; }
		public int BckOffice_ViewSales { get; set; }
		public int BckOffice_ManageItemsOff { get; set; }
		public int BckOffice_ViewCostOff { get; set; }
		public int BckOffice_ManageEmployee { get; set; }
		public int BckOffice_ManageCustomers { get; set; }
		public int BckOffice_EditSetting { get; set; }
		public int BckOffice_ManagePayTypes { get; set; }
		public int BckOffice_ManageTaxes { get; set; }
		public int BckOffice_POSDevices { get; set; }

    }
}