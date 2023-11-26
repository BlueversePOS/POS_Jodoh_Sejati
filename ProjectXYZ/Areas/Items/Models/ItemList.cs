using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectXYZ.Areas.Items.Models
{
    public class ItemList
    {
        public string Item_Number { get; set; } = string.Empty;
        public string Item_Name { get; set; } = string.Empty;
        public string Item_Description { get; set; } = string.Empty;
        public string UOFM { get; set; } = string.Empty;
        public string Category_ID { get; set; } = string.Empty;
        public int Item_Sales { get; set; }
        public int Item_SoldBy { get; set; }
        public decimal Item_Price { get; set; }
        public decimal Item_Cost { get; set; }
        public string Item_SKU { get; set; } = string.Empty;
        public string Item_Barcode { get; set; } = string.Empty;
        public int Composite_Item { get; set; }
        public int Track_Stock { get; set; }
        public int InStock { get; set; }
        public int LowStock { get; set; }
        public int Tax_10 { get; set; }
        public int Representation { get; set; }
        public string Item_Color { get; set; } = string.Empty;
        public string Item_Shape { get; set; } = string.Empty;
        public string Item_Image { get; set; } = string.Empty;
        public List<CompositeItems> CompositeItem { get; set; }
        public List<ItemVariants> ItemVariant { get; set; }
    }

    public class CompositeItems
    {
        public string Item_Number { get; set; } = string.Empty;
        public int Item_Quantity { get; set; }
        public decimal Item_Cost { get; set; }
        public string Item_Composite { get; set; } = string.Empty;
    }

    public class ItemVariants
    {
        public string Item_Number { get; set; } = string.Empty;
        public decimal LineItem_Option { get; set; }
        public int CB_Available { get; set; }
        public string Option_ID { get; set; } = string.Empty;
        public string Option_Name { get; set; } = string.Empty;
        public decimal LineItem_Variant { get; set; }
        public string Variant_Name { get; set; } = string.Empty;
        public decimal Item_Price { get; set; }
        public decimal Item_Cost { get; set; }
        public int InStock { get; set; }
        public int LowStock { get; set; }
        public int OptimalStock { get; set; }
        public string Item_SKU { get; set; } = string.Empty;
        public string Item_Barcode { get; set; } = string.Empty;
    }
}