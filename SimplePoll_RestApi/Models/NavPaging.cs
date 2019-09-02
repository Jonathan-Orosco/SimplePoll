using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Routing;


namespace SimplePoll_RestApi.Models
{
    public class NavPaging
    {
        public byte PageSize { get; set; }
        public short PageIndex { get; set; }
        public int PageTotal { get; set; }
        public string ActionName { get; set; }
        private RouteValueDictionary _RouteValues = null;
        public RouteValueDictionary RouteValues
        {
            get
            {
                if (_RouteValues == null)
                {
                    _RouteValues = new RouteValueDictionary();
                }
                return _RouteValues;
            }
            set
            {
                _RouteValues = value;
            }
        }
    }


}