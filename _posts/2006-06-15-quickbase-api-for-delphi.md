---
layout: post
title: 'QuickBase API for Delphi'
category: programming
tags: [delphi]
---

I have been doing more [QuickBase](http://www.quickbase.com/) work lately.  I really like QuickBase but the [HTTP API](https://www.quickbase.com/up/6mztyxu8/g/rc7/en/va/QuickBaseAPI.htm) can be a bit hairy.  Intuit provides various language specific SDKs for the QuickBase API but [Delphi](http://www.borland.com/delphi) is not included.  So I'm writing my own.  \[I'll post the code to the [White Peak Software](http://www.whitepeaksoftware.com/) site as soon as it is done.\]

A challenge I encounter today was determining an appropriate data structure for a QuickBase record set.  The QuickBase API includes a DoQuery call that returns an XML document containing the results of the query.  A goal of my Delphi QuickBase SDK is to simplify API calls such as DoQuery, which means I do not want to return XML to calling Delphi code.  A Delphi friendly data structure for the QuickBase record set is needed.

After bouncing different ideas around a buddy, I started "seeing" the data structure.  I started hacking up code keeping in mind 3 primary goals:

1. The data structure must be easy to use.
2. The data structure must make the code readable.
3. The data structure must be Delphi friendly.

The end result is a set of classes which is really nothing more than a TObjectList containing TObjectList containing a field value class.  In other words, the final data structure consists of the following classes:

    TQuickBaseDataset = class(TObjectList);
    TQuickBaseRecordset = class(TObjectList);
    TQuickBaseValue = class(TObject);

A dataset contains one or more record sets which contains one of more values.  The value class is implemented to provide strong type access to the value returned from QuickBase.

So does the new data structure meet the 3 goals above?  I think so but I will leave it up to you to decide.  Here is a code snippet that queries the database and returns a record set containing 3 fields in each record.

    Qdb := TQuickBaseClient.Create(username, password);
    if Qdb.Authenticate then
    begin
        Dataset := Qdb.DoQuery(dbid, query, clist);
        for Recordset in Dataset do
        begin
            s := Recordset.Items[0].ValueAsString;
            b := Recordset.Items[1].ValueAsBoolean;
            i := Recordset.Items[2].ValueAsInteger;
        end;
    end;
    Qdb.SignOut;
    Qdb.Free;

I will be adding the ability to retrieve field values by name very soon.  This will make the code even more readable.
