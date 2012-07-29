﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_voting_multiple_answers : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";       
        Poll1.Title = "Favorite Sport";
        Poll1.Question = "Pick your favorite movies";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.VotingMode = PollVotingMode.MultipleAnswers;
        Poll1.MinAnswers=1; 
        phPoll1.Controls.Add(Poll1);      
    }

}