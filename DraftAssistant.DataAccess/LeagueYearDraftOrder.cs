//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DraftAssistant.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class LeagueYearDraftOrder
    {
        public int Id { get; set; }
        public int FantasyTeamId { get; set; }
        public int LeagueYearId { get; set; }
        public short Position { get; set; }
    
        public virtual FantasyTeam FantasyTeam { get; set; }
        public virtual LeagueYear LeagueYear { get; set; }
    }
}