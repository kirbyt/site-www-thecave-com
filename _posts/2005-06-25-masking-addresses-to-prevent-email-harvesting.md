---
layout: post
title: 'Masking Addresses to Prevent Email Harvesting'
category: uncategorized
---

Email harvesting is a technique used by spammers to find email addresses published on web sites.  Spiders crawl the net looking for text that looks like email addresses (ex: somename@somedomain.com).

For years I have published my email address on my web sites to make it easier for people to contact me.  And as expected, over the years the amount of spam mail I receive has grown.  I received around 600 to 700 spam mails a day.  Luckily I have several layers of spam filtering enabled so less than 5% of spam makes it to my Inbox.  But today I decided I would attempt to reduce the amount of spam I receive by masking my email address.

As I mentioned spammers harvest email addresses by searching the Internet for text that matches an email pattern.  By masking an email address the spammer will have a tougher time determining if the content is in fact an email address.  So how do you mask an email address?

You can use JavaScript to mask an email address.  For example, instead of including your email address as plain text in the HTML convert each character of your email address into the appropriate ASCII value and display the ASCII value string using document.write as shown below.

    <!--document.write('&#107&#105&#114&#98&#121&#64&#116&#104&#101&#99&#97&#118&#101&#46&#99&#111&#109');// --> 

Of course doing this each time can be a pain.  A better approach is to use server-side scripting that will mask the email address for you.  That's exactly what I did for my web site using the following C# code:

    public string MaskedEmail( string email )
    {   
        string masked = MaskedStringFromString(email);   
        string javascript = @"  <!--      document.write('{0}');      // --> ";

        return String.Format( javascript, masked );
    }

    public string MaskedMailToLink( string email, string text )
    {   
        return MaskedMailToLink( email, text, String.Empty );
    }

    public string MaskedMailToLink( string email, string text, string additionalAttributes )
    {   
        string maskedEmail = MaskedStringFromString("mailto:" + email);   
        string maskedText = MaskedStringFromString(text);   
        string encodedAttr = additionalAttributes.Replace("'",@"\'");   
        string javascript = @"  <!--      document.write('{2}&lt/a>');      // --> ";

       return String.Format( javascript, maskedEmail, encodedAttr, maskedText );
    }

    public string MaskedStringFromString(string value)
    {   
        string masked = string.Empty;   
        for( int i=0; i < value.Length; i++)   {      
            masked += String.Format( "&#{0}", Convert.ToByte(value[i]) );   
        }   
        return masked;
    }
    
When I display an email address I mask it by calling the MaskedEmail method.  And I use MaskedMailToLink for those times when I want to include a mailto link.  You can see this in action on the [contact us](http://www.whitepeaksoftware.com/contacts.aspx) page for White Peak Software.
