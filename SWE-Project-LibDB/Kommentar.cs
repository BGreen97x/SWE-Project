//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SWE_Project_LibDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kommentar
    {
        public int Id { get; set; }
        public string Inhalt { get; set; }
        public int ProjektId { get; set; }
        public int UserUserId { get; set; }
    
        public virtual Projekt Projekt { get; set; }
        public virtual User User { get; set; }
    }
}
