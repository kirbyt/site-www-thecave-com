---
layout: post
title: "Redirect Jekyll Site To HTTPS On OpenShift"
date: 2015-07-14 14:17:53 -0400
category: programming
tags: [jekyll, web]
---
I'm preparing to roll out a new [Jekyll][jekyll] website, but unlike with my other Jekyll sites, I want each web page served up on `https`, not `http`. This means telling the server to redirect `http` request to `https`. 

Hosting this new site on [Github Pages][githubpages] isn't option because Github Pages doesn't support using a custom SSL certificate for your custom domain name. So I decided to see what it would take to host a Jekyll site on [OpenShift][openshift]. 

I was thrilled to learn that OpenShift has a [quick start cartridge for installing Jekyll][jekyllquickstart] on a new gear. With a click of a button I was able to deploy my new server instance with a boiler plate Jekyll site. I replaced the boiler plate site with the one I've been working on, and BAM! My site was up and running. The only step remaining was to force the web server to serve up the pages using `https`.

Turns out this is simple to do with OpenShift and Jekyll. First, I went over to namecheap.com and purchased a [RapidSSL certificate][rapid] with domain validation. Next, I followed the instructions from OpenShift to [generate my certificate signing request][csrhelp]. Using my newly generated CSR I activated my RapidSSL certificate over at namecheap, then I followed the instructions on OpenShift to [add the certificate to my server instance][openshifthelp].

Up to this point everything was easy peasy, and all I had left to do was figure out how to redirect the Jekyll site from `http` to `https`. Turns out this isn't difficult either.

The Jekyll website is actually just a static website hosted by Apache 2 running on an OpenShift gear. To force the redirect all I needed to do was add a *.htaccess* file to the root of my Jekyll site source code (note: the site source code is in the *source/* directory when using OpenShift) and put this rewrite rule in the file:

    RewriteEngine on  
    RewriteCond %{HTTP:X-Forwarded-Proto} !https  
    RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R,L]  

After I added the *.htaccess* file with the rewrite rule, I pushed my changes to the remote git repository running on my OpenShift gear. This launched Jekyll which re-built my static website, this time with each web page being served with `https` instead of `http`.

Including the *.htaccess* file works great when deploying the Jekyll site to OpenShift, but approach isn't unique to OpenShift. This should work for most Jekyll site hosted with Apache 2. And if for some reason Jekyll isn't including the *.htaccess* file when it builds the site, add `include: [".htaccess"]` to your *_config.yaml* file.

[jekyll]: http://jekyllrb.com
[githubpages]: https://pages.github.com
[openshift]: https://www.openshift.com
[jekyllquickstart]: https://hub.openshift.com/quickstarts/41-jekyll
[rapid]: https://www.namecheap.com/security/ssl-certificates/rapidssl/rapidssl.aspx
[csrhelp]: https://developers.openshift.com/en/managing-domains-ssl.html#_generating_a_csr_certificate_signing_request
[openshifthelp]: https://developers.openshift.com/en/managing-domains-ssl.html#using-a-custom-ssl-certificate
