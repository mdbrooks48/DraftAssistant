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
    
    public partial class Trade
    {
        public int Id { get; set; }
        public Nullable<int> LeagueYearId { get; set; }
        public Nullable<int> TraderFantasyTeamId { get; set; }
        public Nullable<short> DraftRound { get; set; }
        public Nullable<int> TradeeFantasyTeamId { get; set; }
    
        public virtual FantasyTeam FantasyTeam { get; set; }
        public virtual FantasyTeam FantasyTeam1 { get; set; }
        public virtual LeagueYear LeagueYear { get; set; }
    }
}
