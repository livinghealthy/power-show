﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_results_vote_count : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ResultStyle.DisplayVotes = OboutCheckBox1.Checked;
    }
}