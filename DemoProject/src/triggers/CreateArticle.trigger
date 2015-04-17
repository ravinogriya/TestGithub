trigger CreateArticle on Case (after update) {
	for(Case c:Trigger.new)
	{
		if(c.Status=='Create Article')
		{
			Blog__kav bk=new Blog__kav();
			bk.UrlName=c.subject;
			bk.Title=c.subject;
			bk.ValidationStatus='true';
			bk.IsVisibleInPkb=true;
			bk.Language='en_US';
			insert bk;
		}
	}
}