using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace System.Web.Mvc
{
    public static class HtmlHelperExtensions
    {
        public static string CurrentViewName(this HtmlHelper html)
        {
            return System.IO.Path.GetFileNameWithoutExtension(
                ((RazorView)html.ViewContext.View).ViewPath
            );
        }
        public static IEnumerable<KeyValuePair<int, string>> ListEnums<T>() where T : struct, IConvertible
        {
            foreach (int value in Enum.GetValues(typeof(T)))
            {
                yield return new KeyValuePair<int, string>(value, value.ToString());
            }
        }
    }
}

